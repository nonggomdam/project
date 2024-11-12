package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import com.spring_boot_dolls_ticket.project.model.ReservationVO;


public interface IReservationService {
	
	public ReservationVO getReservation(ReservationVO reservationVO);
	public ArrayList<ReservationVO> reservationList(ReservationVO reservationVO);
}
