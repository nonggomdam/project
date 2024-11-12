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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubList.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
</head>
<body>

	<div id="wrapper">
		<div class="banner" style="width:100%; height:80px;">
		    <div class="text-box small-text">안전하고 투명한 <span style="font-weight:bold;color:#a22110;">티켓 양도</span> 거래!</div>
		    <div class="text-inline">
		        <span style="font-size:25px;">신뢰할 수 있는</span>
		        <span class="large-text">파이브돌스</span>
		        <span style="font-size:25px;">에서 안전하게</span>
		        <span class="text-box2 small-text hide-and-slide stylish-box" style="display:inline-block;"><span style="font-weight:bold;">티켓</span>을 <span style="font-weight:bold;">양도</span>하세요</span>
		    </div>
		</div>
		
		<div id="fillout">
			<c:if test="${sessionScope.sid == null }">
				<a onclick="showLoginAlert()"><span>티켓 양도하기</span></a>
			</c:if>
			<c:if test="${sessionScope.sid != null }">
				<a href="<c:url value='/transfer/regForm'/>"><span>티켓 양도하기</span></a>
			</c:if>
			<c:if test="${sessionScope.sid == null }">
				<a onclick="showLoginAlert()"><span style="background-color:#20B2AA;color:white;">나의 양수내역</span></a>
			</c:if>
			<c:if test="${sessionScope.sid != null }">
				<a href="<c:url value='/transfer/assignHistory'/>"><span style="background-color:#20B2AA;color:white;">나의 양수내역</span></a>
			</c:if>
		</div>
		
		<div id="box" style="width:60%;">
			<table>
				<tr id="firstrow">
					<th>번호</th>
					<th colspan="3">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
					<th>상태</th>
				</tr>
				
				<jsp:useBean id="today" class="java.util.Date"/>
				<fmt:formatDate value="${today}" pattern="YY.MM.dd" var="todayDate"/>
				
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.noticeId}</td>
						<td colspan="3" class="title-column"><a href="<c:url value='/transfer/inquire/${list.noticeId}'/>"><span>${list.noticeTitle}</span></a></td>
						<td>${list.custId}</td>
						<td><fmt:formatDate value="${list.firstChangeDate}" pattern="YY.MM.dd" var="firstChangeDate"/>
						
						<c:choose>
				            <c:when test="${firstChangeDate == todayDate}">
				                <fmt:formatDate value="${list.firstChangeDate}" pattern="HH:mm"/>
				            </c:when>
				            <c:otherwise>
				                <fmt:formatDate value="${list.firstChangeDate}" pattern="YY.MM.dd"/>
				            </c:otherwise>
				        </c:choose>
						</td>
						
						<td>${list.hit}</td>
						<td>
							<c:choose>
						        <c:when test="${list.assignmentStatus == 'A'}">
						            진행중
						        </c:when>
						        <c:when test="${list.assignmentStatus == 'B'}">
						            종료
						        </c:when>
				        	</c:choose>
						
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
 	
 	
 	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	<script>
		function showLoginAlert() {
		    alert('로그인이 필요합니다.');
		    window.location.href="<c:url value='/member/loginForm'/>"; // 로그인 페이지 URL로 변경하세요
		}
	</script>
</body>
</html>