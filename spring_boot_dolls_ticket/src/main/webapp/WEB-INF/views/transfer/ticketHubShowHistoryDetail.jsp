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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubShowHistoryDetail.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
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
		

		
		<div class="bigDiv">
			<div class="fDiv">양수 결제내역 상세</div>
			<hr style="margin-top:30px;border:1px solid gray;">
			<div class="tDiv">
				<span class="fSpan"><fmt:formatDate value="${order.lastChangeDate}" pattern="YYYY.MM.dd HH:mm"/></span><br>
				<span style="font-weight:normal;">주문번호&nbsp;${order.orderNo}</span>
			</div>
			<div style="border:3px solid #eeeeee;margin-left:30px;border-radius:15px;padding:10px;">
			<c:forEach var="item" items="${list}">
	
						<table style='width:100%;font-weight:normal;font-size:18px;'>
									<tr>
										<td style='width:110px;'><img src="/image/${item.performanceImagePath}" style="width:100px;border-radius:10px;"></td>
										<td>
											
											<div><span style="color:gray;">예매번호&nbsp;${item.reservationId}</span></div>
											<div><span style="font-weight:600;">${item.performanceName}</span></div>
											<div>
												<span>일시 : <fmt:formatDate value="${item.performanceDate}" pattern="YYYY.MM.dd"/></span>
											</div>
											<div>
												<span>좌석 : ${item.reservationSeatKindCd}${item.reservationSeatNumber}석</span>
											</div>
											<div>
												<span>가격 : <fmt:formatNumber value="${item.price}" pattern="#,###"/>원</span>										
											</div>									
										</td>
									</tr>
								</table>							
	
			</c:forEach>
			</div>
			
			<div class="tDiv" style="margin-top:50px;">
				<span style="font-weight:normal;font-size:28px;">결제정보</span>
			</div>
			<div style="border:3px solid #eeeeee;margin-left:30px;border-radius:15px;padding:30px;font-weight:normal;font-size:18px;color:gray;line-height:40px;">
				<div>결제일시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${order.lastChangeDate}" pattern="YYYY.MM.dd HH:mm:ss"/></div>
				<div>결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${order.amount}" pattern="#,###"/>원</div>
				<div>결제방법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.settleMethod}(${order.cardType})</div>
				<div>카드정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.cardNo}</div>	
			</div>
			<div>
			
			
			</div>
			 
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	

	
</body>
</html>