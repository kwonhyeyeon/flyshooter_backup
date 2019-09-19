package com.fly.member.recruit.dao;

import java.util.List;

import com.fly.member.recruit.vo.RecruitVO;

public interface RecruitDao {
	
	public List<RecruitVO> recruitList(RecruitVO revo); // 글목록 구현
	
	public int recruitListCnt(RecruitVO revo); // 글 목록 페이지 구현
	
	public RecruitVO recruitView(RecruitVO revo); // 글 상세보기

	public int recruitInsert(RecruitVO revo); // 글 쓰기 등록

	public int recruitUpdate(RecruitVO revo); // 글 수정 구현

	public int recruitMbdate(RecruitVO revo); // 신청여부 변경

}
