package com.yummyclimbing.vo.party;

import java.util.List;

import lombok.Data;

@Data
public class PartyMemberVO {

	public PartyMemberVO () {
		
	}
	
	public PartyMemberVO (int piNum, int uiNum) {
		this.piNum = piNum;
		this.uiNum = uiNum;
	}
	
	private int pmNum;			// 소소모임 부원 번호(기본키)
	private int pmActive;		// 소소모임 회원 상태 - 가입 1, 탈퇴 0, 차단 -1
	private int pmGrade;		// 소소모임 권한 - 방장 1, 회원 0
	
	private int piNum;			// 소소모임 번호(외래키)
	private int uiNum;			// 유저 번호(외래키)
	
	private int memNum;			// 소소모임 부원 수
	private int piMemberCnt;	// 소소모임 정원
	
	private List<Integer> pmNums;	// 대장이 내보낼 소소모임 부원 번호 리스트
	
	//private String pmCredat;	//소모임 최초 가입날짜
	//private String pmLmodat;	//소모임 상태(가입/탈퇴) 변경날짜
	
}
