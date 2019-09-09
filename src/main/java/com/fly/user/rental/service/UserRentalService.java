package com.fly.user.rental.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fly.member.rental.vo.RentalVO;
@Transactional
public interface UserRentalService {
	// 해당경기장에서 입력받은 날짜에 예약가능한 시간을 조회한다.
	public List<String> searchReservationTime(String selectDay, int s_no);
	
	// 선택한 시간이 예약중인지 조회한다.
	public int reservationCheck(String overlapKey);
	
	// 예약중 등록후 5분이 지나면 삭제.
	public int deleteReservation(String overlap);
	
	@Transactional
	// 대관정보 insert
	public int insertRental(RentalVO rvo, String items_no, String items_ea);
}
