package com.yummyclimbing.vo.user;

import lombok.Data;

@Data
public class UserPageVO {

	private int piNum;			//소모임 번호
	private String piName;		//소모임 이름
	private int uiNum;			//유저 번호
	private int pmGrade;		//유저 회원등급(대장:1, 일반부원:0)
	
	private int miNum;			//산 번호
	private String mntnm;		//산 이름
	
	private int cbNum;   		// 게시글 번호
	private String cbCategory;  // 게시글 카테고리
	private String cbTitle;		// 제목
	private String cbContent;	// 내용
	private String cbCredat;	// 등록일자
	
	private int cblNum; // 게시글 좋아요 번호
	private int cblCnt; // 좋아요 (눌렀을 경우 1, 아니면 0)
}
