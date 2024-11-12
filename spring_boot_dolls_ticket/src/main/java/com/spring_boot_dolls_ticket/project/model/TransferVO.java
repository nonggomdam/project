package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TransferVO {
	
	private String custId;
	private String performanceKindCd;
	private String performanceName;
	private int totalSeatPrice;
	private int price;
	private String performanceDate;
	private String reservationSeatInformation;
	private String reservationId;
	private String performanceImagePath;
	private String performanceId;
	private String reservationSeatKindCd;
	private int reservationSeatNumber;
	
	
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
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
	public int getTotalSeatPrice() {
		return totalSeatPrice;
	}
	public void setTotalSeatPrice(int totalSeatPrice) {
		this.totalSeatPrice = totalSeatPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getPerformanceImagePath() {
		return performanceImagePath;
	}
	public void setPerformanceImagePath(String performanceImagePath) {
		this.performanceImagePath = performanceImagePath;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
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
		return "TransferVO [custId=" + custId + ", performanceKindCd=" + performanceKindCd + ", performanceName="
				+ performanceName + ", totalSeatPrice=" + totalSeatPrice + ", price=" + price + ", performanceDate="
				+ performanceDate + ", reservationSeatInformation=" + reservationSeatInformation + ", reservationId="
				+ reservationId + ", performanceImagePath=" + performanceImagePath + ", performanceId=" + performanceId
				+ ", reservationSeatKindCd=" + reservationSeatKindCd + ", reservationSeatNumber="
				+ reservationSeatNumber + "]";
	}
	


	
	

	
	

	
	
	
	
	
	
	
	
	
	
}
