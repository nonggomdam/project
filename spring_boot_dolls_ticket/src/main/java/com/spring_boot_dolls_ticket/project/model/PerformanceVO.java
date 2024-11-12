package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PerformanceVO {
	
	private String performanceId;
	private String performanceKindCd;
	private int performanceRatingCode;
	private String performanceName;
    private int performancePrice;
    private int maxPerformancePrice;                 // 공연 가격 (performance_price)
    private int minPerformancePrice;                 // 공연 가격 (performance_price)
	private int performancePriceR;
	private int performancePriceS;
	private String performanceZipcode;
	private String performanceAddress;
	private String performanceDetailAddress;
    private String openYn;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date performanceDate1;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date performanceDate2;
	private int performanceTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date reservationOpenExpectedDate;
    private Date maxPerformanceDate;
    private Date minPerformanceDate;
    private Date performanceDate;
	private String performanceImagePath;
	private String performanceInformationImagePath;
	private Date firstChangeDate;
	private Date lastChangeDate;
	private int clickCount; // 클릭 수
	private String performanceLocationId;
	private int reservationStatusYCount;
	
	public String getPerformanceLocationId() {
		return performanceLocationId;
	}
	public void setPerformanceLocationId(String performanceLocationId) {
		this.performanceLocationId = performanceLocationId;
	}
	public int getClickCount() {
		return clickCount;
	}
	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getPerformanceKindCd() {
		return performanceKindCd;
	}
	public void setPerformanceKindCd(String performanceKindCd) {
		this.performanceKindCd = performanceKindCd;
	}
	public int getPerformanceRatingCode() {
		return performanceRatingCode;
	}
	public void setPerformanceRatingCode(int performanceRatingCode) {
		this.performanceRatingCode = performanceRatingCode;
	}
	public String getPerformanceName() {
		return performanceName;
	}
	public void setPerformanceName(String performanceName) {
		this.performanceName = performanceName;
	}
	public int getPerformancePriceR() {
		return performancePriceR;
	}
	public void setPerformancePriceR(int performancePriceR) {
		this.performancePriceR = performancePriceR;
	}
	public int getPerformancePriceS() {
		return performancePriceS;
	}
	public void setPerformancePriceS(int performancePriceS) {
		this.performancePriceS = performancePriceS;
	}
	public String getPerformanceZipcode() {
		return performanceZipcode;
	}
	public void setPerformanceZipcode(String performanceZipcode) {
		this.performanceZipcode = performanceZipcode;
	}
	public String getPerformanceAddress() {
		return performanceAddress;
	}
	public void setPerformanceAddress(String performanceAddress) {
		this.performanceAddress = performanceAddress;
	}
	public String getPerformanceDetailAddress() {
		return performanceDetailAddress;
	}
	public void setPerformanceDetailAddress(String performanceDetailAddress) {
		this.performanceDetailAddress = performanceDetailAddress;
	}
	public Date getPerformanceDate1() {
		return performanceDate1;
	}
	public void setPerformanceDate1(Date performanceDate1) {
		this.performanceDate1 = performanceDate1;
	}
	public Date getPerformanceDate2() {
		return performanceDate2;
	}
	public void setPerformanceDate2(Date performanceDate2) {
		this.performanceDate2 = performanceDate2;
	}
	public int getPerformanceTime() {
		return performanceTime;
	}
	public void setPerformanceTime(int performanceTime) {
		this.performanceTime = performanceTime;
	}
	public Date getReservationOpenExpectedDate() {
		return reservationOpenExpectedDate;
	}
	public void setReservationOpenExpectedDate(Date reservationOpenExpectedDate) {
		this.reservationOpenExpectedDate = reservationOpenExpectedDate;
	}
	public String getPerformanceImagePath() {
		return performanceImagePath;
	}
	public void setPerformanceImagePath(String performanceImagePath) {
		this.performanceImagePath = performanceImagePath;
	}
	public String getPerformanceInformationImagePath() {
		return performanceInformationImagePath;
	}
	public void setPerformanceInformationImagePath(String performanceInformationImagePath) {
		this.performanceInformationImagePath = performanceInformationImagePath;
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
	public int getPerformancePrice() {
		return performancePrice;
	}
	public void setPerformancePrice(int performancePrice) {
		this.performancePrice = performancePrice;
	}
	public int getMaxPerformancePrice() {
		return maxPerformancePrice;
	}
	public void setMaxPerformancePrice(int maxPerformancePrice) {
		this.maxPerformancePrice = maxPerformancePrice;
	}
	public int getMinPerformancePrice() {
		return minPerformancePrice;
	}
	public void setMinPerformancePrice(int minPerformancePrice) {
		this.minPerformancePrice = minPerformancePrice;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public Date getMaxPerformanceDate() {
		return maxPerformanceDate;
	}
	public void setMaxPerformanceDate(Date maxPerformanceDate) {
		this.maxPerformanceDate = maxPerformanceDate;
	}
	public Date getMinPerformanceDate() {
		return minPerformanceDate;
	}
	public void setMinPerformanceDate(Date minPerformanceDate) {
		this.minPerformanceDate = minPerformanceDate;
	}
	
	
	public Date getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(Date performanceDate) {
		this.performanceDate = performanceDate;
	}
	public int getReservationStatusYCount() {
		return reservationStatusYCount;
	}
	public void setReservationStatusYCount(int reservationStatusYCount) {
		this.reservationStatusYCount = reservationStatusYCount;
	}
    
	
	
}