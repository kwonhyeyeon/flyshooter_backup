package com.fly.admin.terms.vo;

public class TermsVO {

	private int ctype; // 유형
	private String content; // 내용
	private String regdate; // 등록일
	
	public int getCtype() {
		return ctype;
	}
	public void setCtype(int ctype) {
		this.ctype = ctype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "TermsVO [ctype=" + ctype + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
}
