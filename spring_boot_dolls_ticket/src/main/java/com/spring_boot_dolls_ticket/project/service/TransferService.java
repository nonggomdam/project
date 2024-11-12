package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.ITransferDAO;
import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderDetailVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicket2VO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferReservationInfoVO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;

@Service
public class TransferService implements ITransferService{

	@Autowired
	@Qualifier("ITransferDAO")
	ITransferDAO tdao;

	@Override
	public ArrayList<TransferVO> showTransInfo(String custId) {
		return tdao.showTransInfo(custId);
	}

	@Override
	public void insertAssignmentNotice(AssignmentNoticeBoardVO vo) {
		
		String noticeId=tdao.maxNoticeId();
		vo.setNoticeId(noticeId);
		
		tdao.insertAssignmentNotice(vo);
		
		
		String[] arr = vo.getReservationId();
		
		for(int i=0; i < arr.length; i++) {
			AssignmentTicketVO ticketvo = new AssignmentTicketVO();
			ticketvo.setNoticeId(noticeId);
			ticketvo.setReservationId(arr[i]);
			
			TransferReservationInfoVO infovo = new TransferReservationInfoVO();
			infovo.setReservationId(arr[i]);
			infovo.setCustId(vo.getCustId());
			infovo = tdao.selectSeatInfo(infovo);
			
			tdao.insertAssignmentTicket(ticketvo);
		}
		
		
	}

	@Override
	public ArrayList<AssignmentNoticeBoardVO> selectAssignmentNotice() {
		
		return tdao.selectAssignmentNotice();
	}

	@Override
	public HashMap<String, Object> selectAssignmentNotice(String noticeId) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		AssignmentNoticeBoardVO nb = tdao.selectAssignmentNotice(noticeId);
		
		ArrayList<Transfer2VO> t2 = tdao.selectListTicketAndPerformance(noticeId);
		
		map.put("nb", nb);
		map.put("list", t2);
		
		return map;
	}

	@Override
	public int updateHit(String noticeId) {
		int hit=tdao.updateHit(noticeId);
		return hit;
	}

	@Override
	public int updateAssignmentTicket(AssignmentTicketVO ticketVo) {
		int ticketUpdate = tdao.updateAssignmentTicket(ticketVo);
		
		String receiveCustId=ticketVo.getReceiveCustId();
		String noticeId=ticketVo.getNoticeId();
		String assignmentSqno=ticketVo.getAssignmentSqno();  
		
		int custIdUpdate = tdao.updateCustId(receiveCustId, noticeId, assignmentSqno);
			
		
		return ticketUpdate;
	}

	@Override
	public String selectEmail(String custId) {
		
		return tdao.selectEmail(custId);
	}

	@Override
	public List<Transfer2VO> showInfoInEmail(AssignmentTicket2VO assignmentTicket2VO) {
		
		return tdao.showInfoInEmail(assignmentTicket2VO);
	}

	@Override
	public void insertAssignmentOrder(AssignmentOrderVO orderVo) {
		tdao.insertAssignmentOrder(orderVo);
		
	}

	@Override
	public void insertAssignmentOrderDetail(AssignmentOrderDetailVO orderDetailVo) {
		tdao.insertAssignmentOrderDetail(orderDetailVo);
		
	}

	@Override
	public int orderVerification(AssignmentOrderVO orderVo) {
		int amt = tdao.orderVerification(orderVo);
		return amt;
	}

	@Override
	public int updateFail(AssignmentOrderVO orderVo) {
		int fail = tdao.updateFail(orderVo);
		return fail;
	}

	@Override
	public int updateSuccess(AssignmentOrderVO orderVo) {
		int success = tdao.updateSuccess(orderVo);
		return success;
	}

	
	@Override
	public List<AssignmentTicketVO> selectSoldYn(String orderNo) {
		List<AssignmentTicketVO> checkY = tdao.selectSoldYn(orderNo);
		return checkY;
	}

	@Override
	public int updateAlreadySold(AssignmentOrderVO orderVo) {
		int already = tdao.updateAlreadySold(orderVo);
		return already;
	}

	@Override
	public List<AssignmentOrderVO> selectListAssignmentOrder(String receiveCustId) {
		List<AssignmentOrderVO> showAssign=tdao.selectListAssignmentOrder(receiveCustId);
		return showAssign;
	}

	@Override
	public List<AssignmentOrderDetailVO> selectListAssignmentOrderDetail(String orderNo) {
		List<AssignmentOrderDetailVO> showOrderDetail = tdao.selectListAssignmentOrderDetail(orderNo);
		return showOrderDetail;
	}

	@Override
	public AssignmentOrderVO selectAssignmentOrder(String receiveCustId, String orderNo) {
		AssignmentOrderVO showOrder = tdao.selectAssignmentOrder(receiveCustId, orderNo);
		return showOrder;
	}

	@Override
	public int updateAssignmentStatus(String noticeId) {
		int status = tdao.updateAssignmentStatus(noticeId);
		return 0;
	}

	
	
	
	

	
	
	

	
	

	
	
	
}
