package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentOrderVO {
	
	private String orderNo;
	private String itemContent;
	private int amount;
	private String statusCd;
	private String settleDt;
	private String receiveCustId;
	private String paymentKey;
	private String cardNo;
	private String cardType;
	private String mainImage;
	private String settleMethod;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getStatusCd() {
		return statusCd;
	}
	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
	}
	public String getSettleDt() {
		return settleDt;
	}
	public void setSettleDt(String settleDt) {
		this.settleDt = settleDt;
	}
	
	public String getReceiveCustId() {
		return receiveCustId;
	}
	public void setReceiveCustId(String receiveCustId) {
		this.receiveCustId = receiveCustId;
	}
	public String getPaymentKey() {
		return paymentKey;
	}
	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getSettleMethod() {
		return settleMethod;
	}
	public void setSettleMethod(String settleMethod) {
		this.settleMethod = settleMethod;
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
		return "AssignmentOrderVO [orderNo=" + orderNo + ", itemContent=" + itemContent + ", amount=" + amount
				+ ", statusCd=" + statusCd + ", settleDt=" + settleDt + ", receiveCustId=" + receiveCustId
				+ ", paymentKey=" + paymentKey + ", cardNo=" + cardNo + ", cardType=" + cardType + ", mainImage="
				+ mainImage + ", settleMethod=" + settleMethod + ", firstChangeDate=" + firstChangeDate
				+ ", lastChangeDate=" + lastChangeDate + "]";
	}




	
	
}
