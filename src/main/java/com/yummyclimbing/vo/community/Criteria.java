package com.yummyclimbing.vo.community;

import lombok.Data;

@Data
public class Criteria {

	private int page;	// 현재 페이지
	private int amount;		// 한 페이지당 출력할 게시물 개수
	private int skip;		// 스킵할 게시물 개수
	
	public Criteria() {
		this.page = 1;
		this.amount = 10;
	}
	
	/*
	 * public Criteria(int page, int amount) { 
	 * this.page = page; 
	 * this.amount = amount; this.skip = (page-1)*amount; }
	 */
	
    public int getPage() {
        return page;
    }

    public void setPage(int page) { // 페이지 번호 set
        if (page <= 0) {
            this.page = 1;
        }
        this.page = page;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) { 
        if (amount <= 0 || amount > 100)
            this.amount = 10;
        this.amount = amount;
    }

    public int getSkip() {
        return (this.page - 1) * amount;
    }
}
