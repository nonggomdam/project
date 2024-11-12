package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;



public interface IPerformanceDAO {

	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getEventById(String performanceId);
	ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	void updatePerformance(PerformanceVO performance); // UPDATE - 공연 정보 수정
	void deletePerformance(String performanceId); // DELETE - 공연 정보 삭제
	void insertPerformance(PerformanceVO performance); // INSERT - 공연 정보 추가
	public List<PerformanceVO> selectPerformance(); // 카테고리 page
	public List<PerformanceScheduleVO> selectPerformanceDate(String performanceId);
	public List<PerformanceSeatVO> selectPerformanceSeatInfoList(PerformanceSeatVO performanceSeatVO);
	List<PerformanceVO> getRankedPerformances(); // 클릭 순 랭킹 정렬
	void incrementClickCount(String performanceId);
	void updateImgPath(PerformanceVO performance); // UPDATE - 이미지 경로 수정
	String selectGeneratedId();
	public PerformanceSeatVO selectPerformanceSeatInfo(PerformanceSeatVO performanceSeatVO);
	public int insertReservationInfo(ReservationVO reservationVO);
	public ArrayList<PerformanceSeatVO> locationList();
	public PerformanceSeatVO getLocation(String performanceLocationId);
	public void insertPerformanceSchedule(PerformanceScheduleVO performanceScheduleVO);
	public void deletePerformanceSchedulesByPerformanceId(String performanceId);
	public List<PerformanceVO> selectRanking(); // 메인랭킹
}
