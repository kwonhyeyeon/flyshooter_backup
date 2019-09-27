package com.fly.user.stadium.service;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface UserStadiumService {

	// 구장에 등록된 경기장 리스트를 가져온다.
	public List<StadiumVO> selectStadiumList(String p_num);
	
	// 선택된 경기장의 영업시간과 최소 이용시간을 구한다
	public StadiumVO getSelectedStadiumInfo(int s_no);
}
