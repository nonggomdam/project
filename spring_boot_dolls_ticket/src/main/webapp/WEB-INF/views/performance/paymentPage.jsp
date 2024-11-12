<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
<script src="jquery-3.7.1.min.js"></script>
<script type="text/javascript"></script>
<style>
@font-face {
 font-family: 'TheJamsil3Regular';
 src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil3Regular.woff2') format('woff2');
 font-weight: 300; /*이미 위에서 3Regular 이렇게 정해져서 font-weight 의미 없음*/
 font-style: normal;
}
@font-face {
   font-family: 'TheJamsil2Light';
   src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil2Light.woff2') format('woff2');
   font-weight: 200; /*이미 위에서 2Light 이렇게 정해져서 font-weight 의미 없음*/
   font-style: normal;
}
.container {
	margin-top: 7%;
	width: 70%;
	display: flex;
	align-items: start;
	margin-bottom:120px;
}

.left-section {
	background-color: #f6f6f6;
	width: 55%;
	padding: 60px;
	border: 1px solid #ddd;
	border-radius: 12px;
	font-family: 'TheJamsil2Light', sans-serif;
}

.right-section {
	width: 40%;
	height: 860px;
	padding: 20px;
	background-color: #353535;
	border: 1px solid #787878;
	margin-left: 120px;
	font-family: 'TheJamsil2Light', sans-serif;
	border-radius: 21px;
}

.section-title {
	font-size: 1.5em;
	margin-bottom: 40px;
	font-weight: bold;
	font-family: 'TheJamsil3Regular', sans-serif;
}

.form-group {
	margin-bottom: 25px;
	margin-top: 30px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	font-size:16px;
}

.form-group input[type="text"], .form-group input[type="email"] {
	width: 97%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-top: 20px;
	font-weight: semibold;
	font-size:13px;
}

.warning {
	background-color: white;
	padding: 15px;
	border: 1px solid #ddd;
	color: red;
	font-size: 0.9em;
	margin-top: 50px;
	text-align: left;
	border-radius: 10px;
}

.warning p {
	margin: 25px;
}

.ticket-info {
	background-color: #353535;
	padding: 14px;
	border-bottom: 2px solid #646464;
	height: 320px;
	margin-bottom: 20px;
	margin-top: 20px;
	color:#eee9e9;
}

.ticket-info img {
	width: 100%;
	max-width: 190px;
	height:280px;
	float: left;
	margin-left: 12px;
	margin-right: 34px;
}

.ticket-details {
	overflow: hidden;
}
.ticket-details h2{
	font-size:30px;
	margin-bottom:22px;
	margin-left : 12px;
}

.ticket-details p {
	margin-top: 10px;
	font-size:18px;
	font-weight: semibold;
	margin-left : 12px;
}

.ticket-details .title {
	font-weight: bold;
}
.title{
	font-size:28px;
}

.summary {
	padding: 10px;
	height: 240px;
	border-bottom: 2px solid #646464;
	margin: 0 auto;
	color:#eee9e9;
}

.summary .price-row {
	margin-top: 30px;
	margin-left: 15px;
	font-size : 19px;
	font-weight: semibold;
}

.summary .total {
	margin-top: 30px;
	font-size: 1.2em;
	font-weight: bold;
}

.buttons {
	text-align: center;
	margin-top: 45px;
	display: flex;         /* Flexbox를 사용하여 가로로 배치 */
    gap: 10px;             /* 버튼 사이에 간격 추가 (선택 사항) */
}

.buttons p{
	margin-left:4px;
	color:red;
}

.buttons button {
	padding: 10px 20px;
	font-size: 1.1em;
	margin: 5px;
	border: none;
	background-color: #000;
	color: white;
	cursor: pointer;
	 border-radius: 8px;
	 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: box-shadow 0.3s, transform 0.3s;
    font-family: 'TheJamsil2Light', sans-serif;
}
.buttons button:hover {
	opacity: 0.9;
}


.buttons form button {
	padding: 10px 20px;
	width:125px;
	heigth:43px;
	font-size: 1.1em;
	margin-top: 20px;
	margin-right: 12px;
	margin-left: 12px;
	border: none;
	background-color: #e74c3c;
	color: white;
	cursor: pointer;
}


