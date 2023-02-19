package com.yummyclimbing.vo.user;

import lombok.Data;

@Data
public class UserChallengeVO {

	private int ucNum; //챌린지 번호
	private String ucChallenge;	//챌린지 내용
	private String ucCredat;	//업데이트일
	private String ucLmodat;	//수정일
	
//	userInfo에서 받아온 외부키
	private int uiNum;
	
}
