package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring_boot_dolls_ticket.project.model.ReservationVO;


@Mapper
public interface IReservationDAO {
	
	public ReservationVO getReservation(ReservationVO reservationVO);
	public ArrayList<ReservationVO> reservationList(ReservationVO reservationVO);
	
	
}
