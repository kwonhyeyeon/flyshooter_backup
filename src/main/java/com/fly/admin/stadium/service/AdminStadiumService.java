package com.fly.admin.stadium.service;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface AdminStadiumService {

	// 경기장 리스트 출력
	public List<StadiumVO> getStadiumList(StadiumVO svo);
	
	// 경기장 상세 정보 출력
	public StadiumVO getStadiumDetail(int s_no);
	
	// 경기장 승인
	public void updateStdmAccept(int s_no);
		
}
