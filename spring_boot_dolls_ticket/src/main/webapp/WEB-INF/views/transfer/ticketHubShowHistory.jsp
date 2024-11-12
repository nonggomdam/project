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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubShowHistory.css'/>">
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
			<div class="fDiv">양수 결제내역</div>

			<c:forEach var="item" items="${list}">
				<div class="sDiv">
					<div class="tDiv">${item.settleDt}&nbsp;&nbsp;
						<span class="fSpan">주문번호&nbsp;${item.orderNo}</span>
						<a href="/transfer/assignHistoryDetail/${item.orderNo}"><span class="sSpan">주문 상세보기&nbsp;&nbsp;></span></a>
					</div>
					<div class="inner-div">
						<table style="width:100%;">
							<tr>
								<td style="width:20px;"><img src="/image/${item.mainImage}" style="width:110px;padding:5px;border-radius:15px;"></td>
								<td style="line-height:40px;"><span style="font-weight:bold;">${item.itemContent}</span><br><fmt:formatNumber value="${item.amount}" pattern="#,###"/>원</td>
						
							</tr>
						
						</table>
					</div>					
				</div>
			</c:forEach> 
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>