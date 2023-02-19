package com.yummyclimbing.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.mapper.community.CommunityBoardCommentMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.community.CommunityBoardCommentVO;

@Service
public class CommunityBoardCommentService {

	@Autowired
	private CommunityBoardCommentMapper cbcMapper;	
	
	// 댓글 목록 조회 
	public List<CommunityBoardCommentVO> getCommentList(int cbNum){
		return cbcMapper.selectCommentList(cbNum);
	}
	
	// 댓글 등록
	public int insertComment(CommunityBoardCommentVO cbcVO) {
		cbcVO.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		return cbcMapper.insertComment(cbcVO);
	}
	
	// 댓글 수정
	public int updateComment(CommunityBoardCommentVO cbcVO, int cbcNum) {
		cbcVO.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		cbcVO.setCbcNum(cbcNum);
		return cbcMapper.updateComment(cbcVO);
	}
	
	// 댓글 삭제
	public int deleteComment(int cbcNum) {
		return cbcMapper.updateCommentActive(cbcNum);
	}
	
}
