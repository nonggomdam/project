package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.INoticeDAO;
import com.spring_boot_dolls_ticket.project.model.NoticeVO;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	@Qualifier("INoticeDAO")
	INoticeDAO dao;
	
	@Override
	public ArrayList<NoticeVO> listAllNotice() {
		
		return dao.listAllNotice();
		
	}

	@Override
	public void insertNotice(NoticeVO notice) {
		dao.insertNotice(notice);
	}

	@Override
	public NoticeVO detailViewNotice(int noticeNo) {
		
		return dao.detailViewNotice(noticeNo);
		
	}

	@Override
	public void updateNotice(NoticeVO notice) {
		
		dao.updateNotice(notice);
		
	}

	@Override
	public void deleteNotice(int noticeNo) {
		
		dao.deleteNotice(noticeNo);
		
	}
	
	@Override
	public void updateHitNum(int noticeNo) {
		
		dao.updateHitNum(noticeNo);
		
	}

}
