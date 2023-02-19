package com.yummyclimbing.controller.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yummyclimbing.service.community.CommunityBoardService;
import com.yummyclimbing.vo.community.CommunityBoardPageVO;
import com.yummyclimbing.vo.community.CommunityBoardVO;
import com.yummyclimbing.vo.community.Criteria;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommunityBoardController {

	@Autowired
	private CommunityBoardService communityBoardService;
	
	// 게시판 목록 조회
	@GetMapping("/community-boards")
	@ResponseBody
//	public List<CommunityBoardVO> getBoardList(@ModelAttribute CommunityBoardVO communityBoard) {
//		return communityBoardService.getBoardList(communityBoard);
//	}
	public PageInfo<CommunityBoardVO> getBoardList(CommunityBoardVO communityBoard,
			                                       @ModelAttribute(value="pageNo") Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		PageHelper.startPage(pageNo, 10);
		return PageInfo.of(communityBoardService.getBoardList(communityBoard));
	}	
	
	// 게시판 카테고리별 조회
	@GetMapping("/community-boards/category")
	@ResponseBody
	public PageInfo<CommunityBoardVO> getCommunityBoardListByCategory(CommunityBoardVO communityBoard,
																  @ModelAttribute(value = "pageNo") Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		PageHelper.startPage(pageNo, 10);
		return PageInfo.of(communityBoardService.getBoardListByCategory(communityBoard));
	}
	
	// 게시글 조회
	@GetMapping("/community-boards/{cbNum}")
	@ResponseBody
	public CommunityBoardVO getBoard(@PathVariable int cbNum) {
		return communityBoardService.getBoard(cbNum);
	}
	
	// ------- 로그인 필요 -------
	
	// 게시글 등록
	@PostMapping("/community-board")
	@ResponseBody
	public int insertBoard(@ModelAttribute CommunityBoardVO communityBoard) throws Exception {
		return communityBoardService.insertBoard(communityBoard);
	}
	
	// 게시글 수정
	@PostMapping("/community-board/update/{cbNum}")
	@ResponseBody
	public boolean updateBoard(@ModelAttribute CommunityBoardVO communityBoard, @PathVariable int cbNum) throws IllegalStateException, IOException {
		return communityBoardService.updateBoard(communityBoard, cbNum);
	}
	
	// 게시글 삭제 
	@DeleteMapping("/community-board/delete/{cbNum}")
	@ResponseBody
	public boolean deleteBoard(@PathVariable int cbNum) {
		return communityBoardService.deleteBoard(cbNum);
	}
	
}
