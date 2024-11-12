<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 회원 리스트 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/listView.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<div>
				<div class="header">
	                <h3>회원 목록</h3>
            	</div>
				<table class="listTable"">
					<thead>
						<tr>
							<th>ID</th>
							<th>권한</th>
                            <th>전화 번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
						</tr>
					</thead>
					<tbody id="qaItems">
					<c:choose>
				        <c:when test="${empty memberList}">
				            <tr>
				                <td colspan="5">가입한 회원이 없습니다.</td>
				            </tr>
				        </c:when>
				        <c:otherwise>
				            <c:forEach items="${memberList}" var="member" varStatus="status">
				                <tr id="${member.custId}" class="inquiryRow" style="cursor:pointer; display: ${status.index < 5 ? 'table-row' : 'none'};">
				                    <td>${member.custId}</td>
				                    <td>
				                    	<c:choose>
							                <c:when test="${member.administratorYN == 'Y'}">관리자</c:when>
							                <c:when test="${member.administratorYN == 'N'}">일반 회원</c:when>
						            	</c:choose>
				                    </td>
				                    <td>${member.custEmail} </td>
				                    <td>${member.title}</td>
				                    <td>${member.custId}</td>
				                    <td><fmt:formatDate value="${member.regDate}" pattern="yyyy년 MM월 dd일" /></td>
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