package com.yummyclimbing.controller.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yummyclimbing.service.party.PartyInfoService;
import com.yummyclimbing.vo.party.PartyInfoVO;
import com.yummyclimbing.vo.party.PartyMemberVO;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PartyInfoController {

	@Autowired
	private PartyInfoService partyInfoService;

	// 소소모임 리스트
	@GetMapping("/party-infos")
	public PageInfo<PartyInfoVO> getPartyList(PartyInfoVO partyInfo, @ModelAttribute(value="pageNo") Integer pageNo) {	
		if(pageNo == null){
			pageNo = 1;
		}
		PageHelper.startPage(pageNo, 15);
		
		return PageInfo.of(partyInfoService.getPartyList(partyInfo));
	}
	
	// 추천 소소모임 리스트
	@GetMapping("/party-infos/recommended")
	public List<PartyInfoVO> getRecommendedPartyList(PartyInfoVO partyInfo) {
		return partyInfoService.getRecommendedPartyList(partyInfo);
	}
	
	// 산에 속한 소소모임 리스트
	@GetMapping("/party-infos/mountain/{mntnm}/{pageNo}")
	public PageInfo<PartyInfoVO> getPartyInfosForMntnm(@PathVariable(value="mntnm") String mntnm,
												       @PathVariable(value="pageNo", required = false) Integer pageNo){
		if(pageNo==null) {
			pageNo = 1;
		}
		PageHelper.startPage(pageNo, 3);
		return PageInfo.of(partyInfoService.selectPartyInfoListForMntnm(mntnm));
	}
	
	// ------- 로그인 필요 -------
	
	// 개별 소소모임 화면
	@GetMapping("/party-info/{piNum}")
	public PartyInfoVO getPartyInfo(@PathVariable("piNum") int piNum) {
		return partyInfoService.getPartyInfo(piNum);
	}

	// 소소모임 부원 리스트
	@GetMapping("/party-info/members/{piNum}")
	public List<UserInfoVO> getPartyMembers(@PathVariable("piNum") int piNum) {
		return partyInfoService.getPartyMembers(piNum);
	}

	// 소소모임 생성
	@PostMapping("/party-info")
	public int createParty2(@RequestBody PartyInfoVO partyInfo) {
		return partyInfoService.createParty(partyInfo);
	}
	
	// ------- 대장 권한 필요 -------

	// 소소모임 수정
	@PatchMapping("/captain/party-info")
	public boolean updatePartyInfo(@RequestBody PartyInfoVO partyInfo, @RequestParam("piNum") int piNum) {
		return partyInfoService.updatePartyInfo(partyInfo, piNum);
	}
	
	// 소소모임 멤버 탈퇴/차단/차단 해제
	@PatchMapping("/captain/party-info/members")
	public boolean changePartyMemberStatus(@RequestBody PartyMemberVO partyMember, @RequestParam("piNum") int piNum) {
		return partyInfoService.changePartyMemberStatus(partyMember, piNum);
	}
	
	// 차단된 소소모임 부원 리스트
	@GetMapping("/captain/party-info/members/blocked")
	public List<UserInfoVO> getBlockedPartyMembers(@RequestParam("piNum") int piNum) {
		return partyInfoService.getBlockedPartyMembers(piNum);
	}

	// 소소모임 삭제(비활성화)
	@DeleteMapping("/captain/party-info")
	public boolean deletePartyInfo(@RequestParam("piNum") int piNum) {
		return partyInfoService.deletePartyInfo(piNum);
	}
	
}
