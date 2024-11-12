package com.spring_boot_dolls_ticket.project.model;

public class Transfer2VO {
	
	private String custId;
	private String assignmentSqno;
	private String reservationId;
	private String reservationSeatInformation;
	private String performanceKindCd;
	private String performanceName;
	private int performancePrice;
	private String performanceDate;
	private String performanceId;
	private String soldYn;
	private int totalSeatPrice;
	private String performanceImagePath;
	private int price;
	private String reservationSeatKindCd;
	private int reservationSeatNumber;
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getAssignmentSqno() {
		return assignmentSqno;
	}
	public void setAssignmentSqno(String assignmentSqno) {
		this.assignmentSqno = assignmentSqno;
	}
 
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	public String getPerformanceKindCd() {
		return performanceKindCd;
	}
	public void setPerformanceKindCd(String performanceKindCd) {
		this.performanceKindCd = performanceKindCd;
	}
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
	public String getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(String performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getSoldYn() {
		return soldYn;
	}
	public void setSoldYn(String soldYn) {
		this.soldYn = soldYn;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	
	public int getTotalSeatPrice() {
		return totalSeatPrice;
	}
	public void setTotalSeatPrice(int totalSeatPrice) {
		this.totalSeatPrice = totalSeatPrice;
	}
	public String getPerformanceImagePath() {
		return performanceImagePath;
	}
	public void setPerformanceImagePath(String performanceImagePath) {
		this.performanceImagePath = performanceImagePath;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	@Override
	public String toString() {
		return "Transfer2VO [custId=" + custId + ", assignmentSqno=" + assignmentSqno + ", reservationId="
				+ reservationId + ", reservationSeatInformation=" + reservationSeatInformation + ", performanceKindCd="
				+ performanceKindCd + ", performanceName=" + performanceName + ", performancePrice=" + performancePrice
				+ ", performanceDate=" + performanceDate + ", performanceId=" + performanceId + ", soldYn=" + soldYn
				+ ", totalSeatPrice=" + totalSeatPrice + ", performanceImagePath=" + performanceImagePath + ", price="
				+ price + ", reservationSeatKindCd=" + reservationSeatKindCd + ", reservationSeatNumber="
				+ reservationSeatNumber + "]";
	}
	


	
	
	
	
	
	


	
	

	
	
	
	
	
	
}
