package com.yummyclimbing.controller.party;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.party.PartyLikeService;
import com.yummyclimbing.vo.party.PartyLikeVO;

@Controller
public class PartyLikeController {

	@Autowired
	private PartyLikeService partyLikeService;
	
	//좋아요 개수 확인
	@GetMapping("/party-like/{piNum}")
	@ResponseBody
	public int countPartyLike(@PathVariable("piNum")int piNum){
		return partyLikeService.countPartyLike(piNum);
	}
	
	//좋아요 존재 체크
	@GetMapping("/party-like/check/{piNum}")
	@ResponseBody
	public int checkPartyLike(@PathVariable("piNum")int piNum) {
		return partyLikeService.checkPartyLike(piNum);
	}
	
	//좋아요 등록
	@PostMapping("/party-like")
	@ResponseBody
	public int likeUp(@RequestBody PartyLikeVO partyLike) {
		return partyLikeService.likeUp(partyLike);
	}
	
}
