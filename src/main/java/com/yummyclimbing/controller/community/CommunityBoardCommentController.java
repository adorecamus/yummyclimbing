package com.yummyclimbing.controller.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yummyclimbing.service.community.CommunityBoardCommentService;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.community.CommunityBoardCommentVO;
import com.yummyclimbing.vo.user.UserInfoVO;

@Controller
public class CommunityBoardCommentController {

	@Autowired
	private CommunityBoardCommentService cbcService;

	// 댓글 목록 조회
	@GetMapping("/community-comments/{cbNum}/{pageNo}")
	@ResponseBody
//	public List<CommunityBoardCommentVO> getCommentList(@PathVariable("cbNum") int cbNum) {
//		return cbcService.getCommentList(cbNum);
//	}
	public PageInfo<CommunityBoardCommentVO> getCommentList(@PathVariable(value = "cbNum") int cbNum,
															@PathVariable(value = "pageNo", required = false) Integer pageNo) {		
		if(pageNo == null) {
			pageNo = 1;
		}
		PageHelper.startPage(pageNo, 5);
		return PageInfo.of(cbcService.getCommentList(cbNum));
	}

	// ------- 로그인 필요 -------
	
	// 댓글 등록
	@PostMapping("/community-comment/insert")
	@ResponseBody
	public int insertComment(@RequestBody CommunityBoardCommentVO cbcVO) {
		//AuthInterceptorForAPI에 주소 추가
		return cbcService.insertComment(cbcVO);
	}

	// 댓글 수정
	@PatchMapping("/community-comment/update/{cbcNum}")
	@ResponseBody 
	public int updateComment(@RequestBody CommunityBoardCommentVO cbcVO, @PathVariable("cbcNum")int cbcNum) { 
		//AuthInterceptorForAPI에 주소 추가
		return cbcService.updateComment(cbcVO, cbcNum);
	}

	// 댓글 삭제
	@DeleteMapping("/community-comment/delete/{cbcNum}")
	@ResponseBody
	public int deleteComment(@PathVariable("cbcNum") int cbcNum) {
		//AuthInterceptorForAPI에 주소 추가
		return cbcService.deleteComment(cbcNum);
	}

}
