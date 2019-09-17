package com.fly.member.match.dao;

import java.util.List;

import com.fly.member.match.vo.MatchVO;

public interface MatchDao {

	public List<MatchVO> matchList(MatchVO mavo); // 글목록 구현
	
	
	public int matchListCnt(MatchVO mavo); // 글 목록 페이지 구현
	
	public MatchVO matchView(MatchVO mavo); // 글 상세보기

	public int matchInsert(MatchVO mavo); // 글 쓰기 등록

	public int matchUpdate(MatchVO mavo); // 글 수정 구현

	public int updateMbdate(MatchVO mavo); // 신청여부 변경
}
