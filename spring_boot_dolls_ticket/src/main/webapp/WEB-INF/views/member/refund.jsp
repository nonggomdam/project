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
				$("#refundBtn").click(function() {
					if ($("input[type='checkbox']").is(":checked")) {
						alert("결제 취소가 성공적으로 완료되었습니다. 자세한 내역은 예매 확인/취소 메뉴에서 확인하실 수 있습니다. ");
						$("form").submit();
					}
					else {
						alert("결제 취소를 완료하기 위해 환불 정책에 동의해주십시오.");
						event.preventDefault();
					}
				});
			});
		</script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp"/>
			<div id="container">
				<div>
					<h3>환불 금액 확인</h3>
					<table class="orderInfo">
						<tr>
							<th>상품명</th>
							<td>OO 공연</td>
						</tr>
						<tr>
							<th>예매 번호</th>
							<td>1234-5678</td>
						</tr>
						<tr>
							<th>예매일</th>
							<td>2024년 01월 01일</td>
						</tr>
						<tr>
							<th>결제 수단</th>
							<td>신용 카드</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td>100000원</td>
						</tr>
						<tr>
							<th>환불 예정 금액</th>
							<td>100000원</td>
						</tr>
					</table>
				</div>
				<div>
					<h3>환불 정책</h3>
					<div>
						환불 정책 관련 내용<br>
						환불 정책 관련 내용<br>
						환불 정책 관련 내용<br>
					</div>
				</div>
				<form method="post" action="/myPage">
					<input type="checkbox" value="agree">환불 정책을 확인했고 동의합니다. <br>
					<button type="submit" id="refundBtn">결제 취소</button>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>