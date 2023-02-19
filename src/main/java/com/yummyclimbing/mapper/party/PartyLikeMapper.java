package com.yummyclimbing.mapper.party;

import java.util.List;

import com.yummyclimbing.vo.party.PartyLikeVO;

public interface PartyLikeMapper {

	//좋아요 정보
	PartyLikeVO getLikeInfo(PartyLikeVO partyLike);
		
	//좋아요 등록
	int likeUp(PartyLikeVO partyLike);
	
	//좋아요 취소
	int likeDown(PartyLikeVO partyLike);
	
	//좋아요 수
	int likeCnt(int piNum);
	
	//좋아요 중복 확인
	List<PartyLikeVO> likeCheck(PartyLikeVO partyLike);

}
