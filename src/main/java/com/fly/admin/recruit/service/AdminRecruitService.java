package com.fly.admin.recruit.service;

import java.util.List;

import com.fly.member.recruit.vo.RecruitVO;

public interface AdminRecruitService {
	
	public List<RecruitVO> adminRecruitList(RecruitVO revo); // 글 목록 구현
	
	public int adminRecruitListCnt(RecruitVO revo); // 글 목록 페이지 구현
	
	public RecruitVO recruitView(RecruitVO revo); // 글 상세보기
	
	public int recruitStatusUpdate(RecruitVO revo); // 글 삭제 구현

}
