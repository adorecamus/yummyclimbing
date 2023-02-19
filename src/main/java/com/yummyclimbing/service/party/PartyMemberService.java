package com.yummyclimbing.service.party;

import org.springframework.stereotype.Service;

import com.yummyclimbing.exception.AuthException;
import com.yummyclimbing.mapper.party.PartyCommentMapper;
import com.yummyclimbing.mapper.party.PartyInfoMapper;
import com.yummyclimbing.mapper.party.PartyMemberMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.party.PartyMemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class PartyMemberService {

	private PartyMemberMapper partyMemberMapper;

	private PartyCommentMapper partyCommentMapper;

	private PartyInfoMapper partyInfoMapper;

	// 소소모임 회원 가입
	public String joinPartyMember(PartyMemberVO partyMember) {
		int piNum = partyMember.getPiNum();
		PartyMemberVO memberCount = partyMemberMapper.selectMemberCount(piNum);
		if (partyInfoMapper.selectIfPartyExpired(piNum) == 1					// 모집기한 만료거나
				|| memberCount.getMemNum() == memberCount.getPiMemberCnt()) {	// 정원이 다 찬 경우
			throw new AuthException("모집완료된 소소모임입니다.");
		}
		
		String message = "다시 시도해주세요.";
		
		partyMember.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		PartyMemberVO memberCheck = partyMemberMapper.selectMemberAuth(partyMember);
		if (memberCheck == null) {
			partyMember.setPmGrade(0);
			log.debug("memberCheck=>{}", memberCheck);
			if (partyMemberMapper.insertPartyMember(partyMember)) {
				message = "소소모임에 가입되었습니다.";
			}
		} else {
			if (memberCheck.getPmGrade() == 1) {
				throw new AuthException("해당 소소모임의 방장입니다.");
			}
			int pmActive = memberCheck.getPmActive();
			if (pmActive == 0) {
				if (partyMemberMapper.rejoinParty(partyMember) == 1) {
					message = "소소모임에 재가입되었습니다. 이제 떠나지 않으실 거죠? T_T";
				}
			} else if (pmActive == 1) {
				throw new AuthException("이미 가입한 부원입니다.");
			} else if (pmActive == -1) {
				return "소소모임에 가입하실 수 없습니다";
			}
		}
		partyInfoMapper.updatePartyCompleteByMemberCount(piNum);
		return message;
	}
	
	// 소소모임 회원 탈퇴(비활성화)
	public boolean quitPartyMember(int piNum) {
		PartyMemberVO partyMember = new PartyMemberVO(
				piNum, HttpSessionUtil.getUserInfo().getUiNum());
		if (partyMemberMapper.selectMemberAuth(partyMember).getPmGrade() == 1) {
			throw new AuthException("방장은 탈퇴할 수 없습니다.");
		}
		if (partyMemberMapper.quitPartyMember(partyMember) == 1) {
			partyCommentMapper.updateAllCommentInactive(partyMember);
			if (partyInfoMapper.selectIfPartyExpired(piNum) != 1) {
				partyInfoMapper.updatePartyCompleteByMemberCount(piNum);
			}
			return true;
		}
		return false;
	}

	// 소소모임 권한(대장/부원) 확인
	public PartyMemberVO checkMemberAuth() {
		PartyMemberVO checkMember = new PartyMemberVO(
				Integer.parseInt(HttpSessionUtil.getRequest().getParameter("piNum")),
				HttpSessionUtil.getUserInfo().getUiNum());
		PartyMemberVO memberAuth = partyMemberMapper.selectMemberAuth(checkMember);
		if (memberAuth == null) {
			throw new AuthException("부원이 아닙니다.");
		}
		return memberAuth;
	}

}
