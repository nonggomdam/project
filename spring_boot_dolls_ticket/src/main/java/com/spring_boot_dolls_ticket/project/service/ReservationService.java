package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.IReservationDAO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;



@Service
public class ReservationService implements IReservationService {

	@Autowired
	IReservationDAO dao;

	@Override
	public ReservationVO getReservation(ReservationVO reservationVO) {
		// TODO Auto-generated method stub
		return dao.getReservation(reservationVO);
	}
	
	@Override
	public ArrayList<ReservationVO> reservationList(ReservationVO reservationVO) {
		// TODO Auto-generated method stub
		return dao.reservationList(reservationVO);
	}


}
