package com.yummyclimbing.vo.community;

import lombok.Data;

@Data
public class CommunityBoardFileVO {

	private int cbfNum; 			// 파일 번호 (기본키)
	private int cbNum;				// 게시판 번호 (외래키)
	private String cbfName; 		// 파일명
	private String cbfPath; 		// 파일 경로
	private String cbfUuid;			// 파일 UUID
	
}

