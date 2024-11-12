package com.spring_boot_dolls_ticket.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_dolls_ticket.project.model.MemberVO;
import com.spring_boot_dolls_ticket.project.model.PerformancePaymentVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;
import com.spring_boot_dolls_ticket.project.model.ReviewVO;
import com.spring_boot_dolls_ticket.project.service.MemberService;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;
import com.spring_boot_dolls_ticket.project.service.ReservationService;
import com.spring_boot_dolls_ticket.project.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PerformanceController {

	@Autowired
	PerformanceService pfmservice;
	
	@Autowired
	ReviewService rvService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping("/performance/musical")
	public String musical(ModelMap modelMap) {
		

		List<PerformanceVO> performanceList = pfmservice.selectPerformance();
		List<PerformanceVO> performanceOpenList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> performanceOpenExpectedList = new ArrayList<PerformanceVO>();
		
		
		if(performanceList != null && performanceList.size() != 0) {
			
			//현재시간 구하기
			//LocalDate now = LocalDate.now();
			//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			//int nowDate = Integer.parseInt(now.format(formatter));
			
			Date today = new Date();
			//뮤지컬, 예매가능한 뮤지컬만 필터링
			performanceOpenList = performanceList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()))
														  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter(o -> o.getReservationOpenExpectedDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0 && today.compareTo(o.getMaxPerformanceDate()) <= 0)
											/*			  .limit(8) */
														  .collect(Collectors.toList());
			//뮤지컬, 오픈예정인 애들만 필터링	
			performanceOpenExpectedList = performanceList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()))
																  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter(o -> o.getReservationOpenExpectedDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) <= 0)
																  .limit(8)
																  .collect(Collectors.toList());
		}
		
		modelMap.put("performanceOpenList", performanceOpenList);
		modelMap.put("performanceOpenExpectedList", performanceOpenExpectedList);
		
		return "performance/musical";
		
	}
	

	
	@RequestMapping("/performance/concert")
	public String concert(ModelMap modelMap) {
		
		List<PerformanceVO> performanceConsertList = pfmservice.selectPerformance();
		List<PerformanceVO> consertOpenList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> consertOpenExpectedList = new ArrayList<PerformanceVO>();
		
		if(performanceConsertList != null && performanceConsertList.size() != 0) {
			//현재시간 구하기
//			LocalDate now = LocalDate.now();
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//			int nowDate = Integer.parseInt(now.format(formatter));
			
			Date today = new Date();
			//뮤지컬, 상영중인 뮤지컬만 필터링
			consertOpenList = performanceConsertList.stream().filter( o -> "C".equals(o.getPerformanceKindCd()))
														  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter(o -> o.getReservationOpenExpectedDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0 && today.compareTo(o.getMaxPerformanceDate()) <= 0)
											/*			  .limit(8)   */
														  .collect(Collectors.toList());
			
			//뮤지컬, 오픈예정인 애들만 필터링	
			consertOpenExpectedList = performanceConsertList.stream().filter( o -> "C".equals(o.getPerformanceKindCd()))
																  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> o.getReservationOpenExpectedDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) <= 0)
																  .limit(8)
																  .collect(Collectors.toList());
		}
		
		System.out.println(consertOpenExpectedList.size());
		modelMap.put("consertOpenList", consertOpenList);
		modelMap.put("consertOpenExpectedList", consertOpenExpectedList);
		
		
		return "performance/concert";
		
	}
	
	// 상세페이지
	@RequestMapping("/performance/detailViewPerformance/{performanceId}")
	public String detailViewPerformance(@PathVariable String performanceId, Model model) {
		PerformanceVO pfm =pfmservice.detailViewPerformance(performanceId);
		model.addAttribute("pfm",pfm);
		ArrayList<ReviewVO> reviewList = rvService.reviewList(performanceId);
		model.addAttribute("reviewList", reviewList);
		return "performance/performanceDetail";
	}
	// 리뷰기능
	@RequestMapping("/performance/insertReview") 
	public String insertReview(ReviewVO vo, HttpSession session, HttpServletRequest request) {
	    // 세션에서 사용자 ID 가져오기
	    String custId = (String) session.getAttribute("sid");
	    vo.setCustId(custId); 
	    vo.setPerformanceId(request.getParameter("performanceId"));
	    rvService.insertReview(vo);
	    return "redirect:/performance/detailViewPerformance/"+vo.getPerformanceId();
	}
	
	@RequestMapping(value = "/performance/deleteReview", method = RequestMethod.POST)
	@ResponseBody
	public String deleteReview(@RequestParam("reviewSeq") int reviewSeq, ReviewVO vo, HttpServletRequest request) {
		vo.setPerformanceId(request.getParameter("performanceId"));
	    rvService.deleteReview(reviewSeq); // 리뷰 삭제 처리
	    return "redirect:/performance/detailViewPerformance/"+vo.getPerformanceId();
	}

	
	
	/**
	 * 날짜선택 페이지
	 */
	@RequestMapping("performance/dateReservation/{performanceId}")
	public String dateReservation(@PathVariable String performanceId, ModelMap modelMap, Model model, HttpSession session) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "erorrPage";
		}
		
		ArrayList<String> arr = new ArrayList<String>();
		/*
		 * 공연 스케쥴 목록 조회
		 */
		List<PerformanceScheduleVO> performanceDateList = pfmservice.selectPerformanceDate(performanceId);
		PerformanceVO performanceInfo = pfmservice.detailViewPerformance(performanceId);
		if(performanceDateList != null && performanceDateList.size() > 0) {
			for (PerformanceScheduleVO o : performanceDateList) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHH:mm");
				arr.add(simpleDateFormat.format(o.getPerformanceDate()));
			}
		}
		//시간정렬
		Collections.sort(arr);
	    modelMap.put("performanceDateList", arr); //공연스케쥴
	    model.addAttribute("performanceId", performanceId);
	    model.addAttribute("performanceInfo", performanceInfo);
	    
		return "performance/seatDateInfo";
	}
	
	/**
	 * 좌석정보
	 */
	@RequestMapping("performance/dateReservation/seatInfo")
	@ResponseBody
	public List<PerformanceSeatVO> dateReservation(@RequestBody PerformanceSeatVO performanceSeatVO) {
		
		performanceSeatVO.setPerformanceDate(performanceSeatVO.getPerformanceDate().replace(":", ""));
		
		/*
		 * 잔여 좌석 조회
		 */
		List<PerformanceSeatVO> performanceSeatInfo = pfmservice.selectPerformanceSeatInfoList(performanceSeatVO);
		
		return performanceSeatInfo;
	}
	
	/**
	 * 좌석예매 페이지
	 */
	@RequestMapping("performance/seatReservation/{performanceId}/{performanceDate}")
	public String seatReservation(@PathVariable String performanceId,@PathVariable String performanceDate,Model model, ModelMap modelMap,HttpSession session ) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "erorrPage";
		}
		
		PerformanceSeatVO performanceSeatVO = new PerformanceSeatVO();
		performanceSeatVO.setPerformanceId(performanceId);
		performanceSeatVO.setPerformanceDate(performanceDate);
		
		/*
		 * 잔여 좌석 조회
		 */
		List<PerformanceSeatVO> performanceSeatInfoList = pfmservice.selectPerformanceSeatInfoList(performanceSeatVO);
		
		//공연정보
		PerformanceVO performanceInfo = pfmservice.detailViewPerformance(performanceId);
		
		PerformanceVO performanceVO = new PerformanceVO();
		
		model.addAttribute("performanceId", performanceId);
		model.addAttribute("performanceDate", performanceDate);
		model.addAttribute("performanceInfo", performanceInfo);
		
		modelMap.put("performanceRSeatInfoList", performanceSeatInfoList.stream().filter( o -> "R".equals(o.getSeatKindCd())).collect(Collectors.toList())); //공연스케쥴
		modelMap.put("performanceSSeatInfoList", performanceSeatInfoList.stream().filter( o -> "S".equals(o.getSeatKindCd())).collect(Collectors.toList())); //공연스케쥴
		
		return "performance/ticketSeatInfo";
	}
	
	/**
	 * 결제페이지
	 */
	@RequestMapping("performance/paymentPage")
	public String paymentPage(@ModelAttribute PerformancePaymentVO performancePaymentVO, HttpSession session, Model model, ModelMap modelMap) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "erorrPage";
		}
		
		//고객정보
		MemberVO myInfo = memberService.selectCustInfo(session.getAttribute("sid").toString());
		
		//공연정보
		PerformanceVO performanceInfo = pfmservice.detailViewPerformance(performancePaymentVO.getPerformanceId());
		
		try {
			//SimpleDateFormat을 사용한 날짜 형식 지정
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm");
			performanceInfo.setPerformanceDate(formatter.parse(performancePaymentVO.getPerformanceDate()));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		//좌석정보
		List<PerformanceSeatVO> performanceSeatInfoList = new ArrayList<PerformanceSeatVO>();  
		String[] seatInfo = performancePaymentVO.getTotalSeatInfo().split(",");
		for (int i = 0; i < seatInfo.length; i++) {
			String seatKindCd = seatInfo[i].trim().substring(0,1);
			int seatNumber = Integer.parseInt(seatInfo[i].trim().substring(1));
			PerformanceSeatVO performanceSeatVO = new PerformanceSeatVO();
			performanceSeatVO.setPerformanceDate(performancePaymentVO.getPerformanceDate());
			performanceSeatVO.setPerformanceId(performancePaymentVO.getPerformanceId());
			performanceSeatVO.setSeatKindCd(seatKindCd);
			performanceSeatVO.setSeatNumber(seatNumber);
			PerformanceSeatVO performanceSeatInfo = pfmservice.selectPerformanceSeatInfo(performanceSeatVO);
			performanceSeatInfoList.add(performanceSeatInfo);
		}
		
		PerformanceSeatVO performanceSeatVO = new PerformanceSeatVO();
		performanceSeatVO.setTotalSeatCnt(performanceSeatInfoList.size());
		
		StringBuilder sb = new StringBuilder();
		if(performanceSeatInfoList.size() != 0 ) {
			int totalPrice = 0; 
			for (PerformanceSeatVO o : performanceSeatInfoList) {
				totalPrice += o.getSeatPrice();
				sb.append(o.getSeatKindCd()).append(o.getSeatNumber()).append(",");
			}
			performanceSeatVO.setTotalSeatPrice(totalPrice);
			if(sb.length() > 0 ) {
				sb.deleteCharAt(sb.lastIndexOf(","));
			}
			performanceSeatVO.setTotalSeat(sb.toString());
		}
		
		model.addAttribute("custInfo", myInfo);
		model.addAttribute("performanceInfo", performanceInfo);
		model.addAttribute("performanceSeatInfo", performanceSeatVO);
		//modelMap.put("performanceSeatInfoList", performanceSeatInfoList);
		return "performance/paymentPage";
	}
	
	/**
	 * 결제페이지
	 */
	@RequestMapping("performance/paymentPage/payment")
	public String payment(@ModelAttribute ReservationVO reservationVO, HttpSession session, Model model, ModelMap modelMap) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "erorrPage";
		}
		
		reservationVO.setCustId(session.getAttribute("sid").toString());
		String[] seatInfo = reservationVO.getReservationSeatInformation().trim().split(",");
		
		
		for (String seat : seatInfo) {
			
			ReservationVO in = new ReservationVO();
			in.setPerformanceId(reservationVO.getPerformanceId());
			in.setCustId(reservationVO.getCustId());
			in.setPerformanceDate(reservationVO.getPerformanceDate());
			in.setReservationSeatKindCd(seat.substring(0,1).trim());
			in.setReservationSeatNumber(Integer.parseInt(seat.substring(1).trim()));
			
			System.out.println(in.getPerformanceId());
			System.out.println(in.getCustId());
			System.out.println(in.getPerformanceDate());
			System.out.println(in.getReservationSeatKindCd());
			System.out.println(in.getReservationSeatNumber());
			
			ReservationVO out = reservationService.getReservation(in);
			System.out.println(out);
			if( out != null) {
				return "erorrPage";
			}
			pfmservice.insertReservationInfo(in);
		}
		
		return "redirect:/member/myPage";
	}
	
	
/*	
	@GetMapping("/") // DB에서 메인페이지로 정보 가져오기
	public String showPerformances(Model model) {
	    List<PerformanceVO> performances = pfmservice.getRankedPerformances(); // 서비스에서 데이터 가져오기
	    model.addAttribute("performances", performances); // 모델에 추가
	    System.out.println("Performances size: " + performances.size());
	    return "index"; // 메인 페이지에 해당하는 JSP로 반환
	}
	
	@PostMapping("/performance/click/{performanceId}")
	public ResponseEntity<Void> incrementClickCount(@PathVariable String performanceId) {
	    System.out.println("컨트롤러 메서드 호출됨: " + performanceId); // 로그 추가
	    if (performanceId == null || performanceId.isEmpty()) {
	        return ResponseEntity.badRequest().build();
	    }
	    pfmservice.incrementClickCount(performanceId);
	    
	    System.out.println("클릭 카운트 증가 완료: " + performanceId);
	    return ResponseEntity.ok().build();
	}
	
	@PostMapping("/admin/performanceDetailView/{performanceId}")
	public String adminPerformanceDetailView(@PathVariable String performanceId, Model model) {
	    
		return "/admin/performanceDetailView/" + performanceId;
	}
	*/
}
