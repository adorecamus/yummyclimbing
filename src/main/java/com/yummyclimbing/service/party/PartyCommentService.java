package com.yummyclimbing.service.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.exception.UserInputException;
import com.yummyclimbing.mapper.party.PartyCommentMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.party.PartyCommentVO;

@Service
public class PartyCommentService {

	@Autowired
	private PartyCommentMapper partyCommentMapper;
	
	//소모임 소근소근 게시판 글 리스트 보기
	public List<PartyCommentVO> getPartyCommentList(int piNum) {
		return partyCommentMapper.getPartyCommentList(piNum);
	}
	
	//소모임 소근소근 게시판 글쓰기
	public String insertPartyComment(PartyCommentVO partyComment, int piNum) {
		partyComment.setPiNum(piNum);
		partyComment.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		String pcComment = partyComment.getPcComment();
		if(pcComment == null || pcComment.trim() == "") {
			throw new UserInputException("내용을 입력해주세요");
		}
		if(partyCommentMapper.insertPartyComment(partyComment) == 1) {
			return "글이 등록되었습니다.";
		}
		return "다시 시도해주세요.";
	}

	//소근소근 글 수정
	public int updatePartyComment(PartyCommentVO partyComment, int pcNum) {
		partyComment.setPcNum(pcNum);
		partyComment.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		return partyCommentMapper.updatePartyComment(partyComment);
	}
	
	//소근소근 글 삭제
	public int updatePartyCommentInactive(int pcNum) {
		return partyCommentMapper.updatePartyCommentInactive(pcNum);
	}

	
}
