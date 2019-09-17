package com.fly.member.common.vo;

public class CommonVO {

	// 조건 검색 시 사용할 필드
	private String keyword = "";

	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 줄수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getStart_row() {
		return start_row;
	}

	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}

	public String getEnd_row() {
		return end_row;
	}

	public void setEnd_row(String end_row) {
		this.end_row = end_row;
	}

}