hr {
	margin: 50px auto;
}
#ticket-announcement{
	margin-top :42px;
	margin-left:12px;
	font-size:20px;
	color:	#ffa07a;
	font-weight: bold;
}
		.button-shadow {
		width:125px;	
		padding: 10px 20px;
	font-size: 1.1em;
	margin: 5px;
	border: none;
	background-color: #e74c3c;
	color: white;
	cursor: pointer;
	 border-radius: 8px;
	 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: box-shadow 0.3s, transform 0.3s;
    font-family: 'TheJamsil2Light', sans-serif;
		}
		
		.button-shadow:hover {
		    opacity: 0.9;
		}
</style>
</head>
<body>

	<div class="container">
		<!-- 왼쪽 섹션 -->
		<div class="left-section">
			<div class="section-title">주문자 확인</div>
			<hr>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					value="${custInfo.custName}" readonly>
			</div>

			<div class="form-group">
				<label for="phone">연락처</label> <input type="text" id="phone"
					value="${custInfo.custPhoneNumber}" readonly>
			</div>

			<div class="form-group">
				<label for="email">E-mail</label> <input type="email" id="email"
					value="${custInfo.custEmail}" readonly>
			</div>
			<div class="warning">
				<p>주의사항 부정확한 정보 입력으로 인한 문제 발생 시 OOO는 책임을 지지 않습니다.</p>
				<p>배송 선택 시 티켓 수령지와 배송지 정보를 정확히 입력해주시기 바랍니다.</p>
				<p>티켓은 가정적으로 본인에게 직접 전달해야 하며, 분실된 티켓은 재발권되지 않습니다.</p>
				<p>긴급 연락처는 공연 취소와 같은 유사 시 안내 받으실 연락처로 정확히 입력해주시기 바랍니다.</p>

			</div>
		</div>

		<!-- 오른쪽 섹션 -->
		<div class="right-section">
			<div class="ticket-info">
				<img src="<c:url value='/image/${performanceInfo.performanceImagePath}'/>">
				<div class="ticket-details">
					<h2>${performanceInfo.performanceName}</h2>
					<p style="margin-bottom:16px;">이용등급 : ${performanceInfo.performanceRatingCode}세</p>
					<p style="font-weight: bold;"><br>뮤지컬 공연날짜</p>
					<p>
						<fmt:formatDate value="${performanceInfo.performanceDate}"
							pattern="yyyy.MM.dd" />
						~
						<fmt:formatDate value="${performanceInfo.performanceDate2}"
							pattern="yyyy.MM.dd" />
					</p>
					<p style="font-weight: bold; margin-top:24px;"><br>공연 장소<br></p>
					<p>${performanceInfo.performanceAddress}<br>${performanceInfo.performanceDetailAddress}</p>
				</div>
			</div>

			<div class="summary">
				<div class="price-row">
					<span>티켓수량 : </span><span>${performanceSeatInfo.totalSeatCnt}매</span>
				</div>

				<div class="price-row">
					<span>티켓좌석 : </span><span>${performanceSeatInfo.totalSeat}</span>
				</div>

				<div class="price-row total">
					<span>총 결제금액 : </span><span> <fmt:formatNumber type="number"
							maxFractionDigits="3"
							value="${performanceSeatInfo.totalSeatPrice}" />원
					</span>
					<p style="font-size:18px; margin-top:32px;">
						예매 날짜:
						<fmt:formatDate value="${performanceInfo.performanceDate}"
							pattern="yyyy.MM.dd HH:mm" />
					</p>
				</div>
			</div>
			<p id="ticket-announcement">티켓은 방문수령 원칙입니다.</p>
			<div class="buttons">
				<form action="/performance/paymentPage/payment" method="POST"
					onsubmit="return setDataForm()">
					<input type="hidden" name="performanceId" id="performanceId" value="${performanceInfo.performanceId}">
					<input type="hidden" name="performanceDate" id="performanceDate" value="<fmt:formatDate value="${performanceInfo.performanceDate}"
							pattern="yyyy.MM.dd HH:mm" />" >
					<input type="hidden" name="reservationSeatInformation" id="reservationSeatInformation" value="${performanceSeatInfo.totalSeat}" >
					<input type="button" onclick="alert('이전 단계로 이동하시겠습니까?'); history.back()" value="이전단계" class="button-shadow">
					<button type="submit" >결제하기</button>
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	
	<script>
	function setDataForm() {
		if ("${sessionScope.sid}" == "") {
			window.location.href = '/member/loginPage';
			return false;
		}
		
		if(confirm("결제하시겠습니까?")){
			alert("결제되었습니다.");
			return true;
		}

		return false;		
	}
	</script>
</body>
</html>
