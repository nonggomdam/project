package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentTicketVO {

	private String noticeId;
	private String assignmentSqno;
	private String performanceId;
	private String reservationSeatInformation;
	private String reservationId;
	private String receiveCustId;
	private String soldYn;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	
	
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
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getReceiveCustId() {
		return receiveCustId;
	}
	public void setReceiveCustId(String receiveCustId) {
		this.receiveCustId = receiveCustId;
	}
	public String getSoldYn() {
		return soldYn;
	}
	public void setSoldYn(String soldYn) {
		this.soldYn = soldYn;
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
		return "AssignmentTicketVO [noticeId=" + noticeId + ", assignmentSqno=" + assignmentSqno + ", performanceId="
				+ performanceId + ", reservationSeatInformation=" + reservationSeatInformation + ", reservationId="
				+ reservationId + ", receiveCustId=" + receiveCustId + ", soldYn=" + soldYn + ", firstChangeDate="
				+ firstChangeDate + ", lastChangeDate=" + lastChangeDate + "]";
	}
	
	
	

	
	
	
	
	
	
}
