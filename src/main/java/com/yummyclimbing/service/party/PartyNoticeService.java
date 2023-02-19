package com.yummyclimbing.service.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.exception.UserInputException;
import com.yummyclimbing.mapper.party.PartyNoticeMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.party.PartyNoticeVO;

@Service
public class PartyNoticeService {

	@Autowired
	private PartyNoticeMapper partyNoticeMapper;

	// 소모임 공지사항 리스트
	public List<PartyNoticeVO> selectPartyNoticeList(int piNum) {
		return partyNoticeMapper.selectPartyNoticeList(piNum);
	}

	// 소모임 공지사항 선택해서 상세 정보불러오기
	public PartyNoticeVO selectPartyNotice(int pnNum) {
		return partyNoticeMapper.selectPartyNotice(pnNum);
	}

	// 소모임 공지사항 작성
	public String insertPartyNotice(PartyNoticeVO partyNotice, int piNum) {
		partyNotice.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		partyNotice.setPiNum(piNum);
		String pnContent = partyNotice.getPnContent();
		if (partyNoticeMapper.selectPartyNoticeList(piNum).size() < 10) {
			if(pnContent == null || pnContent.trim() == "") {
				throw new UserInputException("내용을 입력해주세요.");
			}
			if (partyNoticeMapper.insertPartyNotice(partyNotice) == 1) {
				return "공지가 등록되었습니다.";
			}
			return "다시 시도해주세요.";
		}
		return "더이상 공지를 등록할 수 없습니다.(최대 10개)";
	}

	// 소모임 공지사항 수정
	public int updatePartyNotice(PartyNoticeVO partyNotice, int pnNum) {
		partyNotice.setPnNum(pnNum);
		return partyNoticeMapper.updatePartyNotice(partyNotice);
	}

	// 소모임 공지사항 삭제(비활성화됨)
	public int deletePartyNotice(int pnNum) {
		return partyNoticeMapper.updatePartyNoticeActive(pnNum);
	}
}
