package com.spring_boot_dolls_ticket.project.model;

import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentNoticeBoardVO {
	
	private String noticeId;
	private String noticeTitle;
	private String custId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	private String assignmentStatus;
	private int hit;
	private String[] reservationId;
	
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
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
	public String getAssignmentStatus() {
		return assignmentStatus;
	}
	public void setAssignmentStatus(String assignmentStatus) {
		this.assignmentStatus = assignmentStatus;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String[] getReservationId() {
		return reservationId;
	}
	public void setReservationId(String[] reservationId) {
		this.reservationId = reservationId;
	}
	
	@Override
	public String toString() {
		return "AssignmentNoticeBoardVO [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", custId=" + custId
				+ ", firstChangeDate=" + firstChangeDate + ", lastChangeDate=" + lastChangeDate + ", assignmentStatus="
				+ assignmentStatus + ", hit=" + hit + ", reservationId=" + Arrays.toString(reservationId) + "]";
	}

	
	
	
	
	
	
	
}
