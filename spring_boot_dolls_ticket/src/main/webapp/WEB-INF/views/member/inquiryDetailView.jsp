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
				        <span class="value">답변 내용이 없습니다.</span>
				    </div>
				</c:if>
				<c:if test="${isAdmin && empty inquiry.responseContent}">
		            <div class="inquiry-item">
		                <h3>답변 작성</h3>
		                <form action="/admin/insertInquiryAnswer" method="post">
		                    <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
		                    <textarea name="answerContent" rows="4" cols="50"></textarea>
		                    <button type="submit">답변 제출</button>
		                </form>
		            </div>
		        </c:if>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>