package com.yummyclimbing.vo.party;

import lombok.Data;

@Data
public class PartyNoticeVO {

	private int pnNum;				//소모임 공지사항 번호(프라임키)
	private String pnContent;	//소모임 공지사항 내용
	private String pnCredat;		//소모임 공지사항 등록일
	private String pnLmodat;	//소모임 공지사항 수정일
	private String pnCretim;		//소모임 공지사항 등록시간
	private String pnLmotim;	//소모임 공지사항 수정시간
	private int pnActive;			//소모임 공지사항 등록시 1->삭제시 0
	
	private int piNum;				//소모임 번호(외래키)
	private int uiNum;				//유저 번호(외래키)
	private String uiNickname;		//유저 닉네임	
}
