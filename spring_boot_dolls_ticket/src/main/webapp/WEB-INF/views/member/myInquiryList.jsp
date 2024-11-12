<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1 문의 내역</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/inquiryList.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<div>
				<h3>1:1 문의 내역</h3>
				<span onclick="location.href='<c:url value='/member/newInquiryForm' />'" style="cursor: pointer;">문의 작성하기</span>
			</div>
			<ul>
				<c:choose>
					<c:when test="${empty inquiryList}">
						<li>작성한 문의 내역이 없습니다. </li>
					</c:when>
					<c:otherwise>
						<c:forEach items="${inquiryList}" var="inquiry">
							<li>
								<span class="status">${inquiry.status}</span><br>
								<span id="inquiryTitle"><a href="<c:url value='/member/inquiryDetailView/${inquiry.inquiryId}' />" id="inquiryTitle">${inquiry.title}</a></span><br>
								<span>
						            <c:choose>
						                <c:when test="${inquiry.category == 'GENERAL'}">일반 문의</c:when>
						                <c:when test="${inquiry.category == 'ACCOUNT'}">계정 관련</c:when>
						                <c:when test="${inquiry.category == 'BILLING'}">결제 및 청구</c:when>
						                <c:when test="${inquiry.category == 'REFUND'}">환불 요청</c:when>
						                <c:when test="${inquiry.category == 'OTHER'}">기타 문의</c:when>
						            </c:choose>
						        </span>
								&nbsp;&nbsp;<span><fmt:formatDate value="${inquiry.regDate}" pattern="YYYY년 MM월 dd일"/></span>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>