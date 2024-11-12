<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공지 사항 수정 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/updateNotice.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<h3>${notice.noticeTitle} 수정</h3>
			<p>등록일 : <fmt:formatDate value="${notice.firstChangeDate}" pattern="yyyy-MM-dd"/></p>
			<p>마지막 수정일 : <fmt:formatDate value="${notice.lastChangeDate}" pattern="yyyy-MM-dd"/></p>
			<form id="updateNoticeForm" method="POST" action="<c:url value='/admin/updateNotice'/>" enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
				<table class="listTable">
					<tr>
						<th>NO</th>
						<td>${notice.noticeNo}</td>					</tr>
					<tr>
						<th>공지 제목</th>
						<td><input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"></td>
					</tr>
					<tr>
						<th>공지 분류</th>
						<td>
							<select name="noticeType">
								<option value="INFO" <c:if test="${notice.noticeType == 'INFO'}">selected</c:if>>공연 정보</option>
								<option value="BOOKING" <c:if test="${notice.noticeType == 'BOOKING'}">selected</c:if>>예매 안내</option>
								<option value="TICKET" <c:if test="${notice.noticeType == 'TICKET'}">selected</c:if>>티켓 수령 및 발권</option>
								<option value="REFUND" <c:if test="${notice.noticeType == 'REFUND'}">selected</c:if>>환불 및 취소</option>
								<option value="PROMO" <c:if test="${notice.noticeType == 'PROMO'}">selected</c:if>>할인 및 프로모션</option>
								<option value="UPDATE" <c:if test="${notice.noticeType == 'UPDATE'}">selected</c:if>>사이트 점검 및 업데이트</option>
								<option value="SAFETY" <c:if test="${notice.noticeType == 'SAFETY'}">selected</c:if>>안전 및 관람 수칙</option>
								<option value="OTHER" <c:if test="${notice.noticeType == 'OTHER'}">selected</c:if>>기타 공지</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>공지 내용</th>
						<td>
							<textarea name="noticeContent" rows="25" style="width: 850px">${notice.noticeContent}</textarea>
						</td>
					</tr>
				</table><br>
				<input type="submit" value="수정 완료">
				<input type="reset" value="수정 취소" class="resetBtn">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>