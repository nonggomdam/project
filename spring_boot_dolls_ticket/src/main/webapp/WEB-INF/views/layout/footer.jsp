<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
	<div id="footerMenuBox">
		<ul id="footerMenuItem">
			<li><a href="#">회사 소개</a></li>
			<li><a href="#">이용 약관</a></li>
			<li><a href="#">개인 정보 처리 방침</a></li>
			<li><a href="#">전자 금융 거래 약관</a></li>
			<li><a href="#">보안 센터</a></li>
			<li><a href="#">채용 정보</a></li>
		</ul>
	</div>
	<div id="companyInfo">
		<div id="siteName">
			<a href="<c:url value='/'/>"><span>FiveDolls</span></a>
		</div>
		<div id="info">
			<p class="name">파이브 돌스(주)</p>
			<p>
			대표 : 홍길동<br>
			주소 : 서울특별시 강남구 도곡로 112 서한 빌딩 3층<br>
			이메일 : fivedollsmail@gmail.com<br>
			고객 센터 : 1234-1234&nbsp;&nbsp;<a href="">1:1 문의 > </a><br>
			사업자 등록 번호 : 123-45-6789<br>
			통신 판매업 신고 : 제1234-5678호&nbsp;&nbsp;<a href="">사업자 정보 확인 > </a></p>
			<p>Copyright © FiveDolls Corp. All Rights Reserved. </p>
		</div>
		<div id="cs">
			<p class="tel">1234-1234</p>
			<dl>
				<dt>평일</dt><dd>09:00~18:00</dd>
				<dt>토요일</dt><dd>09:00~17:00<br>(일요일 및 공휴일 휴무)</dd>
			</dl>
		</div>
	</div>
	<div class="goTop">
		<a id="topBtn"><img src="<c:url value='/image/icons8-arrow-100.png'/>"></a>
	</div>
</footer>