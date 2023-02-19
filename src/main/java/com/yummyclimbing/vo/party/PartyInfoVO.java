package com.yummyclimbing.vo.party;

import java.util.List;

import lombok.Data;

@Data
public class PartyInfoVO {

	private int piNum;				// 소소모임 넘버(기본키)
	private String mntnm;			// 산 이름(외래키)
	private String piName;			// 소소모임 이름
	private int uiNum;				// 대장 유저 번호(외래키)
	
	private String piExpdat;		// 소소모임 만료일자(모임일자)
	private String piMeetingTime;	// 소소모임 모임시간
	private int piMemberCnt;		// 소소모임 정원
	private String piProfile;		// 소소모임 소개
	private int piIcon;				// 소소모임 아이콘
	private String piCredat;		// 소소모임 생성일자
	private int piComplete;			// 소소모임 모집완료 여부
	private int piActive;			// 소소모임 생성 시 1 -> 삭제할 경우 0
	
	private int memNum;				// 현재 멤버 수
	private int likeNum;			// 좋아요 수
	private String uiNickname;		// 대장 닉네임
	
	private String searchType;		// 검색 조건
	private String searchText;		// 검색 내용
	private String sortType;		// 정렬 조건
	private String sortOrder;		// 정렬 순서 (오름차순, 내림차순)
	private boolean includeComplete;// 완료된 소소모임 포함 여부
	
	private int miNum;				// 산 번호
	
}
