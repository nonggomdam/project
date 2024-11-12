package com.spring_boot_dolls_ticket.project.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring_boot_dolls_ticket.project.model.InquiryVO;
import com.spring_boot_dolls_ticket.project.model.MemberVO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;
import com.spring_boot_dolls_ticket.project.service.InquiryService;
import com.spring_boot_dolls_ticket.project.service.MemberService;
import com.spring_boot_dolls_ticket.project.service.ReservationService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	InquiryService inquiryService;
	
	private Map<String, Object> store = new ConcurrentHashMap<>(); // 세션 저장소
	
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("/member/privacyPolicy")
	public String privacyPolicy(){
		return "member/privacyPolicy";
	}
	
	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@ResponseBody
	@RequestMapping("/member/idCheck")
	public int idCheck(@RequestParam("id") String id) {
		String custId = memService.idCheck(id);
		
		int result = 0;
		if(custId != null) {
			result = 1;
		}
		return result; // view 결정하지 않고 result 변수값 그대로 요청
	}
	
	@RequestMapping("/member/join")
	public String join(MemberVO vo) {
		memService.insertMember(vo);
		return "redirect:/member/signupSuccess"; // 회원가입 후에 로그인페이지로 이동
	}
	
	@ResponseBody
	@RequestMapping("/member/login")
	public String loginCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd ,
							 HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("pwd", pwd);
        String result = memService.loginCheck(map); // MemberService의 loginCheck 메서드를 호출
        
        if("success".equals(result)) { // 로그인 성공시 세션 부여
        	session.setAttribute("sid", id);
        	
        	String administratorYn = memService.findAdministratorYnById(id);
        	session.setAttribute("administratorYn", administratorYn);
        	
        	// 관리자일 경우 /admin 리다이렉트 경로 반환
            if ("Y".equals(administratorYn)) {
                result = "admin";
            } else {
                result = "main";
            }
        } else {
        	result = "fail";
        }
        
        return result;
	}
	
	// 카카오 로그인
	@RequestMapping("/kakao/oauth")
	public void getKakaoAuthUrl(HttpServletResponse response) throws Exception {
	    String reqUrl = "https://kauth.kakao.com/oauth/authorize"
	            + "?client_id=0672e740c19121be04471cca72ca8d44"
	            + "&redirect_uri=http://localhost:8080/kakao/callback"
	            + "&response_type=code";
	    
	    response.sendRedirect(reqUrl); // 카카오 인증 URL로 리다이렉트
	}
	
	@RequestMapping("/kakao/callback")
	public String oauthKakao(
	        @RequestParam(value = "code", required = false) String code,
	        HttpSession session) throws Exception {
	    
	    // Access Token 가져옴
	    String access_Token = getAccessToken(code);
	    
	    HashMap<String, Object> userInfo = getUserInfo(access_Token);
	    
	    // 사용자 정보를 세션에 저장 , 세션 부여
	    session.setAttribute("accessToken", access_Token); // 액세스 토큰 저장
	    session.setAttribute("sid", userInfo);
	    
	    
	    return "redirect:/"; // 로그인 성공 시 메인 페이지로
	}
	
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=0672e740c19121be04471cca72ca8d44");  // REST API KEY
            sb.append("&redirect_uri=http://localhost:8080/kakao/callback");     // 리디렉션 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
	
	public HashMap<String, Object> getUserInfo(String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line;
	        StringBuilder result = new StringBuilder();

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());

	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String nickname = properties.has("nickname") ? properties.get("nickname").getAsString() : "이름 없음";
	        String email = kakao_account.has("email") ? kakao_account.get("email").getAsString() : "이메일 없음";

	        userInfo.put("accessToken", access_Token);
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);

	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return userInfo;
	}
	
	// naver 로그인
	@RequestMapping("/naver/oauth")
	public void getNaverAuthUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    // 새로운 UUID 생성 및 쿠키에 저장
	    String newUUID = UUID.randomUUID().toString();
	    Cookie uuidCookie = new Cookie("UUID", newUUID);
	    uuidCookie.setPath("/");
	    uuidCookie.setMaxAge(60 * 60 * 24); // 1일 유효
	    response.addCookie(uuidCookie); // 새로운 UUID 쿠키 추가

	    String reqUrl = "https://nid.naver.com/oauth2.0/authorize"
	            + "?client_id=M8tmkDymjlbYysnk7E5u"
	            + "&redirect_uri=http://localhost:8080/naver/callback"
	            + "&response_type=code"
	            + "&prompt=login"; // 로그인 화면 강제 표시;

	    response.sendRedirect(reqUrl); // 네이버 인증 URL로 리다이렉트
	}
	
	@RequestMapping("/naver/callback")
	public String oauthNaver(@RequestParam(value = "code", required = false) String code, 
	                          @RequestParam(value = "state", required = false) String state,
	                          HttpSession session) throws Exception {
	    String accessToken = getNaverAccessToken(code, state);
	    HashMap<String, Object> userInfo = getNaverUserInfo(accessToken);
	    
	    // 사용자 정보를 세션에 저장
	    session.setAttribute("accessToken", accessToken);
	    session.setAttribute("sid", userInfo);

	    return "redirect:/"; // 로그인 성공시 메인 페이지로
	}

	public String getNaverAccessToken(String code, String state) {
	    String accessToken = "";
	    String reqURL = "https://nid.naver.com/oauth2.0/token";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setDoOutput(true);

	        StringBuilder params = new StringBuilder();
	        params.append("client_id=M8tmkDymjlbYysnk7E5u");
	        params.append("&client_secret=ZX9Dc_7J0k");
	        params.append("&grant_type=authorization_code");
	        params.append("&code=").append(code);
	        params.append("&state=").append(state);

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(params.toString());
	        bw.flush();

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        // JSON 파싱
	        JsonObject jsonObject = JsonParser.parseString(result.toString()).getAsJsonObject();
	        accessToken = jsonObject.get("access_token").getAsString();

	        br.close();
	        bw.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return accessToken;
	}

	public HashMap<String, Object> getNaverUserInfo(String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://openapi.naver.com/v1/nid/me";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());

	        String nickname = element.getAsJsonObject().get("response").getAsJsonObject().get("nickname").getAsString();
	        String email = element.getAsJsonObject().get("response").getAsJsonObject().get("email").getAsString();

	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);

	        br.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return userInfo;
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
	    // 세션 무효화
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        // 액세스 토큰 삭제
	        String accessToken = (String) session.getAttribute("accessToken");
	        session.invalidate(); // 세션 무효화

	        // JSESSIONID 쿠키 만료
	        Cookie sessionCookie = new Cookie("JSESSIONID", null);
	        sessionCookie.setPath("/");
	        sessionCookie.setMaxAge(0); 
	        response.addCookie(sessionCookie); 

	        // UUID 쿠키 만료
	        Cookie uuidCookie = new Cookie("UUID", null);
	        uuidCookie.setPath("/");
	        uuidCookie.setMaxAge(0); 
	        response.addCookie(uuidCookie); 

	        // 카카오 로그아웃 호출
	        if (accessToken != null) {
	            kakaoLogout(accessToken);
	        }
	    }

	    return "redirect:/"; 
	}
	
	private Cookie findCookie(HttpServletRequest request) {
	    Cookie[] cookies = request.getCookies(); // 모든 쿠키 가져오기
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("JSESSIONID".equals(cookie.getName())) { // 쿠키 이름이 JSESSIONID인지 확인
	                return cookie; // 쿠키 반환
	            }
	        }
	    }
	    return null; // 쿠키가 없으면 null 반환
	}
	

	public void kakaoLogout(String accessToken) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        
	        System.out.println("Kakao logout response code: " + responseCode);
	        
	        // 로그아웃 결과 처리
	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line;
	        StringBuilder responseSb = new StringBuilder();
	        while ((line = br.readLine()) != null) {
	            responseSb.append(line);
	        }
	        br.close();
	    } 
	    catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	@RequestMapping("/member/searchId")
	public String searchId() {
		return "member/searchId";
	}
	@ResponseBody
	@RequestMapping("/member/findId")
	public ResponseEntity<List<String>> findId(@RequestBody Map<String, String> data) {
	    String name = data.get("name");
	    String email = data.get("email");
	    String phone = data.get("phone");

	    List<String> foundIds = memService.findId(name, email, phone);
	    
	    return ResponseEntity.ok(foundIds);
	}
	
	@RequestMapping("/member/findPwd")
    public ResponseEntity<List<String>> findPwd(@RequestBody Map<String, String> data) {
        String name = data.get("name");
        String email = data.get("email");
        String phone = data.get("phone");

        List<String> foundIds = memService.findId(name, email, phone);
        
        // 찾은 아이디 리스트 반환
        return ResponseEntity.ok(foundIds);
    }
	
	@RequestMapping("/member/resetPassword")
	public ResponseEntity<Void> resetPassword(@RequestBody Map<String, String> data) {
	    String name = data.get("name");
	    String email = data.get("email");
	    String newPassword = data.get("newPassword");

	    boolean success = memService.resetPassword(name, email, newPassword);
	    if (success) {
	        return ResponseEntity.ok().build(); // 성공적으로 비밀번호가 재설정됨
	    } else {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 실패 시
	    }
	}  
	
	@RequestMapping("/member/searchPwd")
	public String searchPwd() {
		return "member/searchPwd";
	}
	
	@RequestMapping("/member/searchPwwd")
	public String searchPwwd() {
		return "member/searchPwwd";
	}
	
	@PostMapping("/member/checkId")
	public ResponseEntity<Map<String, Boolean>> checkId(@RequestParam String id) {
	    boolean exists = memService.checkIdInDatabase(id);
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("exists", exists);
	    return ResponseEntity.ok(response);
	}
	
	@RequestMapping("/member/signupSuccess")
	public String signup_Success() {
		return "member/signupSuccess";
	}
	
	
	/**
	 * 마이페이지
	 */
	@RequestMapping("member/myPage")
	public String myPage(Model model,HttpSession session) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "member/loginPage";
		}
		String custId = (String)session.getAttribute("sid");
		
		MemberVO myInfo = memService.selectCustInfo(custId);
		
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setCustId(custId);
		reservationVO.setPageNbr(0);
		reservationVO.setPageOffSet(10000);
		ArrayList<ReservationVO> myPageReservationList = reservationService.reservationList(reservationVO);
		
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("totalCnt",myPageReservationList.size());
		//model.addAttribute("myPageReservationList",myPageReservationList);
		
		return "member/myPage";
	}
	
	/**
	 * 회원정보 수정
	 */
	@RequestMapping("member/correctionMember")
	public String correctionMemberPage(Model model, HttpSession session) {
		String custId=(String)session.getAttribute("sid");
		
		
		MemberVO myInfo = memService.selectCustInfo(custId);

		model.addAttribute("myInfo", myInfo);
		return "member/correctionMember";
	}
	
	
	/**
	 * 비밀번호 제외 수정
	 */
	@RequestMapping("/member/memberUpdate")
	public String updateMemberPage(MemberVO in) {
		
		memService.updateMember(in);
		
		return "redirect:/member/myPage"; 
	}
	
	/**
	 * 예매내역
	 */
	@RequestMapping("member/confirmation/{pageNbr}")
	public String Confirmation(@ModelAttribute ReservationVO in, @PathVariable int pageNbr, Model model,HttpSession session) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "member/loginPage";
		}
		String custId = (String)session.getAttribute("sid");
		//현재시간 구하기
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		int nowDate = Integer.parseInt(now.format(formatter));
		
		// 1개월 빼기
        LocalDate oneMonthBefore = now.minusMonths(1);
		int nowBefore1MonthDate = Integer.parseInt(oneMonthBefore.format(formatter));
		MemberVO myInfo = memService.selectCustInfo(custId);
		
		//총 페이징수 조회
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setCustId(custId);
		reservationVO.setPageNbr(0);
		reservationVO.setPageOffSet(10000);
		reservationVO.setStartDateStr(in.getStartDateStr() == null ? String.valueOf(nowBefore1MonthDate) : in.getStartDateStr());
		reservationVO.setEndDateStr(in.getEndDateStr() == null ? String.valueOf(nowDate) : in.getEndDateStr());
		ArrayList<ReservationVO> reservationList = reservationService.reservationList(reservationVO);
		if(reservationList.size() > 0) {
			model.addAttribute("totalPages",reservationList.size()/10 + 1);
		}
		model.addAttribute("currentPage",pageNbr);
		model.addAttribute("startDateStr",in.getStartDateStr());
		model.addAttribute("endDateStr",in.getEndDateStr());
		
		//리스트 조회
		reservationVO.setPageNbr(10 * pageNbr);
		reservationVO.setPageOffSet(10); 
		ArrayList<ReservationVO> reservationList2 = reservationService.reservationList(reservationVO);
		model.addAttribute("ReservationList",reservationList2);
		model.addAttribute("myInfo", myInfo);
		
		return "member/confirmation";
	}
	
	/**
	 * 비밀번호 변경
	 */
	@RequestMapping("member/passwordChange")
	public String showChangePassword() {
		return "member/changePasswordPage";
	}
	
	// 1:1 문의 내역 페이지 이동
	@RequestMapping("/member/myInquiry")
	public String inquiryList(Model model, @SessionAttribute("sid") String custId) {
	    List<InquiryVO> inquiryList = inquiryService.listAllInquiry(custId);
	    model.addAttribute("inquiryList", inquiryList);
	    return "member/myInquiryList";
	}
	
	// 1:1 문의 등록 페이지 이동
	@RequestMapping("/member/newInquiryForm")
	public String newInquiryForm() {
		return "member/newInquiryForm";
	}
	
	// 1:1 문의 등록 처리
	@RequestMapping("/member/insertInquiry")
	public String insertInquiry(@ModelAttribute InquiryVO inquiry, @SessionAttribute("sid") String custId) {
		inquiry.setCustId(custId);
		
		inquiryService.insertInquiry(inquiry);
		
		return "redirect:/member/myInquiry";
	}
	
	// 1:1 문의 상세 페이지 이동 처리
	@RequestMapping("/member/inquiryDetailView/{inquiryId}")
	public String inquiryDetailView(@PathVariable("inquiryId") int inquiryId, Model model) {
		InquiryVO inquiry = inquiryService.selectInquiry(inquiryId);

		model.addAttribute("inquiry", inquiry);
		
		return "member/inquiryDetailView";
	}
	
	/**
	 * 예매내역 수정
	 */
	@RequestMapping("member/updateReservation")
	public String updateMemberReservation(ReservationVO in) {
		
		memService.updateReservation(in);
		
		return "redirect:/member/confirmation/0"; 
	}

}