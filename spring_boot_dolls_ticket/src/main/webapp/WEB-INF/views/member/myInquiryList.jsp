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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/inquiry.css'/>">
	</head>
	<body>
		<div class="wrapper">
			<div class="header">
				<h3>1:1 문의 내역</h3>
				<span id="fillout" onclick="location.href='<c:url value='/member/newInquiryForm' />'" style="cursor: pointer;">문의 작성하기</span>
			</div>
			<div id="box">
				<table>
				    <tr id="firstrow">
				        <th>번호</th>
				        <th>상태</th>
				        <th>제목</th>
				        <th>카테고리</th>
				        <th>작성일</th>
				    </tr>
				    <c:choose>
				        <c:when test="${empty inquiryList}">
				            <tr>
				                <td colspan="5">작성한 문의 내역이 없습니다.</td>
				            </tr>
				        </c:when>
				        <c:otherwise>
				            <c:forEach items="${inquiryList}" var="inquiry" varStatus="status">
				                <tr>
				                    <td>${status.index + 1}</td>
				                    <td class="status">${inquiry.status}</td>
				                    <td class="title-column">
				                        <a href="<c:url value='/member/inquiryDetailView/${inquiry.inquiryId}' />">${inquiry.title}</a>
				                    </td>
				                    <td>
				                        <c:choose>
				                            <c:when test="${inquiry.category == 'GENERAL'}">일반 문의</c:when>
				                            <c:when test="${inquiry.category == 'ACCOUNT'}">계정 관련</c:when>
				                            <c:when test="${inquiry.category == 'BILLING'}">결제 및 청구</c:when>
				                            <c:when test="${inquiry.category == 'REFUND'}">환불 요청</c:when>
				                            <c:when test="${inquiry.category == 'OTHER'}">기타 문의</c:when>
				                        </c:choose>
				                    </td>
				                    <td><fmt:formatDate value="${inquiry.regDate}" pattern="YYYY년 MM월 dd일"/></td>
				                </tr>
				            </c:forEach>
				        </c:otherwise>
				    </c:choose>
				</table>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>