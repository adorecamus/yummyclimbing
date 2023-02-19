package com.yummyclimbing.vo.mountain;

import lombok.Data;

@Data
public class MountainUserLikeVO {
	private int mulNum; // P.K.
	private int miNum; // FOREIGN KEY
	private int uiNum; // FOREIGN KEY // unique(miNum, uiNum)
	private int mulCnt; // 좋아요 활성화여부(1=enable / -1=disable)
}
