<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 1:1 문의 리스트 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/listView.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<div>
				<div class="header">
	                <h3>1:1 문의 목록</h3>
            	</div>
				<table class="listTable"">
					<thead>
						<tr>
							<th>NO</th>
							<th>문의 유형</th>
                            <th>처리 상태</th>
                            <th>제목</th>
                            <th>작성 회원</th>
                            <th>등록일</th>
						</tr>
					</thead>
					<tbody id="qaItems">
					<c:choose>
				        <c:when test="${empty inquiryList}">
				            <tr>
				                <td colspan="6">등록된 문의 사항이 없습니다.</td>
				            </tr>
				        </c:when>
				        <c:otherwise>
				            <c:forEach items="${inquiryList}" var="inquiry" varStatus="status">
				                <tr id="${inquiry.inquiryId}" class="inquiryRow" style="cursor:pointer; display: ${status.index < 5 ? 'table-row' : 'none'};">
				                    <td>${inquiry.inquiryId}</td>
				                    <td>
				                    	<c:choose>
							                <c:when test="${inquiry.category == 'GENERAL'}">일반 문의</c:when>
							                <c:when test="${inquiry.category == 'ACCOUNT'}">계정 관련</c:when>
							                <c:when test="${inquiry.category == 'BILLING'}">결제 및 청구</c:when>
							                <c:when test="${inquiry.category == 'REFUND'}">환불 요청</c:when>
							                <c:when test="${inquiry.category == 'OTHER'}">기타 문의</c:when>
						            	</c:choose>
				                    </td>
				                    <td>${inquiry.status} </td>
				                    <td>${inquiry.title}</td>
				                    <td>${inquiry.custId}</td>
				                    <td><fmt:formatDate value="${inquiry.regDate}" pattern="yyyy년 MM월 dd일" /></td>
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