package com.yummyclimbing.mapper.community;

import com.yummyclimbing.vo.community.CommunityBoardLikeVO;

public interface CommunityBoardLikeMapper {

	// 좋아요 확인(눌렀는지 안 눌렀는지)
	int likeChk(CommunityBoardLikeVO cbl);
	
	// 좋아요 정보
	CommunityBoardLikeVO getLikeInfo(CommunityBoardLikeVO cbl);
	
	// 좋아요 등록
	int likeUp(CommunityBoardLikeVO cbl);
	
	// 좋아요 취소
	int likeDown(CommunityBoardLikeVO cbl);
	
	// 중복방지 좋아요 수정 
	void updateLikeChk(CommunityBoardLikeVO cbl);
	
	// 중복방지 좋아요 취소
	void updateLikeChkCancel(CommunityBoardLikeVO cbl);
	
	// 좋아요 수
	int likeCnt(int cbNum);
}
