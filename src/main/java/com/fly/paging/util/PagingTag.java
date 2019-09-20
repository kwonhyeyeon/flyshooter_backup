package com.fly.paging.util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @param page       현제 페이지 번호
	 * @param total      전체 조회된 Row 수
	 * @param list_size  페이지에 보여주는 레코드수            	           
	 * @param page_size  페이지 네비게이터에 표시되는 페이지 버튼의 갯수
	 */ 
	
	private int page = 1;
	private int total = 1;
	private int list_size = 5;
	private int page_size = 5;
	
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setList_size(int list_size) {
		this.list_size = list_size;
	}
	
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}	
	
	public String getPaging(){
		String ret = "";
		if(page<1) page=1;
		if(total<1) return "";
		
		int currentFirst = ((page-1)/page_size) * page_size + 1;
		
		int currentlast = ((page-1)/page_size) * page_size + page_size;
		
		int nextFirst = (((page-1)/page_size)+1) * page_size + 1;
		
		int prevFirst = (((page-1)/page_size)-1) * page_size + 1;

		int lastPage = 1;
		lastPage = total / list_size;
		
		if ( total%list_size != 0 ) lastPage = lastPage + 1;
		currentlast = (currentlast>lastPage)?lastPage:currentlast;
		
		if ( page>1 ) {
			ret += " <a class='pre spacing' href=\"javascript:goPage('1')\"> << </a> ";
		}
		else{
			ret += " <a class='pre spacing'> << </a> ";
		}
		
		if ( prevFirst > 0 ) {
			ret += " <a class='pre' href=\"javascript:goPage('"+prevFirst+"');\"> < </a> ";
		}
		else{
			ret += " <a class='pre'> < </a> ";
		}

		for (int j=currentFirst; j<currentFirst+page_size && j<=lastPage; j++) {	
			if ( j <= currentlast ) {
				if ( j == page ) {
					ret += " <a href='#' class='is-active num'>"+j+"</a> ";
				} else {
					ret += " <a href=\"javascript:goPage('"+j+"');\" class='num'>"+j+"</a> ";
				}
			} 
		}

		if ( nextFirst <= lastPage ) {
			ret += " <a class='next' href=\"javascript:goPage('"+nextFirst+"')\"> > </a> ";
		}
		else{
			ret += " <a class='next'> > </a> ";
		}
		
		if ( page<lastPage ) {
			ret += " <a class='next spacing' href=\"javascript:goPage('"+lastPage+"')\"> >> </a> ";
		}
		else{
			ret += " <a class='next spacing'> >> </a> ";
		}

		return ret;
	}

}
