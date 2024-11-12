<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 회원 상세 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script>
			function deleteCheck() {
				let answer = confirm("등록된 공지 사항을 삭제하시겠습니까? ");
				
				if (answer) location.href = "/admin/deleteNotice/${notice.noticeNo}";
			}
			function updateNotice() {
				location.href = "/admin/updateNoticeForm/${notice.noticeNo}";
			}
		</script>
	</head>
	<body>
		<div class="detailWrapper">
			<div>
				<h3>회원 ID : ${member.custId}</h3>
				<p>가입일 : <fmt:formatDate value="${member.firstChangeDate}" pattern="yyyy년 MM월 dd일"/></p>
			</div>
			<div id="content">	
				<div class="detailTableWrap">
					<table class="detailTable">
						<tr>
							<th>이름</th>
							<td>${member.custName}</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>${member.custGender}</td>
						</tr>
						<tr>
							<th>권한</th>
							<td>
		                    	<c:choose>
					                <c:when test="${member.administratorYN == 'Y'}">관리자</c:when>
					                <c:when test="${member.administratorYN == 'N'}">일반 회원</c:when>
				            	</c:choose>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan="5">${member.custEmail}</td>
						</tr>
						<tr>
							<th>전화 번호</th>
							<td colspan="5">${member.custPhoneNumber}</td>
						</tr>
						<tr>
							<th>전화 번호</th>
							<td colspan="5">${member.custPhoneNumber}</td>
						</tr>
					</table>
					<button class="updateBtn" onclick="updateNotice();">수정</button>
					<button class="deleteBtn" onclick="deleteCheck();">삭제</button>
				</div>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>