package com.yummyclimbing.controller.community;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.community.CommunityBoardLikeService;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.community.CommunityBoardLikeVO;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommunityBoardLikeController {

	@Autowired
	private CommunityBoardLikeService cblService;
	
	@GetMapping("/board-likes/{cbNum}")
	@ResponseBody
	public int likeCnt(@PathVariable int cbNum, Model model) {
//		model.addAttribute("likeCnt", cblService.likeCnt(cbNum));
		return cblService.likeCnt(cbNum);
	}
	
	// ------- 로그인 필요 -------
	
	@GetMapping("/board-like/{cbNum}")
	@ResponseBody
	public boolean likeChk(@PathVariable("cbNum") int cbNum) {
		// 로그인 필요 (인터셉터에 주소 추가)
		return cblService.getLikeInfo(cbNum);
	}
	
	@PostMapping("/board-like")
	@ResponseBody
	public int updateLike(@RequestBody CommunityBoardLikeVO cbl) {
		int likeChk = cblService.likeChk(cbl);
		if(likeChk == 0) {
			cblService.likeUp(cbl);
			cblService.updateLikeChk(cbl);
		} else if (likeChk == 1) {
			cblService.updateLikeChkCancel(cbl);
			cblService.likeDown(cbl);
		}
		return likeChk;
	}
	


}
