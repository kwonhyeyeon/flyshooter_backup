package com.fly.user.stadium.dao;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface UserStadiumDao {
	
	// 구장에 등록된 경기장 리스트를 가져온다.
	public List<StadiumVO> selectStadiumList(String p_num);
	
}
