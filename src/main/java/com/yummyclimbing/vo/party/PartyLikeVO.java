package com.yummyclimbing.vo.party;

import lombok.Data;

@Data
public class PartyLikeVO {

	private int plNum;			//소모임 좋아요 한 기본키(프라임키)
	private int plActive;		//좋아요 누르면 1, 아니면 0
	
	private int uiNum;			//유저 번호(외래키)
	private int piNum;			//소모임 번호(외래키)
	
}
