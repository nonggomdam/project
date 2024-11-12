package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;

import com.spring_boot_dolls_ticket.project.model.InquiryVO;

public interface IInquiryDAO {

	public ArrayList<InquiryVO> listAllInquiry(String custId);
	public void insertInquiry(InquiryVO inquiry);
	public InquiryVO selectInquiry(int inquiryId);
	public ArrayList<InquiryVO> qaList();
	public void updateResponse(InquiryVO inquiry);
}
