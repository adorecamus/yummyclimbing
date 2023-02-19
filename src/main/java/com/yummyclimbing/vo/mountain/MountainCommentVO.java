package com.yummyclimbing.vo.mountain;

import lombok.Data;

@Data
public class MountainCommentVO {

	//-------Field-------//
	private int mcNum; // PK
	private int miNum; // FOREIGN KEY
	private int uiNum; // FOREIGN KEY
	private String mcComment; // 댓글 내용
	private int mcActive; // 활성화 여부
	private String mcCredat; // 작성일자
	private String mcLmodat; // 수정일자
	private String mcCretim; // 작성시간
	private String mcLmotim; // 수정시간
	
	//----------------------//
	
	private String mntnm; // 산이름 unique
	private String uiNickname;	// 유저 닉네임(유니크)
	private String uiImgPath;	//유저 프로필 사진??
}
