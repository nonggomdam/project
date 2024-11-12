<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 1:1 문의 답변 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
	</head>
	<body>
		<div class="wrapper">
			<h3>문의 내역</h3>
			<div class="inquiry-detail">
				<div class="inquiry-item">
			        <span class="value">${inquiry.status}</span>
			    </div>
			    <div class="inquiry-item">
			        <span class="value">${inquiry.title}</span>
			    </div>
			    <div class="inquiry-item">
			    	<span class="value">
			    		<c:choose>
			                <c:when test="${inquiry.category == 'GENERAL'}">일반 문의</c:when>
			                <c:when test="${inquiry.category == 'ACCOUNT'}">계정 관련</c:when>
			                <c:when test="${inquiry.category == 'BILLING'}">결제 및 청구</c:when>
			                <c:when test="${inquiry.category == 'REFUND'}">환불 요청</c:when>
			                <c:when test="${inquiry.category == 'OTHER'}">기타 문의</c:when>
			            </c:choose>
			    	</span>&nbsp;&nbsp;
			        <span class="value"><fmt:formatDate value="${inquiry.regDate}" pattern="YYYY년 MM월 dd일" /></span>
			    </div>
			    <div class="inquiry-item">
			    	<span class="value">${inquiry.content}</span>&nbsp;&nbsp;
			    </div>
			    <c:if test="${not empty inquiry.responseContent}">
			        <div class="inquiry-item">
			            <p class="value">${inquiry.responseContent}</p>
			        </div>
			        <div class="inquiry-item">
			            <span class="label">답변 날짜</span>
			            <span class="value"><fmt:formatDate value="${inquiry.responseDate}" pattern="YYYY년 MM월 dd일" /></span>
			        </div>
			    </c:if>
				<c:if test="${empty inquiry.responseContent}">
		            <div class="inquiry-item">
		                <span>답변 작성</span>
		                <form method="post" action="<c:url value='/admin/updateResponse'/>">
		                    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
<%-- 		                    <input type="hidden" name="custId" value="${inquiry.custId}">
		                    <input type="hidden" name="title" value="${inquiry.title}">
		                    <input type="hidden" name="content" value="${inquiry.content}">
		                    <input type="hidden" name="regDate" value="${inquiry.regDate}">
		                    <input type="hidden" name="category" value="${inquiry.category}"> --%>
		                    <textarea name="responseContent" rows="4" cols="50"></textarea><br>
		                    <button type="submit">답변 등록</button>
		                </form>
		            </div>
		        </c:if>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>