<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공지 상세 페이지</title>
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
				<h3>공지 번호 : ${notice.noticeNo}</h3>
				<p>등록일 : <fmt:formatDate value="${notice.firstChangeDate}" pattern="yyyy년 MM월 dd일"/></p>
				<p>마지막 수정일 : <fmt:formatDate value="${notice.lastChangeDate}" pattern="yyyy년 MM월 dd일"/></p>
			</div>
			<div id="content">	
				<div class="detailTableWrap">
					<table class="detailTable">
						<tr>
							<th>공지 제목</th>
							<td>${notice.noticeTitle}</td>
							<th>조회수</th>
							<td>${notice.hitNum}</td>
							<th>공지 종류</th>
							<td>
								<c:choose>
							        <c:when test="${notice.noticeType == 'INFO'}">공연 정보</c:when>
							        <c:when test="${notice.noticeType == 'BOOKING'}">예매 안내</c:when>
							        <c:when test="${notice.noticeType == 'TICKET'}">티켓 수령 및 발권</c:when>
							        <c:when test="${notice.noticeType == 'REFUND'}">환불 및 취소</c:when>
							        <c:when test="${notice.noticeType == 'PROMO'}">할인 및 프로모션</c:when>
							        <c:when test="${notice.noticeType == 'UPDATE'}">사이트 점검 및 업데이트</c:when>
							        <c:when test="${notice.noticeType == 'SAFETY'}">안전 및 관람 수칙</c:when>
							        <c:when test="${notice.noticeType == 'OTHER'}">기타 공지</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th>공지 내용</th>
							<td colspan="5">${notice.noticeContent}</td>
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