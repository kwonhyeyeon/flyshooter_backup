package com.fly.client.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.client.place.dao.ClientPlaceDao;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Service("clientPlaceService")
@Transactional
public class ClientPlaceServiceImpl implements ClientPlaceService {
	@Autowired
	@Qualifier("clientPlaceDao")
	private ClientPlaceDao clientPlaceDao;

	// 구장별 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_name) {
		return clientPlaceDao.stadiumList(p_name);
	}

	// 구장 리스트 출력 리스트
	@Override
	public List<PlaceVO> placeList(PlaceVO pvo) {
		List<PlaceVO> placeList = null;
		placeList = clientPlaceDao.placeList(pvo);
		return placeList;
	}

	// 구장 등록 구현
	@Override
	public int placeInsert(PlaceVO pvo) {
		int result = 0;
		try {
			result = clientPlaceDao.placeInsert(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public PlaceVO placeDetail(String p_num) {
		// TODO Auto-generated method stub
		PlaceVO placeList = clientPlaceDao.placeDetail(p_num);
		return placeList;
	}

	@Override
	public int placeModify(PlaceVO pvo) {
		int result = 0;
		try {
			result = clientPlaceDao.placeModify(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int closePlace(String p_num) {
		// TODO Auto-generated method stub
		int result = 0;
		result = clientPlaceDao.closePlace(p_num);
		if (result > 0) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	
	//사업자 번호 중복확인
	@Override
	public int pnumConfirm(String p_num) {
		int result;
		PlaceVO pvo = clientPlaceDao.placeDetail(p_num);
		if(pvo != null) {
			result = 1;//중복값있음
		}else {
			result = 2;
		}
		return result;
	}

	@Override
	public List<PlaceVO> placeChoice(String m_id) {
		List<PlaceVO> placeChoice = clientPlaceDao.placeChoice(m_id);
		return placeChoice;
	}

	@Override
	public PlaceVO selectYear(PlaceVO pvo) {
		// TODO Auto-generated method stub
		return clientPlaceDao.selectYear(pvo);
	}


}