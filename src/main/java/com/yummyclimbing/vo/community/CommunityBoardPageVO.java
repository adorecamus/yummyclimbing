package com.yummyclimbing.vo.community;

import lombok.Data;

@Data
public class CommunityBoardPageVO {
	private int displayPageNum = 10; // 게시판 화면에서 나타나는 페이지 번호
	private Criteria cri; 		// 현재 페이지 번호, 한 페이지에 출력할 데이터 개수
	private int startPage; 		// 시작 페이지 
	private int endPage; 		// 마지막 페이지
	private boolean prev;		// 이전 페이지 활성화 여부
	private boolean next; 		// 다음 페이지 활성화 여부
	private int totalPages; 	// 전체 페이지

	public CommunityBoardPageVO(Criteria cri, int totalPages) {
		this.cri = cri;
		this.totalPages = totalPages;
		
		// 마지막 페이지 계산
		this.endPage = (int)(Math.ceil(cri.getPage()/10.0)) * 10; 
		// 시작 페이지 계산
		this.startPage = this.endPage - 9; 
		
		// 전체 마지막 페이지 계산 
		int realEnd = (int)(Math.ceil(totalPages*1.0)/cri.getAmount());  
		
		// 전체 마지막 페이지가 화면의 마지막페이지보다 작으면 마지막페이지의 값을 조정
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		// 이전 페이지와 다음 페이지의 버튼 표시 여부
		this.prev = this.startPage > 1; // 시작 페이지가 1보다 크면 true
		this.next = this.endPage < realEnd; //마지막 페이지가 1보다 크면 true
	}
	
}
