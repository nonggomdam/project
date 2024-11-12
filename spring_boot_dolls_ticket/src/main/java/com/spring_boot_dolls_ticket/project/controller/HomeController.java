package com.spring_boot_dolls_ticket.project.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;




@Controller
public class HomeController {
	
	@Autowired
	PerformanceService performanceService;

	@RequestMapping("/")
	public String index(ModelMap modelMap,PerformanceVO in) {
		
		
		List<PerformanceVO> performanceList = performanceService.selectPerformance();
		
		List<PerformanceVO> performanceRankingList = performanceService.selectRanking();
		List<PerformanceVO> performanceOpenList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> performanceOpenExpectedList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> consertOpenList = new ArrayList<PerformanceVO>();
		
		
		if(performanceList != null && performanceList.size() != 0) {
			
			

			Date today = new Date();
			//뮤지컬, 예매가능한 뮤지컬만 필터링
			performanceOpenList = performanceRankingList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()))
														  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0)
														  .limit(8)
														  .collect(Collectors.toList());
			//뮤지컬, 오픈예정인 애들만 필터링	
			performanceOpenExpectedList = performanceList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()) || "C".equals(o.getPerformanceKindCd()))
																  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) <= 0 && today.compareTo(o.getMaxPerformanceDate()) <= 0)
																  .limit(8)
																  .collect(Collectors.toList());
			
			consertOpenList = performanceRankingList.stream().filter( o -> "C".equals(o.getPerformanceKindCd()))
					  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
					  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0)
					  .limit(8)
					  .collect(Collectors.toList());

		}
		
		modelMap.put("performanceOpenList", performanceOpenList);
		modelMap.put("performanceOpenExpectedList", performanceOpenExpectedList);
		modelMap.put("consertOpenList", consertOpenList);
		
		return "index";
		
	}

	@RequestMapping("/orderDetail")
	public String orderDetail() {
		
		return "member/orderDetail";
		
	}
	
}
