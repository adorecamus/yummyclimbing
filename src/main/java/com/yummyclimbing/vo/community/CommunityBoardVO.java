package com.yummyclimbing.vo.community;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityBoardVO {

	private int cbNum;   		// 게시판 번호 (기본키)
	private String cbCategory;  // 게시판 카테고리
	private String cbTitle;		// 제목
	private String cbContent;	// 내용
	private String cbCredat;	// 등록일자
	private String cbCretim;	// 등록시간
	private String cbLmodat;	// 수정일자
	private String cbLmotim;	// 수정시간
	private int cbActive;		// 활성화 or 비활성화
	private int uiNum;			// 유저 번호 (외래키)
	private String uiNickname;	// 작성자
	private int cbViewCnt;		// 조회 수
	
	private int commentCnt;		// 댓글 수
	
	private List<MultipartFile> multipartFiles;	// 파일
	private List<Integer> filesToDelete;		// 등록한 파일 중 지울 파일
	
}
