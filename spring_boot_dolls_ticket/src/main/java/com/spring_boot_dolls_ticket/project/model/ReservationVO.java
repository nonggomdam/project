package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;


public class ReservationVO {
	
	private String reservationId;
    private String performanceId;                    // PERFORMANCE_ID
    private String custId;
    private String performanceDate;
    private Date performanceDate2;
    private String reservationSeatInformation; // 화면에서 넘길떄필요
    private String reservationSeatKindCd;
    private int reservationSeatNumber;
    private String reservationStatus;
    private String performanceImagePath;
    private String performanceName;
    private int performancePrice;
    private int totalPerformancePrice;
    private Date firstChangeDate;                 // 최초 변경 날짜 (first_change_date)
    private Date lastChangeDate;                  // 마지막 변경 날짜 (last_change_date)
    private int pageNbr;
    private int pageOffSet;
    private int currentPage;
    private String startDateStr;
    private String endDateStr;
    
    
    
	public String getPerformanceName() {
		return performanceName;
	}
	public void setPerformanceName(String performanceName) {
		this.performanceName = performanceName;
	}
	public int getPerformancePrice() {
		return performancePrice;
	}
	public void setPerformancePrice(int performancePrice) {
		this.performancePrice = performancePrice;
	}
	public String getPerformanceImagePath() {
		return performanceImagePath;
	}
	public void setPerformanceImagePath(String performanceImagePath) {
		this.performanceImagePath = performanceImagePath;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(String performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	public Date getFirstChangeDate() {
		return firstChangeDate;
	}
	public void setFirstChangeDate(Date firstChangeDate) {
		this.firstChangeDate = firstChangeDate;
	}
	public Date getLastChangeDate() {
		return lastChangeDate;
	}
	public void setLastChangeDate(Date lastChangeDate) {
		this.lastChangeDate = lastChangeDate;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public Date getPerformanceDate2() {
		return performanceDate2;
	}
	public void setPerformanceDate2(Date performanceDate2) {
		this.performanceDate2 = performanceDate2;
	}
	public String getReservationSeatKindCd() {
		return reservationSeatKindCd;
	}
	public void setReservationSeatKindCd(String reservationSeatKindCd) {
		this.reservationSeatKindCd = reservationSeatKindCd;
	}
	public int getReservationSeatNumber() {
		return reservationSeatNumber;
	}
	public void setReservationSeatNumber(int reservationSeatNumber) {
		this.reservationSeatNumber = reservationSeatNumber;
	}
	public int getTotalPerformancePrice() {
		return totalPerformancePrice;
	}
	public void setTotalPerformancePrice(int totalPerformancePrice) {
		this.totalPerformancePrice = totalPerformancePrice;
	}
	public int getPageNbr() {
		return pageNbr;
	}
	public void setPageNbr(int pageNbr) {
		this.pageNbr = pageNbr;
	}
	public int getPageOffSet() {
		return pageOffSet;
	}
	public void setPageOffSet(int pageOffSet) {
		this.pageOffSet = pageOffSet;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getStartDateStr() {
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
    
    
}
