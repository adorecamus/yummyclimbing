package com.yummyclimbing.controller.mountain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yummyclimbing.service.mountain.MountainCommentService;
import com.yummyclimbing.vo.mountain.MountainCommentVO;

@Controller
public class MountainCommentController {
	
	@Autowired
	MountainCommentService mountainCommentService ;
	
	//------get-----//
	//코멘트 리스트 검색
	@GetMapping("/mountain-comments/{miNum}/{pageNo}")
	@ResponseBody
//	public List<MountainCommentVO> selectMountainCommentListAndUser(@PathVariable("miNum") int miNum){
//		return mountainCommentService.selectMountainCommentListAndUser(miNum);
//	}
	public PageInfo<MountainCommentVO> selectMountainCommentListAndUser(@PathVariable(value = "miNum") int miNum, 
																		@PathVariable(value = "pageNo", required = false) Integer pageNo){
		if(pageNo==null) {
			pageNo = 1;
		}
		PageHelper.startPage(pageNo, 5);
		return PageInfo.of(mountainCommentService.selectMountainCommentListAndUser(miNum));
	}
	
	//------put-----//	
	//코멘트 등록
	@PutMapping("/mountain-comment")
	@ResponseBody
	public int insertMountainComment(@RequestBody MountainCommentVO mountainComment) {
		return mountainCommentService.insertMountainComment(mountainComment);
	}
	
	//------patch-----//
	//코멘트 업데이트
	@PatchMapping("/mountain-comment/update")
	@ResponseBody
	public int updateMountainComment(@RequestBody MountainCommentVO mountainComment) {
		return mountainCommentService.updateMountainComment(mountainComment);
	}
	
	//코멘트 삭제(비활성화)
	@PatchMapping("/mountain-comment/delete")
	@ResponseBody
	public int deleteMountainComment(@RequestBody MountainCommentVO mountainComment) {
		return mountainCommentService.deleteMountainComment(mountainComment);
	}
	
}
