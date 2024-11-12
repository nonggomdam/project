package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderDetailVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicket2VO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;

public interface ITransferService {
	public ArrayList<TransferVO> showTransInfo(String custId);
	public void insertAssignmentNotice(AssignmentNoticeBoardVO vo);
	public ArrayList<AssignmentNoticeBoardVO> selectAssignmentNotice();
	public HashMap<String, Object> selectAssignmentNotice(String noticeId);
	public int updateHit(String noticeId);
	public int updateAssignmentTicket(AssignmentTicketVO ticketVo);
	public String selectEmail(String custId);
	public List<Transfer2VO> showInfoInEmail(AssignmentTicket2VO assignmentTicket2VO);
	public void insertAssignmentOrder(AssignmentOrderVO orderVo);
	public void insertAssignmentOrderDetail(AssignmentOrderDetailVO orderDetailVo);
	public int orderVerification(AssignmentOrderVO orderVo);
	public int updateFail(AssignmentOrderVO orderVo);
	public int updateSuccess(AssignmentOrderVO orderVo);
	public List<AssignmentTicketVO> selectSoldYn(String orderNo);
	public int updateAlreadySold(AssignmentOrderVO orderVo);
	public List<AssignmentOrderVO> selectListAssignmentOrder(String receiveCustId);
	public List<AssignmentOrderDetailVO> selectListAssignmentOrderDetail(String orderNo);
	public AssignmentOrderVO selectAssignmentOrder(@Param("receiveCustId") String receiveCustId, @Param("orderNo") String orderNo);
	public int updateAssignmentStatus(String noticeId);
}
