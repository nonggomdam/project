package com.spring_boot_dolls_ticket.project.model;

public class PerformancePaymentVO {
		
		private String performanceId ; //입력값 용도로 사용
	    private String performanceDate ; //입력값 용도로 사용
	 	private String totalSeatInfo;
	 	private String seatKindCd;             
	    private int seatNumber;
		public String getPerformanceId() {
			return performanceId;
		}
		public void setPerformanceId(String performanceId) {
			this.performanceId = performanceId;
		}
		public String getPerformanceDate() {
			return performanceDate;
		}
		public void setPerformanceDate(String performanceDate) {
			this.performanceDate = performanceDate;
		}
		public String getTotalSeatInfo() {
			return totalSeatInfo;
		}
		public void setTotalSeatInfo(String totalSeatInfo) {
			this.totalSeatInfo = totalSeatInfo;
		}
		public String getSeatKindCd() {
			return seatKindCd;
		}
		public void setSeatKindCd(String seatKindCd) {
			this.seatKindCd = seatKindCd;
		}
		public int getSeatNumber() {
			return seatNumber;
		}
		public void setSeatNumber(int seatNumber) {
			this.seatNumber = seatNumber;
		}

	    
}
