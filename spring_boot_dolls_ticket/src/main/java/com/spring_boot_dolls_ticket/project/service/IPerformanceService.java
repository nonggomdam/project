package com.spring_boot_dolls_ticket.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;

public interface IPerformanceService {

	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getEventById(String performanceId);
	ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	void updatePerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException; // UPDATE - 공연 정보 수정	void deletePerformance(String performanceId); // DELETE - 공연 정보 삭제
	void deletePerformance(String performanceId); // DELETE
	void insertPerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException; // INSERT - 공연 정보 추가
	public List<PerformanceVO> selectPerformance(); // 카테고리page
	public List<PerformanceScheduleVO> selectPerformanceDate(String performanceId);
	public List<PerformanceSeatVO> selectPerformanceSeatInfoList(PerformanceSeatVO performanceSeatVO);
	List<PerformanceVO> getRankedPerformances(); // 클릭 순 랭킹 정렬
	void incrementClickCount(String performanceId);
	void updateImgPath(PerformanceVO performance);
	public PerformanceSeatVO selectPerformanceSeatInfo(PerformanceSeatVO performanceSeatVO);
	public int insertReservationInfo(ReservationVO reservationVO);
	public ArrayList<PerformanceSeatVO> locationList();
	public PerformanceSeatVO getLocation(String performanceLocationId);
	void insertPerformanceSchedule(PerformanceScheduleVO performanceScheduleVO);
	public List<PerformanceVO> selectRanking(); // 메인랭킹
}
