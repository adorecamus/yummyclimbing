package com.yummyclimbing.service.party;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.yummyclimbing.exception.AuthException;
import com.yummyclimbing.exception.UserInputException;
import com.yummyclimbing.mapper.party.PartyInfoMapper;
import com.yummyclimbing.mapper.party.PartyMemberMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.party.PartyInfoVO;
import com.yummyclimbing.vo.party.PartyMemberVO;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class PartyInfoService {

	private final PartyInfoMapper partyInfoMapper;

	private final PartyMemberMapper partyMemberMapper;
	
	private final Random random;
	
	private final String wrongInputMessage = "잘못된 입력입니다.";
	
	// 소소모임 리스트
	public List<PartyInfoVO> getPartyList(PartyInfoVO partyInfo) {
		return partyInfoMapper.selectPartyInfoList(partyInfo);
	}

	// 추천 소소모임 리스트
	public List<PartyInfoVO> getRecommendedPartyList(PartyInfoVO partyInfo) {
		return partyInfoMapper.selectRecommendedPartyList(partyInfo);
	}

	// 개별 소소모임 화면
	public PartyInfoVO getPartyInfo(int piNum) {
		return partyInfoMapper.selectPartyInfo(piNum);
	}

	// 개별 소소모임 화면 - 부원 정보 보기
	public List<UserInfoVO> getPartyMembers(int piNum) {
		return partyMemberMapper.selectPartyMemberList(piNum);
	}

	// 소소모임 생성
	public int createParty(PartyInfoVO partyInfo) {
		if (partyInfo.getMntnm() == null || partyInfo.getMntnm().trim().equals("")) {
			throw new UserInputException(wrongInputMessage);
		}
		checkParameter(partyInfo);
		partyInfo.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		partyInfo.setPiIcon(random.nextInt(44) + 1);			// 랜덤 아이콘 넣어줌
		if (partyInfoMapper.insertPartyInfo(partyInfo) == 1) { 	// 소소모임 insert 성공한 경우
			int piNum = partyInfo.getPiNum();					// insert한 소소모임num 가져옴
			PartyMemberVO captain = new PartyMemberVO(piNum, partyInfo.getUiNum());
			captain.setPmGrade(1);
			if (partyMemberMapper.insertPartyMember(captain)) { // 대장을 PARTY_MEMBER 테이블에 insert
				return piNum;									// 생성된 소모임num 리턴
			}
		}
		return 0;
	}

	// 소소모임 수정
	public boolean updatePartyInfo(PartyInfoVO partyInfo, int piNum) {
		partyInfo.setPiNum(piNum);
		checkParameter(partyInfo);
		if (partyMemberMapper.selectMemberCount(piNum).getMemNum() > partyInfo.getPiMemberCnt()) {
			throw new UserInputException("현재 부원 수보다 정원을 적게 설정할 수 없습니다.");
		}
		if (partyInfoMapper.updatePartyInfo(partyInfo) == 1) {
			changePartyCompleteStatus(piNum);
			return true;
		}
		return false;
	}
	
	// 파라미터로 받은 소모임 정보 체크
	public boolean checkParameter(PartyInfoVO partyInfo) {
		Date yesterday = Date.from(Instant.now().minus(Duration.ofDays(1)));
		String piName = partyInfo.getPiName();
		String piExpdat = partyInfo.getPiExpdat();
		String piMeetingTime = partyInfo.getPiMeetingTime();
		String piProfile = partyInfo.getPiProfile();
		if (piName == null || piName.trim().equals("") ||
				piExpdat == null || piExpdat.trim().equals("") ||
				piMeetingTime == null || piMeetingTime.trim().equals("") ||
				piProfile == null || piProfile.trim().equals("")) {
			throw new UserInputException(wrongInputMessage);
		}
		try {
			if (new SimpleDateFormat("yyyy-MM-dd").parse(piExpdat)
					.compareTo(yesterday) <= 0) {
				throw new UserInputException("오늘 이전 날짜를 모임날짜로 설정할 수 없습니다.");
			}
		} catch (ParseException e) {
			throw new UserInputException(wrongInputMessage);
		}
		return true;
	}
	
	// 소소모임 부원 탈퇴/차단/차단 해제
	public boolean changePartyMemberStatus(PartyMemberVO partyMember, int piNum){
		int uiNum = HttpSessionUtil.getUserInfo().getUiNum();
		if (partyMember.getPmNums().contains(uiNum)) {
			throw new UserInputException("대장은 내보낼 수 없습니다.");
		}
		if (partyMemberMapper.updatePartyMemberActive(partyMember) == partyMember.getPmNums().size()) {
			changePartyCompleteStatus(piNum);
			return true;
		};
		return false;
	}
	
	// 차단한 소소모임 부원 리스트
	public List<UserInfoVO> getBlockedPartyMembers(int piNum) {
		return partyMemberMapper.selectBlockedPartyMemberList(piNum);
	}

	// 소소모임 삭제(비활성화)
	public boolean deletePartyInfo(int piNum) {
		return partyInfoMapper.updatePartyActive(piNum) == 1;
	}
	
	// 모집완료 상태 변경
	public void changePartyCompleteStatus(int piNum) {
		if (partyInfoMapper.selectIfPartyExpired(piNum) != 1) {			// 만료된 소소모임이 아닌지 조회하고
			partyInfoMapper.updatePartyCompleteByMemberCount(piNum);	// 부원 수와 정원 비교해서 모집완료 상태 변경
		}
	}

	// 모집기한 만료 소소모임 자동 모집완료
	public boolean completePartyByExpdat() {
		// 오늘 날짜가 만료일인 소소모임을 모집완료로 변경
		Date yesterday = Date.from(Instant.now().minus(Duration.ofDays(1)));
		String today = new SimpleDateFormat("yyyy-MM-dd").format(yesterday);
		log.debug("~~~~~~~~~~~today=>{}", today);
		int partyCount = partyInfoMapper.selectExpiredParty(today);
		log.debug("partyCount=>{}", partyCount);
		int completeResult = partyInfoMapper.updatePartyCompleteByExpdat(today);
		log.debug("completeResult=>{}", completeResult);
		if (partyCount != completeResult) {
			throw new RuntimeException("완료 대상 모임 개수와 완료 실행 개수가 일치하지 않습니다.");
		}
		return partyCount == completeResult;
	}
	
	// 소소모임 대장 여부 확인
	public void checkCaptainAuth() {
		PartyInfoVO captain = new PartyInfoVO();
		captain.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		captain.setPiNum(Integer.parseInt(HttpSessionUtil.getRequest().getParameter("piNum")));
		if (partyInfoMapper.selectCaptainNum(captain) == null) {
			log.debug("~~~~~~~~~어라 방장 아니구만~~~~~~~~~~");
			throw new AuthException("대장 권한이 없습니다.");
		}
	}
	
	// 산별 소소모임 리스트
	public List<PartyInfoVO> selectPartyInfoListForMntnm(String mntnm){		
		return partyInfoMapper.selectPartyInfoListForMntnm(mntnm);
	}

}
