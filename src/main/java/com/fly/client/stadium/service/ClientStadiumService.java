package com.fly.client.stadium.service;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface ClientStadiumService {

	// 경기장 리스트
	public List<StadiumVO> stadiumList(String p_num);

	// 경기장 상세페이지
	public StadiumVO stadiumDetail(String s_no);

	// 경기장 등록
	public int stadiumInsert(StadiumVO svo);

	// 경기장 수정
	public int stadiumModify(StadiumVO svo);

	public int closeStadium(String s_no); 
		
}
