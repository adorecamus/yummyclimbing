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

import com.yummyclimbing.service.party.PartyNoticeService;
import com.yummyclimbing.vo.party.PartyNoticeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PartyNoticeController {

	@Autowired
	private PartyNoticeService partyNoticeService;

	// 소모임 공지 리스트
	@GetMapping("/party-member/notice")
	@ResponseBody
	public List<PartyNoticeVO> getPartyNoticeList(@RequestParam("piNum") int piNum) {
		return partyNoticeService.selectPartyNoticeList(piNum);
	}

	// 소모임 공지사항 선택해서 상세 정보불러오기
	@GetMapping("/party-member/notice/{pnNum}")
	@ResponseBody
	public PartyNoticeVO getPartyNotice(@PathVariable("pnNum") int pnNum, @RequestParam("piNum") int piNum) {
		return partyNoticeService.selectPartyNotice(pnNum);
	}

	// 소모임 공지사항 작성
	@PostMapping("/captain/party-notice")
	@ResponseBody
	public String insertPartyNotice(@RequestBody PartyNoticeVO partyNotice, @RequestParam("piNum") int piNum) {
		return partyNoticeService.insertPartyNotice(partyNotice, piNum);
	}

	// 소모임 공지사항 수정
	@PatchMapping("/captain/party-notice/{pnNum}")
	@ResponseBody
	public int updatePartyNotice(@RequestBody PartyNoticeVO partyNotice, @PathVariable("pnNum") int pnNum,
			@RequestParam("piNum") int piNum) {
		return partyNoticeService.updatePartyNotice(partyNotice, pnNum);
	}

	// 소모임 공지사항 삭제(비활성화)
	@DeleteMapping("/captain/party-notice/{pnNum}")
	@ResponseBody
	public int updatePartyNoticeActive(@PathVariable("pnNum") int pnNum, @RequestParam("piNum") int piNum) {
		return partyNoticeService.deletePartyNotice(pnNum);
	}
}
