package com.spring_boot_dolls_ticket.project.model;

public class PerformanceSeatVO {
	
	private String performanceLocationId;
	private String performanceLocationNm;
    private String seatKindCd;             
    private int seatNumber;         
    private int seatPrice;
    private String seatStatus;
    private String performanceId ; //입력값 용도로 사용
    private String performanceDate ; //입력값 용도로 사용
    private int totalSeatPrice;
    private int totalSeatCnt;
    private String totalSeat;
	public String getPerformanceLocationId() {
		return performanceLocationId;
	}
	public void setPerformanceLocationId(String performanceLocationId) {
		this.performanceLocationId = performanceLocationId;
	}
	public String getPerformanceLocationNm() {
		return performanceLocationNm;
	}
	public void setPerformanceLocationNm(String performanceLocationNm) {
		this.performanceLocationNm = performanceLocationNm;
	}
	public String getSeatKindCd() {
		return seatKindCd;
	}
	public void setSeatKindCd(String seatKindCd) {
		this.seatKindCd = seatKindCd;
	}
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(String performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(String seatStatus) {
		this.seatStatus = seatStatus;
	}
	public int getTotalSeatPrice() {
		return totalSeatPrice;
	}
	public void setTotalSeatPrice(int totalSeatPrice) {
		this.totalSeatPrice = totalSeatPrice;
	}
	public int getTotalSeatCnt() {
		return totalSeatCnt;
	}
	public void setTotalSeatCnt(int totalSeatCnt) {
		this.totalSeatCnt = totalSeatCnt;
	}
	public String getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(String totalSeat) {
		this.totalSeat = totalSeat;
	}
	
    
    
    


}
