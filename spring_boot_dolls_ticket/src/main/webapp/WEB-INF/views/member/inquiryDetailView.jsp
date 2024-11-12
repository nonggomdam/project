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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/inquiry.css'/>">
	</head>
	<body>
		<div class="wrapper">
			<h3>문의 내역</h3>
			<table id="inquiry-detail">
			    <tr>
			        <th>제목</th>
			        <td>
				        <span>${inquiry.title}</span>
				        <span id="status">${inquiry.status}</span>
			        </td>
			    </tr>
			    <tr>
			        <th>문의 유형</th>
			        <td>
			            <c:choose>
			                <c:when test="${inquiry.category == 'GENERAL'}">일반 문의</c:when>
			                <c:when test="${inquiry.category == 'ACCOUNT'}">계정 관련</c:when>
			                <c:when test="${inquiry.category == 'BILLING'}">결제 및 청구</c:when>
			                <c:when test="${inquiry.category == 'REFUND'}">환불 요청</c:when>
			                <c:when test="${inquiry.category == 'OTHER'}">기타 문의</c:when>
			            </c:choose>
			        </td>
			    </tr>
			    <tr>
			        <th>작성일</th>
			        <td>
			        	<fmt:formatDate value="${inquiry.regDate}" pattern="YYYY년 MM월 dd일" />
			        </td>
			    </tr>
			    <tr>
			        <th>문의 내용</th>
			        <td>
					    <div style="min-height: 160px;">
					        ${inquiry.content}
					    </div>
					</td>
			    </tr>
			    <c:choose>
			        <c:when test="${not empty inquiry.responseContent}">
			            <tr>
			                <th>답변 내용</th>
			                <td>
			                	<div style="min-height: 80px;">
							        ${inquiry.responseContent}
							    </div>
							</td>
			            </tr>
			            <tr>
			                <th>답변 날짜</th>
			                <td><fmt:formatDate value="${inquiry.responseDate}" pattern="YYYY년 MM월 dd일" /></td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <tr>
			                <th>답변 내용</th>
			                <td>답변 내용이 없습니다.</td>
			            </tr>
			        </c:otherwise>
			    </c:choose>
			</table>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>