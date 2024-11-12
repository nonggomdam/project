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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubFillOut.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/ticketHubCheckYN.js'/>"></script>
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
	
		
		<div id="box" style="width:60%;">
			<form action="<c:url value='/transfer/regist'/>" method="post">
			<table>
				
				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">양도인 ID</span></th>
				</tr>
				<tr>
					<td style="border-bottom:1px solid lightgray"><div style="margin-top:-10px;"><span>${sessionScope.sid}</span></div></td>
				</tr>
				
				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">제목</span></th>
				</tr>
				<tr>
					<td style="border-bottom:1px solid lightgray;"><input type="text" id="title" style="margin-left:40px;margin-bottom:15px;margin-top:12px;" placeholder="ex) 티켓 양도합니다." name="noticeTitle"></td>
				</tr>

				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">내 주문 티켓 중 양도 가능 티켓</span></th>
				</tr>
				<tr>	
					<td>
						<c:forEach var="show" items="${showInfo}"> 
							<div class="show-item">
								<table style='width:100%;'>
								<tr>
									<td><input type="checkbox" style="width:20px;" value="${show.reservationId}" name="reservationId"></td>
									<td><a href="<c:url value='/performance/detailViewPerformance/${show.performanceId}'/>"><img src="/image/${show.performanceImagePath}" width='150px'></a></td>
									<td>
										
										<div>
											<span>${show.performanceKindCd}</span>
										</div>
										<div>
											<span>${show.performanceName}</span>
										</div>
										<div>
											<span>일시 : ${show.performanceDate}</span>
										</div>
										<div>
											<span>좌석 : ${show.reservationSeatKindCd}${show.reservationSeatNumber}석</span>
										</div>
										<div>
											<span>가격 : <fmt:formatNumber value="${show.price}" pattern="#,###"/>원</span>
										</div>									
									</td>
								</tr>
								</table>
							</div>	
						</c:forEach>	
					</td>	
				</tr>
			</table>
		</div>
		
		<button id="submitBtn" type="submit">양도 신청하기</button>
		</form>
	</div>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>