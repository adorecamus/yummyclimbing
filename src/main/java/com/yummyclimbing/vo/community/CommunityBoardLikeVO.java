package com.yummyclimbing.vo.community;

import lombok.Data;

@Data
public class CommunityBoardLikeVO {

	private int cblNum; // 게시글 좋아요 번호 (기본키)
	private int cbNum; // 게시글 번호(외래키)
	private int uiNum; // 유저 번호 (외래키)
	private int cblCnt; // 좋아요 (눌렀을 경우 1, 아니면 0)
}
