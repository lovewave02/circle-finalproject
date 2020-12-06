package com.kh.circle.addressBook.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PagingInfo {
	private int nowPage;
	private int perPage;		// 게시물 출력단위
	
	private int startPage;		// 페이지 묶음의 첫 페이지
	private int endPage;		// 페이지 묶음의 마지막 페이지
	
	private int perGroup;		// 페이지 묶음 출력 단위
	private int total;			// 전체 게시물 수

	private int minPage;		// 전체 첫 페이지
	private int maxPage;		// 전체 마지막 페이지
	
	private String name;		// 검색: 이름
	private String email;		// 검색: 이메일
	private String tel;			// 검색: 전화번호
	
	public void calcValues() {
		this.calcMax();
		this.calcStartAndEndPage();
	}
	
	public void calcStartAndEndPage() {
		this.endPage = ((int) Math.ceil((double) nowPage / perGroup)) * perGroup;
		
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}

		this.startPage = this.endPage - this.perGroup + 1;
		
		if(this.startPage < 1) {
			this.startPage = 1;
		}
	}
	
	public void calcMax() {
		this.maxPage = (int) Math.ceil( (double) this.total / this.perPage );
	}
}
