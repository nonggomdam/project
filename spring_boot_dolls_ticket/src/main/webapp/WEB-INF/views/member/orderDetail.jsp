<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>my page</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.orderCancelBtn').click(function() {
	                window.location.href = '/refund';
	            });
	        });
		</script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp"/>
			<div id="container">
				<div>
					<h3>예매 내역 상세</h3>
					<div>
						<%-- <img src="<c:import value=''/>" alt="poster"/> --%>
					</div>
					<table class="orderInfo">
						<tr>
							<th>예매자</th>
							<td>OOO</td>
						</tr>
						<tr>
							<th>예매 번호</th>
							<td>1234-5678</td>
						</tr>
						<tr>
							<th>상품 이용 일시</th>
							<td>2024년 01월 01일 월요일 00시 00분</td>
						</tr>
						<tr>
							<th>장소</th>
							<td>OO 공연장</td>
						</tr>
						<tr>
							<th>티켓 수령 방법</th>
							<td>현장 발권</td>
						</tr>
					</table>
				</div>
				<div>
					<h3>결제 내역</h3>
					<table class="orderInfo">
						<tr>
							<th>예매일</th>
							<td colspan="2">2024년 01월 01일 월요일 00시 00분</td>
						</tr>
						<tr>
							<th>예매 상태</th>
							<td>결제 완료</td>
							<td><button class="orderCancelBtn">취소</button></td>
						</tr>
						<tr>
							<th>총 결제 금액</th>
							<td colspan="3">1000000원</td>
						</tr>
					</table>
				</div>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>