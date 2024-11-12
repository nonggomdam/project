package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderDetailVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicket2VO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferReservationInfoVO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;

public interface ITransferDAO {
	public ArrayList<TransferVO> showTransInfo(String custId);
	public void insertAssignmentNotice(AssignmentNoticeBoardVO vo);
	public ArrayList<AssignmentNoticeBoardVO> selectAssignmentNotice();
	public String maxNoticeId();
	public void insertAssignmentTicket(AssignmentTicketVO ticketVo);
	public TransferReservationInfoVO selectSeatInfo(TransferReservationInfoVO infoVo);
	public AssignmentNoticeBoardVO selectAssignmentNotice(@Param("noticeId") String noticeId);
	public ArrayList<Transfer2VO> selectListTicketAndPerformance(String noticeId);
	public int updateHit(String noticeId);
	public int updateAssignmentTicket(AssignmentTicketVO ticketVo);
	public int updateCustId(@Param("receiveCustId") String receiveCustId, @Param("noticeId") String noticeId, @Param("assignmentSqno") String assignmentSqno);
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
