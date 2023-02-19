package com.yummyclimbing.controller.user;

import java.io.IOException;

import javax.security.auth.message.AuthException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.party.PartyMemberService;
import com.yummyclimbing.service.user.UserInfoService;
import com.yummyclimbing.vo.party.PartyMemberVO;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private PartyMemberService partyMemberService;

//	로그인
	@PostMapping("/login")
	public @ResponseBody UserInfoVO login(@RequestBody UserInfoVO userInfo, HttpSession session) {
		UserInfoVO loginUserInfo = userInfoService.selectUserInfo(userInfo);
		if (loginUserInfo != null && loginUserInfo.getUiActive() == 1) {
			session.setAttribute("userInfo", loginUserInfo);
			loginUserInfo.setUiPwd(null);
		}
		log.debug("loginUserInfo=>{}", loginUserInfo);
		return loginUserInfo;
	}

//  회원 Id 찾기	
	@PostMapping("/find-id")
	public @ResponseBody UserInfoVO findId(@RequestBody UserInfoVO userInfo) {
		return userInfoService.findId(userInfo);
	}

//  회원 PWD 찾기
	@PatchMapping("/find-pwd")
	public @ResponseBody int findPwd(@RequestBody UserInfoVO userInfo) {
		return userInfoService.findPwd(userInfo);
	}

//	회원가입
	@PostMapping("/sign-up")
	public @ResponseBody int addUserInfo(@RequestBody UserInfoVO userInfo) {
		return userInfoService.insertUserInfo(userInfo);
	}

//	회원가입 시 아이디 중복 체크
	@GetMapping("/sign-up/checkId/{uiId}")
	public @ResponseBody boolean existId(@PathVariable("uiId") String uiId) {
		return userInfoService.existId(uiId);
	}

//	회원가입 시 닉네임 중복 체크		
	@GetMapping("/sign-up/checkNickname/{uiNickname}")
	public @ResponseBody boolean existNickname(@PathVariable("uiNickname") String uiNickname) {
		return userInfoService.existNickname(uiNickname);
	}

	
	
	
//	회원정보수정
	@PatchMapping("/user-info/update/{uiNum}")
	public @ResponseBody boolean modifyUserInfo(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum)
			throws AuthException {
		return userInfoService.updateUserInfo(userInfo, uiNum);
	}

//	회원 사진업로드

	
	
	 @PostMapping("/user-info/file/{uiNum}")
	 public @ResponseBody boolean updateProfile(@ModelAttribute UserInfoVO userInfo, @PathVariable("uiNum") int uiNum) throws IllegalStateException, IOException { 
		 return userInfoService.profileUpload(userInfo, uiNum);
	 }
	 
	 
	 
//	정보수정시 회원비번 확인
	@PostMapping("/user-info/{uiNum}")
	public @ResponseBody boolean checkPassword(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum,
			HttpSession session) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("userInfo");
		if (sessionUserInfo == null || sessionUserInfo.getUiNum() != uiNum) {
			throw new RuntimeException("잘못된 접근입니다.");
		}
		userInfo.setUiNum(uiNum);
		return userInfoService.checkPassword(userInfo, sessionUserInfo.getUiNum());
	}

	// 회원탈퇴 비번확인 후 창 이동
	@DeleteMapping("/user-info/{uiNum}")
	public @ResponseBody boolean deleteCheckUserInfo(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum,
			HttpSession session) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("userInfo");
		if (sessionUserInfo == null || sessionUserInfo.getUiNum() != uiNum) {
			throw new RuntimeException("잘못된 접근입니다.");
		}
		userInfo.setUiNum(uiNum);
		return userInfoService.checkPassword(userInfo, uiNum);
	}

	// 회원탈퇴 확정 시
	@DeleteMapping("/user-info/delete/{uiNum}")
	public @ResponseBody boolean deleteUserInfo(@PathVariable("uiNum") int uiNum) {
		return userInfoService.deleteUserInfo(uiNum);
	}

}
