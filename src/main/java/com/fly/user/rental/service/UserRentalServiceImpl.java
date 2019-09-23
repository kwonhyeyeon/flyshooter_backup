package com.fly.user.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.itemsrental.dao.ItemsRentalDao;
import com.fly.member.itemsrental.vo.ItemsRentalVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.rental.detail.vo.RentalDetailVO;
import com.fly.user.rental.dao.UserRentalDao;
@Transactional
@Service("userRentalService")
public class UserRentalServiceImpl implements UserRentalService {

	@Autowired
	@Qualifier("userRentalDao")
	private UserRentalDao userRentalDao;
	@Autowired
	@Qualifier("itemsRentalDao")
	private ItemsRentalDao itemsRentalDao;
	
	@Override
	public List<String> searchReservationTime(String selectDay, int s_no) {
		// TODO Auto-generated method stub
		
		// 두개의 parammeter 넘기기 위해 HashMap 사용.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectDay", selectDay);
		map.put("s_no", s_no);
		
		return userRentalDao.searchReservationTime(map);
	}

	@Override
	public int reservationCheck(String overlapKey) {
		// TODO Auto-generated method stub
		
		
		long time = System.currentTimeMillis(); 
		long minutes = (time / (1000*60)); // 현재시간을 분으로 변환
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("overlapKey", overlapKey);
		map.put("minutes", minutes);
		
		
		return userRentalDao.reservationCheck(map);
	}

	@Override
	public int deleteReservation(String overlap) {
		// TODO Auto-generated method stub
		
		long time = System.currentTimeMillis(); 
		long minutes = (time / (1000*60));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("overlap", overlap);
		map.put("minutes", minutes);
	
		return userRentalDao.deleteReservation(map);
	}

	@Override
	@Transactional
	public int insertRental(RentalVO rvo, String items_no, String items_ea) {
		// TODO Auto-generated method stub
		int result = 0;
		result = userRentalDao.insertRental(rvo);
		if(!("null".equals(items_no) && "null".equals(items_ea))) {
			// 입력받은 items정보를 ","단위로 자르고 반복하여 isnert해준다.
			String item_no[] = items_no.split(",");
			String item_ea[] = items_ea.split(",");
						
			ItemsRentalVO irvo = new ItemsRentalVO();
			irvo.setR_no(rvo.getR_no());
						
			for(int i = 0; i < item_no.length; i++) {
				irvo.setI_no(Integer.parseInt(item_no[i]));
				irvo.setIr_rental_ea(Integer.parseInt(item_ea[i]));
				// item_rental insert
				result = itemsRentalDao.itemsRentalInsert(irvo);
			}
		}
		return result;
	}

	@Override
	public List<RentalVO> selectMyRentalList(RentalVO rvo) {
		// TODO Auto-generated method stub
		return userRentalDao.selectMyRentalList(rvo);
	}

	@Override
	public int myRentalListCnt(String m_id) {
		// TODO Auto-generated method stub
		return userRentalDao.myRentalListCnt(m_id);
	}

	@Override
	public RentalDetailVO showDetail(int r_no) {
		// TODO Auto-generated method stub
		return userRentalDao.showDetail(r_no);
	}

	@Override
	public int rentalUpdate(RentalVO rvo) {
		// TODO Auto-generated method stub
		return userRentalDao.rentalUpdate(rvo);
	}

}
