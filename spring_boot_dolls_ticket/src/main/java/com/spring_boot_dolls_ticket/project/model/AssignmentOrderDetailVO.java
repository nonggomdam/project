package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentOrderDetailVO {

	private String orderNo;
	private String sqno;
	private String noticeId;
	private String assignmentSqno;
	private int price;
	private String performanceKindCd;
	private String performanceName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date performanceDate;
	private String reservationSeatKindCd;
	private String reservationSeatNumber;
	private String performanceImagePath;
	private String reservationId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSqno() {
		return sqno;
	}
	public void setSqno(String sqno) {
		sqno = sqno;
	}
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getAssignmentSqno() {
		return assignmentSqno;
	}
	public void setAssignmentSqno(String assignmentSqno) {
		this.assignmentSqno = assignmentSqno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public Date getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(Date performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getReservationSeatKindCd() {
		return reservationSeatKindCd;
	}
	public void setReservationSeatKindCd(String reservationSeatKindCd) {
		this.reservationSeatKindCd = reservationSeatKindCd;
	}
	public String getReservationSeatNumber() {
		return reservationSeatNumber;
	}
	public void setReservationSeatNumber(String reservationSeatNumber) {
		this.reservationSeatNumber = reservationSeatNumber;
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
	@Override
	public String toString() {
		return "AssignmentOrderDetailVO [orderNo=" + orderNo + ", sqno=" + sqno + ", noticeId=" + noticeId
				+ ", assignmentSqno=" + assignmentSqno + ", price=" + price + ", performanceKindCd=" + performanceKindCd
				+ ", performanceName=" + performanceName + ", performanceDate=" + performanceDate
				+ ", reservationSeatKindCd=" + reservationSeatKindCd + ", reservationSeatNumber="
				+ reservationSeatNumber + ", performanceImagePath=" + performanceImagePath + ", reservationId="
				+ reservationId + ", firstChangeDate=" + firstChangeDate + ", lastChangeDate=" + lastChangeDate + "]";
	}
	
	
	
	
	
	
}
