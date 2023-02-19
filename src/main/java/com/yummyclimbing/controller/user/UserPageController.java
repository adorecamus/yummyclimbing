package com.yummyclimbing.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.party.PartyMemberService;
import com.yummyclimbing.service.user.UserPageService;
import com.yummyclimbing.vo.user.UserPageVO;

@Controller
public class UserPageController {

	@Autowired
	private UserPageService userPageService;
	@Autowired
	private PartyMemberService partyMemberService;
	
	//가입한 소모임
	@GetMapping("/user-party/{uiNum}")
	@ResponseBody
	public List<UserPageVO> getUserParty(@PathVariable("uiNum") int uiNum) {
		return userPageService.getMyParty(uiNum);
	}

	//좋아요 소모임
	@GetMapping("/user-party-like/{uiNum}")
	@ResponseBody
	public List<UserPageVO> getUserLikeParty(@PathVariable("uiNum") int uiNum){
		return userPageService.getLikeParty(uiNum);
	}
	
	//좋아요 산
	@GetMapping("/user-mountain-like/{uiNum}")
	@ResponseBody
	public List<UserPageVO> getUserLikeMountain(@PathVariable("uiNum") int uiNum){
		return userPageService.getLikeMountain(uiNum);
	}
	
	//좋아요 커뮤니티 게시글
	@GetMapping("/user-board-like/{uiNum}")
	@ResponseBody
	public List<UserPageVO> getUserLikeBoard(@PathVariable("uiNum") int uiNum){
		return userPageService.getLikeBoard(uiNum);
	}
	
	//내가 작성한 커뮤니티 글 
	@GetMapping("/user-board/{uiNum}")
	@ResponseBody
	public List<UserPageVO> getUserBoard(@PathVariable("uiNum") int uiNum){
		return userPageService.getMyBoard(uiNum);
	}
}
