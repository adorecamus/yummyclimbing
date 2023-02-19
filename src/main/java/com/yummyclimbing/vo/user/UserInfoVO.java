package com.yummyclimbing.vo.user;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserInfoVO {
	private int uiNum;	//유저 넘버 (프라임키)
	private String uiId;	//유저 아이디 (유니크)
	private String uiPwd;	// 유저 패스워드 (암호화 설정할것)
	private String uiName;	//유저 이름
	private String uiNickname;	// 유저 닉네임(유니크) 
	private String uiAddr;	// 유저 주소 (다음API를 설정하여 주소찾기)
	private String uiZonecode;	//우편번호
	private String uiGrade;	// 관리자 여부
	private int uiAge;	//유저 연령
	private String uiGender;	//유저 성별
	private String uiImgPath;	//유저 프로필 사진??
	private String uiCredat;	//아이디 생성일자 8자
	private String uiLmodat;	//수정일자
	private int uiActive;	//활성화 or 비활성화
	private String uiQuestion; // 계정 찾을때의 질문
	private String uiAnswer; // 질문에 대한 답변
	
	private MultipartFile multipartFile;
	
	private int pmGrade;	//방장 여부 (소모임 멤버 정보 볼 떄)
	private int pmNum;		//멤버 기본키(방장이 멤버 관리할 때)
}
