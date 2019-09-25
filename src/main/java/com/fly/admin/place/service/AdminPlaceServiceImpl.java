package com.fly.admin.place.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.place.dao.AdminPlaceDao;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;

@Service("adminPlaceService")
public class AdminPlaceServiceImpl implements AdminPlaceService {
	
	@Autowired
	@Qualifier("adminPlaceDao")
	private AdminPlaceDao adminPlaceDao;

	@Override
	public List<PlaceVO> adminPlaceList(PlaceVO pvo) {      
		return adminPlaceDao.adminPlaceList(pvo);
	}

	@Override
	public PlaceVO adminPlaceDetail(String num) {
		return adminPlaceDao.adminPlaceDetail(num);
	}

	@Override
	public void getCloseDate(String p_num) {
		adminPlaceDao.getCloseDate(p_num);
	}

	@Override
	public void updatePok(PlaceVO pvo) {
		adminPlaceDao.updatePok(pvo);
	}

	@Override
	public int adminPlaceListCnt(PlaceVO pvo) {
		return adminPlaceDao.adminPlaceListCnt(pvo);
	}

	@Override
	public void updateClose(PlaceVO pvo) {
		adminPlaceDao.updateClose(pvo);
	}

	@Override
	public int getRentalCnt(String p_num) {
		return adminPlaceDao.getRentalCnt(p_num);
	}

	@Override
	public List<RentalVO> getRefundList() {
		return adminPlaceDao.getRefundList();
	}

}
