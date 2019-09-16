package com.fly.client.stadium.service;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface ClientStadiumService {

	// 경기장 리스트
	public List<StadiumVO> StadiumList();

	// 경기장 상세페이지
	public StadiumVO StadiumDetail(String s_num);

	// 경기장 등록
	public int StadiumInsert(StadiumVO svo);

	// 경기장 수정
	public int StadiumModify(StadiumVO svo);
}
