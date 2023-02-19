package com.yummyclimbing.mapper.party;

import java.util.List;

import com.yummyclimbing.vo.party.PartyNoticeVO;

public interface PartyNoticeMapper {

	//소모임 공지사항
	List<PartyNoticeVO> selectPartyNoticeList(int piNum);
	PartyNoticeVO selectPartyNotice(int pbnNum);
	int insertPartyNotice(PartyNoticeVO partyBoardNotice);
	int updatePartyNotice(PartyNoticeVO partyBoardNotice);
	int updatePartyNoticeActive(int pbnNum);
}

