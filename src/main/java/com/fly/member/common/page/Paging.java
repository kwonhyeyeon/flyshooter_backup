package com.fly.member.common.page;


import com.fly.common.util.Util;
import com.fly.member.common.vo.CommonVO;


public class Paging {
	
	// 페이징을 위한 설정 작업
	// @param cvo
	
	public static void setPage(CommonVO cvo) {
		int page = Util.nvl(cvo.getPage(), 1);
		int pageSize = Util.nvl(cvo.getPageSize(), 15);
		
		if (cvo.getPage() == null) {
			cvo.setPage(page + "");
		}
		
		if (cvo.getPageSize()==null) {
			cvo.setPageSize(pageSize + "");
		}
		
		int start_row = (page-1)*pageSize +1;
		int end_row = (page-1)*pageSize+pageSize;
		
		cvo.setStart_row(start_row+"");
		cvo.setEnd_row(end_row+"");
	}
	
}
