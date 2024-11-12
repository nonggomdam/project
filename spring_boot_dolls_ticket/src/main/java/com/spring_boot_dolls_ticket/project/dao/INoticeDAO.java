package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;

import com.spring_boot_dolls_ticket.project.model.NoticeVO;

public interface INoticeDAO {
	
	public ArrayList<NoticeVO> listAllNotice(); // 공지 사항 list
	public void insertNotice(NoticeVO notice); // 공지 사항 등록
	public NoticeVO detailViewNotice(int noticeNo); // 공지 사항 상세
	public void updateNotice(NoticeVO notice); // 공지 사항 수정
	public void deleteNotice(int noticeNo); // 공지 사항 삭제
	public void updateHitNum(int noticeNo);
}
