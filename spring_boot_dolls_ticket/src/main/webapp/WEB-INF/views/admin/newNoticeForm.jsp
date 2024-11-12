<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공지 사항 등록 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/newNotice.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<h3>공지 사항 등록</h3>
			<form id="newNoticeForm" method="POST" action="<c:url value='/admin/insertNotice'/>" enctype="multipart/form-data">
				<table class="listTable">
					<tr>
						<th>공지 제목</th>
						<td><input type="text" name="noticeTitle"></td>
					</tr>
					<tr>
						<th>공지 분류</th>
						<td>
							<select name="noticeType">
								<option value="INFO">공연 정보</option>
								<option value="BOOKING">예매 안내</option>
								<option value="TICKET">티켓 수령 및 발권</option>
								<option value="REFUND">환불 및 취소</option>
								<option value="PROMO">할인 및 프로모션</option>
								<option value="UPDATE">사이트 점검 및 업데이트</option>
								<option value="SAFETY">안전 및 관람 수칙</option>
								<option value="OTHER">기타 공지</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>공지 내용</th>
						<td><textarea name="noticeContent" rows="25" style="width: 850px"></textarea></td>
					</tr>
				</table><br>
				<input type="submit" value="등록 완료">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>