package com.yummyclimbing.vo.party;

import lombok.Data;

@Data
public class PartyCommentVO {

	private int pcNum;				//소모임 회원 대화(소근소근) 번호(기본키)
	private String pcComment;		//소모임 회원 대화 내용
	private String pcCredat;		//소모임 회원 대화 내용 등록일
	private String pcCretim;		//소모임 회원 대화 내용 등록시간
	private String pcLmodat;		//소모임 회원 대화 내용 수정일
	private String pcLmotim;		//소모임 회원 대화 내용 수정시간
	private int pcActive;			//소모임 회원 대화 등록시 1-> 삭제시 0(활성화/비활성화)
	
	private int piNum;				//소모임 번호(외래키)
	private int uiNum;				//유저 번호(외래키)
	private String uiNickname;		//유저 닉네임
}
