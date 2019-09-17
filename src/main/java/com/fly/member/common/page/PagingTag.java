package com.fly.member.common.page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.fly.member.match.vo.MatchVO;


public class PagingTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	
	private int page = 1; // 현제 페이지 번호
	private int total = 1; // 전체 조회된 row 수
	private int list_size = 10; // 페이지에 보여주는 레코드 수
	private int page_size = 10; // 페이지 네비게이터에 표시되는 페이지 버튼의 갯수

	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getList_size() {
		return list_size;
	}

	public void setList_size(int list_size) {
		this.list_size = list_size;
	}

	public int getPage_size() {
		return page_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public String getPaging() {
		String ret = "";
		if (page < 1) {
			page = 1;
		}
		if (total < 1) {
			return "";
		}

		int currentFirst = ((page-1)/page_size) * page_size + 1;
	      
	      int currentlast = ((page-1)/page_size) * page_size + page_size;
	      
	      int nextFirst = (((page-1)/page_size)+1) * page_size - 8;
	      
	      int prevFirst = (((page-1)/page_size)-1) * page_size + 11;
		

		int lastPage = 1;
		lastPage = total / list_size;
		
		if (total % list_size != 0) {
			lastPage = lastPage + 1;
		}
		
		
		currentlast = (currentlast>lastPage)?lastPage:currentlast;

		
		ret += "<div class='paginate'>";
		// 페이지 처음 버튼 
		if (page > 1) {
			ret += "<a href=\"javascript:goPage('1')\"><span><input type='button' value='처음' id='firstPage'/></span></a>";
		} else {
			ret += "<span><input type='button' value='처음' id='firstPage' /></span>";
		}
		
		// 페이지 이전 버튼
		if (prevFirst > 0) {
			ret += "<a href=\"javascript:goPage('"+prevFirst+"');\"><span><input type='button' value='이전' id='prevPage'/></span></a>";
		} else {
			ret += "<span><input type='button' value='이전' id='prevPage' /></span>";
		}
		
		
		// 페이지 
		for (int p=currentFirst; p<currentFirst + page_size && p<=lastPage; p++) {
			if (p <= currentlast) {
				if (p == page) {
					ret += "<a href='#' class='ontextAn'>"+p+"</a>";
				} else {
					ret += "<a href=\"javascript:goPage('"+p+"');\"class='textAn'>"+p+"</a>";
				}
			}
		}
		
		
		// 페이지 다음 버튼
		 if(nextFirst <= lastPage) {
			 ret += "<a href=\"javascript:goPage('"+nextFirst+"')\"><span><input type='button' value='다음' id='nextPage'/></span></a>";
		 } else {
			ret += "<span><input type='button' value='다음' id='nextPage'/></span>";
		}
		
		
		// 페이지 마지막 버튼
		if (page < lastPage) {
			ret += "<a href=\"javascript:goPage('"+lastPage+"')\"><span><input type='button' value='마지막' id='lastPage'/></span></a>";
		} else {
			ret += "<span><input type='button' value='마지막' id='lastPage'/></span>";
		}
		
		ret += "</div>";
		
		return ret;
		
	}
}
