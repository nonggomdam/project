<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>빠른 예매</title>
<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketSeatInfo.css'/>">
<script type="text/javascript"></script>
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<%--  <script src="<c:url value='/js/seatReservation.js'/>"></script> --%>

<style>

input {
	width: 250px;
	background-color: red;
	color: white;
	text-align: center;
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="container">
		<!-- 좌석 선택 및 정보 -->
		<div class="seating-container">
			<div class="seats">
				<div><h2>Stage</h2></div>
				<div>


					<div class=seatSelect>
						<div><h3>S좌석</h3></div>
						<c:forEach items="${performanceSSeatInfoList}"
							var="performanceSSeatInfo">
							<c:if test="${performanceSSeatInfo.seatStatus != 'N'}">
								<div class="seat-selection seat-checkDisabled">${performanceSSeatInfo.seatKindCd}${performanceSSeatInfo.seatNumber}</div>
							</c:if>
							<c:if test="${performanceSSeatInfo.seatStatus == 'N'}">
								<div class="seat-selection" >${performanceSSeatInfo.seatKindCd}${performanceSSeatInfo.seatNumber}</div>
							</c:if>
						</c:forEach>
					</div>
					
					<div class=seatSelect>
						<div><h3>R좌석</h3></div>
						<c:forEach items="${performanceRSeatInfoList}"
							var="performanceRSeatInfo">
							<c:if test="${performanceRSeatInfo.seatStatus == 'Y'}">
								<div class="seat-selectionR seat-checkDisabled">${performanceRSeatInfo.seatKindCd}${performanceRSeatInfo.seatNumber}</div>
							</c:if>
							<c:if test="${performanceRSeatInfo.seatStatus == 'N'}">
								<div class="seat-selectionR">${performanceRSeatInfo.seatKindCd}${performanceRSeatInfo.seatNumber}</div>
							</c:if>
						</c:forEach>
					</div>
					
				</div>
				<!-- 다른 행 추가 가능 -->
			</div>


			<div class="seat-info">
				<img src="<c:url value='/image/${performanceInfo.performanceImagePath}'/>">
				<div class="movie-title">${performanceInfo.performanceName}</div>
				
				<c:set var="dateString" value="${performanceDate}" />
				<fmt:parseDate var="parsedDate" value="${dateString}" pattern="yyyyMMddHHmm" />
				<div class="movie-time">공연일: <fmt:formatDate value="${parsedDate}"
							pattern="yyyy.MM.dd HH:mm" /></div>
				<div class="selected-seats">
					선택한 좌석: <span id="selectedSeats"></span>
				</div>
				<div class="total-price">
					총 결제 금액: <span id="totalAmt"></span>원				
				</div>				
				<div>
				<c:if test="${performanceInfo.performanceLocationId == 'SE0000001'}">
					<p>공연장 정보 : 올림픽홀</p>
				</c:if>
				<c:if test="${performanceInfo.performanceLocationId == 'SE0000002'}">
					<p>공연장 정보 : 샤롯데홀</p>
				</c:if>
				</div>
					<div style="display: inline-block; width: 20px; height: 20px; background-color: #5F9EA0; margin-top: 20px; margin-right: 8px;"></div>
					<div style="display: inline-block; line-height: 50px;">S석  <fmt:formatNumber type="number"	maxFractionDigits="3"
																			value="${performanceInfo.performancePrice+30000}" />원</div>
				<div>
				
				    <div style="display: inline-block; width: 20px; height: 20px; background-color: #834683; margin-right: 8px;"></div>
				    <div style="display: inline-block; margin-bottom: 8px;">R석 <fmt:formatNumber type="number"	maxFractionDigits="3"
																			value="${performanceInfo.performancePrice}" />원</div>
				</div>
				
				<form class="Performance-payment"action="/performance/paymentPage" method="POST"
					onsubmit="return setDataForm()">
					<input type="hidden" name="performanceId" id="performanceId">
					<input type="hidden" name="performanceDate" id="performanceDate">
					<input type="hidden" name="totalSeatInfo" id="totalSeatInfo">
					<input type="button" onclick="alert('이전 단계로 이동하시겠습니까?'); history.back()" value="이전단계" class="button-shadow">
					<input type="submit" value="결제하기" class="button-shadow">
				</form>

				<div class="people">
	
					<button id="resetSeats">좌석초기화</button>
				</div>

			</div>



		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<script>
		var selectedSeats = [];
		var totalAmt = 0;
		//var performanceRSeatInfoList = '${performanceRSeatInfoList}';

		// 좌석 선택
		$('.seat-selection').click(
				function() {
					if (!$(this).hasClass('seat-disabled')
							&& !$(this).hasClass('seat-checkDisabled')) {
						var seatNumber = $(this).text();

						if ($(this).hasClass('seat-selected')) {
							//금액 해지
							<c:forEach items="${performanceRSeatInfoList}" var="item">
							if (seatNumber == '${item.seatKindCd}'
									+ '${item.seatNumber}') {
								totalAmt -= parseInt('${item.seatPrice}');
							}
							</c:forEach>
							//금액 해지
							<c:forEach items="${performanceSSeatInfoList}" var="item">
							if (seatNumber == '${item.seatKindCd}'
									+ '${item.seatNumber}') {
								totalAmt -= parseInt('${item.seatPrice}');
							}
							</c:forEach>


							// 좌석 선택 해제
							$(this).removeClass('seat-selected');
							selectedSeats = selectedSeats.filter(function(seat) {
										return seat !== seatNumber;
									});
						} else {
							// 좌석 선택
							$(this).addClass('seat-selected');
							selectedSeats.push(seatNumber);

							if (seatNumber.substr(0, 1) == "R") {
								//금액 선택
								<c:forEach items="${performanceRSeatInfoList}" var="item">
								if (seatNumber == '${item.seatKindCd}'
										+ '${item.seatNumber}') {
									totalAmt += parseInt('${item.seatPrice}');
								}
								</c:forEach>
							} else {
								//금액 선택
								<c:forEach items="${performanceSSeatInfoList}" var="item">
								if (seatNumber == '${item.seatKindCd}'
										+ '${item.seatNumber}') {
									totalAmt += parseInt('${item.seatPrice}');
								}
								</c:forEach>
							}
						}

						// 선택한 좌석 업데이트
						$('#selectedSeats').text(selectedSeats.join(', '));
						// 선택한 좌석 업데이트

						const tempTotalAmt = totalAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$('#totalAmt').text(tempTotalAmt);
					}
				});
		
		// 좌석 선택
		$('.seat-selectionR').click(
				function() {
					if (!$(this).hasClass('seat-disabled')
							&& !$(this).hasClass('seat-checkDisabled')) {
						var seatNumber = $(this).text();

						if ($(this).hasClass('seat-selected')) {
							//금액 해지
							<c:forEach items="${performanceRSeatInfoList}" var="item">
							if (seatNumber == '${item.seatKindCd}'
									+ '${item.seatNumber}') {
								totalAmt -= parseInt('${item.seatPrice}');
							}
							</c:forEach>
							//금액 해지
							<c:forEach items="${performanceSSeatInfoList}" var="item">
							if (seatNumber == '${item.seatKindCd}'
									+ '${item.seatNumber}') {
								totalAmt -= parseInt('${item.seatPrice}');
							}
							</c:forEach>


							// 좌석 선택 해제
							$(this).removeClass('seat-selected');
							selectedSeats = selectedSeats.filter(function(seat) {
										return seat !== seatNumber;
									});
						} else {
							// 좌석 선택
							$(this).addClass('seat-selected');
							selectedSeats.push(seatNumber);

							if (seatNumber.substr(0, 1) == "R") {
								//금액 선택
								<c:forEach items="${performanceRSeatInfoList}" var="item">
								if (seatNumber == '${item.seatKindCd}'
										+ '${item.seatNumber}') {
									totalAmt += parseInt('${item.seatPrice}');
								}
								</c:forEach>
							} else {
								//금액 선택
								<c:forEach items="${performanceSSeatInfoList}" var="item">
								if (seatNumber == '${item.seatKindCd}'
										+ '${item.seatNumber}') {
									totalAmt += parseInt('${item.seatPrice}');
								}
								</c:forEach>
							}
						}

						// 선택한 좌석 업데이트
						$('#selectedSeats').text(selectedSeats.join(', '));
						// 선택한 좌석 업데이트

						const tempTotalAmt = totalAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$('#totalAmt').text(tempTotalAmt);
					}
				});

		// 초기화 버튼
		$('#resetSeats').click(function() {
			$('.seat-selection').removeClass('seat-selected');
			selectedSeats = [];
			totalAmt = 0;
			$('#selectedSeats').text('');
			$('#totalAmt').text('');
		});

		function setDataForm() {

			if ("${sessionScope.sid}" == "") {
				window.location.href = '/member/loginPage';
				return false;
			}
			if (selectedSeats.length == 0) {
				alert("좌석을 선택하세요.");
				return false;
			}

			$('#performanceId').val("${performanceId}");
			$('#performanceDate').val("${performanceDate}");
			$('#totalSeatInfo').val(selectedSeats.join(', '));

			return true; // 폼 제출 허용
		}
	</script>
</body>
</html>

