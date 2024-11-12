package com.spring_boot_dolls_ticket.project.model;

import java.util.List;

public class AssignmentTicket2VO {

	private String noticeId;
	private List<String> assignmentSqnos;
	
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public List<String> getAssignmentSqnos() {
		return assignmentSqnos;
	}
	public void setAssignmentSqnos(List<String> assignmentSqnos) {
		this.assignmentSqnos = assignmentSqnos;
	}
	
	@Override
	public String toString() {
		return "AssignmentTicket2VO [noticeId=" + noticeId + ", assignmentSqno=" + assignmentSqnos + "]";
	}
	
	
	
	

	

	
	
	
	
	
	
}
