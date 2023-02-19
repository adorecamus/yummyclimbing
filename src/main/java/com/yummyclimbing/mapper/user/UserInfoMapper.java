package com.yummyclimbing.mapper.user;

import com.yummyclimbing.vo.user.UserInfoVO;

public interface UserInfoMapper {

	UserInfoVO loginUserInfo(UserInfoVO userInfo);	//로그인
	UserInfoVO selectUserInfo(int uiNum);			// 정보가져오기 
	UserInfoVO findUserId(UserInfoVO userInfo);		//아이디 찾기
	int findUserPwd(UserInfoVO userInfo);			//비번 초기화
	int profileUpload(UserInfoVO userInfo);			
	int insertUserInfo(UserInfoVO userInfo);		//회원가입
	UserInfoVO selectUserInfoById(String uiId);		//아이디 중복검사
	UserInfoVO selectUserInfoByNickname(String uiNickname);	//닉네임 중복ㄱ검사
	int updateUserInfo(UserInfoVO userInfo);		//정보수정 
	int deleteUserInfo(int uiNum);					//회원탈퇴
}
