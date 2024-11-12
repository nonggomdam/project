package com.spring_boot_dolls_ticket.project.model;   

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private String custId;
	private String custPassWord;
	private String custName;
	private String custGender;
	private String administratorYN;
	private String custResidentNumber;
	private String custEmail;
	private String custPhoneNumber;
	private String custZipcode;
	private String custAddress;
	private String custDetailAddress;
	private String custStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	  
	public MemberVO() {}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPassWord() {
		return custPassWord;
	}

	public void setCustPassWord(String custPassWord) {
		this.custPassWord = custPassWord;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustGender() {
		return custGender;
	}

	public void setCustGender(String custGender) {
		this.custGender = custGender;
	}

	public String getAdministratorYN() {
		return administratorYN;
	}

	public void setAdministratorYN(String administratorYN) {
		this.administratorYN = administratorYN;
	}

	public String getCustResidentNumber() {
		return custResidentNumber;
	}

	public void setCustResidentNumber(String custResidentNumber) {
		this.custResidentNumber = custResidentNumber;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustPhoneNumber() {
		return custPhoneNumber;
	}

	public void setCustPhoneNumber(String custPhoneNumber) {
		this.custPhoneNumber = custPhoneNumber;
	}

	public String getCustZipcode() {
		return custZipcode;
	}

	public void setCustZipcode(String custZipcode) {
		this.custZipcode = custZipcode;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public String getCustDetailAddress() {
		return custDetailAddress;
	}

	public void setCustDetailAddress(String custDetailAddress) {
		this.custDetailAddress = custDetailAddress;
	}

	public String getCustStatus() {
		return custStatus;
	}

	public void setCustStatus(String custStatus) {
		this.custStatus = custStatus;
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
	
}
