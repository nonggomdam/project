<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>티켓 양도</title>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubError.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
</head>
<body>

		<div id="wrapper">
		<div class="banner" style="width:100%; height:80px;line-height:20px;">
		    <div class="text-box small-text">안전하고 투명한 <span style="font-weight:bold;color:#a22110;">티켓 양도</span> 거래!</div>
		    <div class="text-inline">
		        <span style="font-size:25px;">신뢰할 수 있는</span>
		        <span class="large-text">파이브돌스</span>
		        <span style="font-size:25px;">에서 안전하게</span>
		        <span class="text-box2 small-text hide-and-slide stylish-box" style="display:inline-block;"><span style="font-weight:bold;">티켓</span>을 <span style="font-weight:bold;">양도</span>하세요</span>
		    </div>
		</div>
		
		
		<div id="complete">
			<p>${msg}</p>
			<a href="<c:url value='/transfer/list'/>"><h4 class="line">[로그인 하기]</h4></a>
		</div>
	
	</div>
		
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		
</body>
</html>