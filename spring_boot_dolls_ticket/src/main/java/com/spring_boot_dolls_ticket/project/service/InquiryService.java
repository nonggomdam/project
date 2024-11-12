package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.IInquiryDAO;
import com.spring_boot_dolls_ticket.project.model.InquiryVO;

@Service
public class InquiryService implements IInquiryService {

	@Autowired
	@Qualifier("IInquiryDAO")
	IInquiryDAO dao;
	
	@Override
	public ArrayList<InquiryVO> listAllInquiry(String custId) {
		
		return dao.listAllInquiry(custId);
		
	}

	@Override
	public void insertInquiry(InquiryVO inquiry) {
		dao.insertInquiry(inquiry);
	}

	@Override
	public InquiryVO selectInquiry(int inquiryId) {
		return dao.selectInquiry(inquiryId);
	}

	@Override
	public ArrayList<InquiryVO> qaList() {
		return dao.qaList();
	}

	@Override
	public void updateResponse(int inquiryId, String responseContent) {
		InquiryVO inquiry = dao.selectInquiry(inquiryId);
		
		inquiry.setResponseContent(responseContent);
		inquiry.setStatus("답변 완료");
		dao.updateResponse(inquiry);
	}

}
