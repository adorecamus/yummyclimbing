package com.yummyclimbing.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yummyclimbing.vo.community.CommunityBoardVO;
import com.yummyclimbing.vo.community.Criteria;

public interface CommunityBoardMapper {

	// 게시판 목록 조회
	List<CommunityBoardVO> selectCommunityBoardList(CommunityBoardVO communityBoard);
	
	// 게시판 카테고리별 조회
	List<CommunityBoardVO> selectCommunityBoardListByCategory(CommunityBoardVO communityBoard);
	
	// 게시판 목록 페이징
	List<CommunityBoardVO> selectListWithPage(Criteria cri);
	
	int getTotalCnt(Criteria cri);
	
	// 게시물 조회
	CommunityBoardVO selectCommunityBoard(int cbNum);
	
	// 게시물 등록
	int insertCommunityBoard(CommunityBoardVO communityBoard);
	
	// 게시물 삭제
	int deleteCommunityBoard(int cbNum);
	
	// 게시물 수정
	int updateCommunityBoard(CommunityBoardVO communityBoard);
	
	// 게시물 조회수
	int updateViewCnt(int cbNum);
	
	// 해당 게시물 번호에 증가나 감소를 의미하는 amount 변수에 파라미터를 받을 수 있도록 처리 -> 댓글이 등록되면 1증가, 삭제되면 1감소 
//	void updateCommentCnt(@Param("cbNum") int cbNum, @Param("amount") int amount);
	int getTotal();

}
