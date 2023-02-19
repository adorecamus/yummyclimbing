package com.yummyclimbing.mapper.community;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.yummyclimbing.vo.community.CommunityBoardCommentVO;

public interface CommunityBoardCommentMapper {
	
	// 댓글 목록 조회
	List<CommunityBoardCommentVO> selectCommentList(int cbNum);
	
	// 댓글 등록
	int insertComment(CommunityBoardCommentVO cbcVO);
	
	// 댓글 수정 
	int updateComment(CommunityBoardCommentVO cbcVO);
	
	// 댓글 삭제(비활성화)
	int updateCommentActive(int cbcNum);

}
