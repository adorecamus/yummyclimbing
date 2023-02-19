package com.yummyclimbing.mapper.party;

import java.util.List;

import com.yummyclimbing.vo.party.PartyCommentVO;
import com.yummyclimbing.vo.party.PartyMemberVO;

public interface PartyCommentMapper {

	List<PartyCommentVO> getPartyCommentList(int piNum);
	int insertPartyComment(PartyCommentVO partyComment);
	int updatePartyComment(PartyCommentVO partyComment);
	int updatePartyCommentInactive(int pcNum); 
	int updateAllCommentInactive(PartyMemberVO partyMember);
}
