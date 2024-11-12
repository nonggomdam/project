package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PerformanceScheduleVO {
	
	 	private String performanceId; // 공연 ID
	 	private String performanceLocationId; // 공연장 ID
	    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	    private Date performanceDate; // 공연 날짜 (년, 월, 일, 시, 분)
	    private Date firstChangeDate; // 처음 변경된 날짜
	    private Date lastChangeDate; // 마지막 변경된 날짜..
		public String getPerformanceId() {
			return performanceId;
		}
		public void setPerformanceId(String performanceId) {
			this.performanceId = performanceId;
		}
		public String getPerformanceLocationId() {
			return performanceLocationId;
		}
		public void setPerformanceLocationId(String performanceLocationId) {
			this.performanceLocationId = performanceLocationId;
		}
		public Date getPerformanceDate() {
			return performanceDate;
		}
		public void setPerformanceDate(Date performanceDate) {
			this.performanceDate = performanceDate;
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
