package com.fly.admin.match.service;

import java.util.List;

import com.fly.member.match.vo.MatchVO;

public interface AdminMatchService {

	public List<MatchVO> adminMatchList(MatchVO mavo); // 글목록 구현
	
	public int adminMatchListCnt(MatchVO mavo); // 글 목록 페이지 구현

	public MatchVO matchView(MatchVO mavo); // 글 상세보기
	
	public int matchStatusUpdate(MatchVO mavo); // 글 삭제 구현

}
