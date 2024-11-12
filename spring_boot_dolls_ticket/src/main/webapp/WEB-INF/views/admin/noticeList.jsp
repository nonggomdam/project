<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공지 사항 리스트 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/listView.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<div>
				<div class="header">
	                <h3>공지 사항 목록</h3>
	                <button class="newPerformance" onclick="location.href='/admin/newNoticeForm'">공지 사항 등록</button>
            	</div>
				<table class="listTable"">
					<thead>
						<tr>
							<th>NO</th>
							<th>분류</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody id="noticeItems">
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr>
								<td colspan="4">등록된 공지 사항이 없습니다. </td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticeList}" var="notice">
								<tr id="${notice.noticeNo}" class="noticeRow" style="cursor:pointer">
									<td>${notice.noticeNo}</td>
									<td>${notice.noticeTitle}</td>
									<td>
										<c:choose>
								            <c:when test="${notice.noticeType == 'INFO'}">공연 정보</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'BOOKING'}">예매 안내</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'TICKET'}">티켓 수령 및 발권</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'REFUND'}">환불 및 취소</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'PROMO'}">할인 및 프로모션</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'UPDATE'}">사이트 점검 및 업데이트</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'SAFETY'}">안전 및 관람 수칙</c:when>
								        </c:choose>
								        <c:choose>
								            <c:when test="${notice.noticeType == 'OTHER'}">기타 공지</c:when>
								        </c:choose>
									</td>
									<td><fmt:formatDate value="${notice.firstChangeDate}" pattern="YYYY년 MM월 dd일"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>