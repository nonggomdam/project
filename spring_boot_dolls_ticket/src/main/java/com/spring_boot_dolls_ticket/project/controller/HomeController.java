package com.spring_boot_dolls_ticket.project.controller;

import java.text.SimpleDateFormat;
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
    public String index(ModelMap modelMap, PerformanceVO in) {
        
        List<PerformanceVO> performanceList = performanceService.selectPerformance();
        List<PerformanceVO> performanceRankingList = performanceService.selectRanking();
        List<PerformanceVO> performanceOpenList = new ArrayList<>();
        List<PerformanceVO> performanceOpenExpectedList = new ArrayList<>();
        List<PerformanceVO> consertOpenList = new ArrayList<>();
        
        if (performanceList != null && !performanceList.isEmpty()) {

            Date today = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
            String dateString = formatter.format(today);
            int dateInt = Integer.parseInt(dateString); // String을 int로 변환

            for (PerformanceVO performance : performanceList) {
                Date reservationDate = performance.getReservationOpenExpectedDate();

                if (reservationDate != null) {
                    String reservationDateString = formatter.format(reservationDate);
                    int reservationDateInteger = Integer.parseInt(reservationDateString);
                    System.out.println("Reservation Date (String): " + reservationDateString);
                    int Dday = reservationDateInteger - dateInt;
                    performance.setReservationDateInteger(Dday); // Dday 설정
                } else {
                    // reservationDate가 null일 경우 예외처리 또는 기본값 처리
                    performance.setReservationDateInteger(0); // 예시: 0으로 처리
                }
            }
            
            // 뮤지컬, 예매가능한 뮤지컬만 필터링
            performanceOpenList = performanceRankingList.stream()
                .filter(o -> "M".equals(o.getPerformanceKindCd())) // 뮤지컬만 필터링
                .filter(o -> o.getMinPerformanceDate() != null) // 널인 애들 제외
                .filter(o -> o.getReservationOpenExpectedDate() != null && today.compareTo(o.getReservationOpenExpectedDate()) > 0) // 널 체크 및 예약일 비교
                .limit(8)
                .collect(Collectors.toList());

            // 뮤지컬, 오픈예정인 애들만 필터링
            performanceOpenExpectedList = performanceList.stream()
                .filter(o -> "M".equals(o.getPerformanceKindCd()) || "C".equals(o.getPerformanceKindCd())) // 뮤지컬 및 콘서트
                .filter(o -> o.getMinPerformanceDate() != null) // 널인 애들 제외
                .filter(o -> o.getReservationOpenExpectedDate() != null && today.compareTo(o.getReservationOpenExpectedDate()) <= 0 && today.compareTo(o.getMaxPerformanceDate()) <= 0) // 널 체크 및 날짜 비교
                .limit(8)
                .collect(Collectors.toList());

            // 콘서트, 오픈예정인 애들만 필터링
            consertOpenList = performanceRankingList.stream()
                .filter(o -> "C".equals(o.getPerformanceKindCd())) // 콘서트만 필터링
                .filter(o -> o.getMinPerformanceDate() != null) // 널인 애들 제외
                .filter(o -> o.getReservationOpenExpectedDate() != null && today.compareTo(o.getReservationOpenExpectedDate()) > 0) // 널 체크 및 예약일 비교
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
