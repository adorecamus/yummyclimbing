package com.yummyclimbing.controller.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.party.PartyCommentService;
import com.yummyclimbing.vo.party.PartyCommentVO;

@Controller
public class PartyCommentController {

	@Autowired
	private PartyCommentService partyCommentService;

	@GetMapping("/party-member/comments")
	@ResponseBody
	public List<PartyCommentVO> getPartyCommentList(@RequestParam("piNum") int piNum) {
		return partyCommentService.getPartyCommentList(piNum);
	}

	@PostMapping("/party-member/comments")
	@ResponseBody
	public String insertPartyComment(@RequestBody PartyCommentVO partyComment, @RequestParam("piNum") int piNum) {
		return partyCommentService.insertPartyComment(partyComment, piNum);
	}

	@PatchMapping("/party-member/comments/{pcNum}")
	@ResponseBody
	public int updatePartyComment(@RequestBody PartyCommentVO partyComment, @PathVariable("pcNum") int pcNum,
			@RequestParam("piNum") int piNum) {
		return partyCommentService.updatePartyComment(partyComment, pcNum);
	}

	@DeleteMapping("/party-member/comments/{pcNum}")
	@ResponseBody
	public int deletePartyComment(@PathVariable("pcNum") int pcNum, @RequestParam("piNum") int piNum) {
		return partyCommentService.updatePartyCommentInactive(pcNum);
	}

}
