<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/css/login.css" rel="stylesheet" type="text/css">
<link href="/css/font3.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/kakaoLogin.js"></script>
<script src="/js/common.js"></script>
<script src="/js/login.js"></script>
</head>
<body>
	
  <div class="form-container sign-in-container">
    <form id="loginForm" name="loginForm" >
      <a href="/" class="logo">FiveDolls</a>
      <!-- <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div> -->
      <!-- <span>or use your account</span> -->
      <div id = "inputbox">
      	<input type="text" id="signupId" placeholder="아이디" />
      	<input type="password" id="signupPwd" placeholder="비밀번호" />
      </div>
      <div id=loginbox>
      	<button type="submit">로그인</button>
      </div>
      <div id="finemenu">
      	<a href="<c:url value='/member/privacyPolicy'/>">회원가입</a>
      	<a href="<c:url value='/member/searchId'/>">아이디 찾기</a>
      	<a href="/member/searchPwd">비밀번호 찾기</a>
      </div>
      <div id="social">
      	<a href="/naver/oauth" id="naverLoginBtn">
      		<img src= "../image/naverlogin.png">
      	</a>
      	<a href="/kakao/oauth" id="kakaoLoginBtn">
    		<img src="../image/kakaologin.png" alt="카카오 로그인">
		</a>
      </div> 
      
      
      <!-- kakaoInfo 변수를 숨겨진 요소로 추가 -->
      <div style="display:none;">
          <span id="kakaoInfo">${kakaoInfo}</span>
      </div>
      
    </form>
  </div>
</div>
</body>
</html>