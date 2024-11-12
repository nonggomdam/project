<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/font5.css'/>">
<c:import url="/WEB-INF/views/layout/top.jsp" />
<script src="jquery-3.7.1.min.js"></script>
<script type="text/javascript">	</script>
<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	background-color: #f0f0f0;
}

.main {
	display: flex;
	padding: 20px;
	width: 65%;
	margin-top: 30px;
	margin-bottom: 60px;
}

.event h2 {
	margin-bottom: 20px;
	border-bottom: 2px solid #333;
	padding-bottom: 10px;
}

.event img {
	width: 100%;
	margin-top: 10px;
	margin-bottom: 40px;
}

.sidebar {
	width: 250px;
	background-color: #fff;
	padding: 20px;
	border-right: 1px solid #ddd;
	height: 720px;
	border-radius: 10px;
}

.sidebar h2 {
	margin-top:10px;
	font-size: 20px;
	margin-bottom: 20px;
	color: #333;
}

.sidebar p {
	margin: 10px 0;
	color: #666;
}

.sidebar button {
	display: block;
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	background-color: #e0e0e0;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	color: #333;
	cursor: pointer;
	font-weight: bold; /* 버튼 텍스트 굵게 */
	font-family: 'TheJamsil2Light', sans-serif;
}

.sidebar button:hover {
	background-color: #ccc;
}

.mypage-content {
	flex: 1;
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center;
	padding: 20px 30px;
	background-color: #fff;
	margin-left: 50px;
	border-radius: 10px;
}

.mypage-content h3 {
	font-size: 22px;
	margin-bottom: 20px;
	border-bottom: 2px solid #333;
	padding-bottom: 10px;
}

.order-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 65px;
}

.order-table th, .order-table td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
	font-size: 13px;
}

.order-table tr{
 	height:50px;
}

.order-table img {
	width: 80px;
}

.order-table p {
	margin-left: 10px;
}

.order-table th {
	background-color: #f4f4f4;
}

.order-table a {
	text-decoration: none; /* 링크의 밑줄 제거 */
    color:#28288C; /* 링크 텍스트 색상 */
    font-size: 15px;
}

.order-status {
	display: flex;
	justify-content: space-around;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 5px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
}

.order-status div {
	text-align: center;
	font-size: 14px;
	color: #666;
}

.welcome-box {
	padding: 20px;
	background-color: #C97;
	height: 90px;
	color: #fff;
	border-radius: 8px;
	margin-top: 30px;
	margin-bottom: 65px;
}

.welcome-box h2 {
	font-size: 22px;
	margin-top: 8px;
	margin-bottom: 15px;
}

.myInfo {
	margin-top: 30px;
	margin-bottom: 60px;
	border: 1px solid #ddd;
	padding: 10px;
	align-items: center; /* 수직 중앙 정렬 */
	border-radius: 8px;
	background-color: #D78E8E;
}

.service-center {
    margin-left:15px;
	margin-top: 60px;
}
        

.warning {
	background-color: #f9f9f9;
	padding: 15px;
	border: 1px solid #ddd;
	color: red;
	font-size: 0.9em;
	margin-top: 30px;
	text-align: left;
}

.warning p {
	margin: 25px;
}

.warning h4 {
	margin: 25px;
	color: black;
}

h3 {
	margin-top: 65px;
}

.filter-bar {
	display: flex;
	align-items: center;
	padding: 10px;
	background-color: #f8f9fa;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	margin-bottom: 15px;
}

.filter-bar select, .filter-bar input[type="date"], .filter-bar button {
	padding: 8px 12px;
	margin-right: 10px;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}

.filter-bar button {
	background-color: #333;
	color: white;
	border: none;
}

.filter-bar .date-range {
	display: flex;
	align-items: center;
}

.filter-bar .date-range input[type="date"] {
	margin-right: 5px;
	
}
/* 
.filter-bar .time-periods button {
	padding: 8px 12px;
	margin-right: 5px;
	border: 1px solid #e0e0e0;
	background-color: white;
	cursor: pointer;
	color: black;
} */



.filter-bar .time-periods button {
	padding: 8px 12px;
	margin-right: 5px;
	border: 1px solid #e0e0e0; /* 테두리 지정 */
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
	color: black;
	font-weight: bold; /* 버튼 텍스트 굵게 */
}
.time-periods{
	display: flex;
    justify-content: space-between;
    gap: 10px; /* 버튼 간 간격 */
    width: 390px;
}

.time-periods button {
    flex: 1 1 20%; /* 너비는 18%로 설정 */
    height: 32px; /* 높이를 고정값으로 설정 */
    padding: 10px;
    left:0;
    border: 1px solid #333;
    background-color: #f8f9fa;
    cursor: pointer;
}

.filter-bar .time-periods button {
	border: 1px solid #e0e0e0 !important;
	 font-size: 12px; /* 기본 텍스트 크기 */
}

.interest {
	display: flex;
	flex-wrap: wrap; /* 요소가 줄 바꿈되도록 설정 */
	gap: 10px; /* 이미지 사이에 간격 추가 (선택 사항) */
	margin-top: 40px;
}

.interest img {
	width: calc(25% - 20px); /* 이미지가 5개 들어가도록 너비를 설정, 간격 고려 */
	height: 360px; /* 비율에 맞게 자동으로 높이 조정 */
}
#searchbutton{
	width:9%;
	left:0;
}
#startDate{
	margin-left : 15px;
	margin-right: 15px;
}
#endDate{
	margin-left : 15px;
}
.button-link {
    display: inline-block;
    padding: 10px 20px;
    color: white;
    background-color: #007bff; /* 버튼 배경색 */
    border-radius: 5px; /* 모서리 둥글게 */
    text-decoration: none; /* 밑줄 제거 */
    font-size: 14px;
    text-align: center;
    cursor: pointer;
}

.button-link:hover {
    background-color: #0056b3; /* 호버 시 색상 */
}
.updatebutton {
    background-color: #ff6b6b; /* 버튼 배경색 (밝은 빨간색) */
    color: #ffffff; /* 텍스트 색상 */
    border: none; /* 테두리 제거 */
    padding: 10px 20px; /* 안쪽 여백 */
    font-size: 12px; /* 글자 크기 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 클릭할 수 있는 손가락 커서 */
    transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

.updatebutton:hover {
    background-color: #ff4c4c; /* 호버 시 배경색 (더 짙은 빨간색) */
}

.updatebutton:active {
    background-color: #e04848; /* 클릭 시 배경색 */
    transform: scale(0.98); /* 클릭 시 살짝 축소 */
}

.updatebutton:disabled {
    background-color: #ddd; /* 비활성화 시 배경색 (회색) */
    cursor: not-allowed; /* 비활성화 시 커서 변경 */
    color: #aaa; /* 비활성화 시 텍스트 색상 */
}

#myForm{
		text-align: center;
}

#myForm a{
	margin-right:5px;
	margin-left:5px;
}

#myForm span{
		margin-right:5px;
		margin-left:5px;
		font-weight: bold; /* 버튼 텍스트 굵게 */
}

</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<div class="main">

		<div class="sidebar">
			<div class="myInfo">
				<h2 style="color:#505050; margin-left:10px;">나의 정보</h2>
				<p style="color:white; margin-left:10px;">환영합니다!</p>
				<p style="color:white; margin-left:10px;">${myInfo.custName} 님은 일반 회원입니다.</p>
			</div>
			<div>
				<button
					onclick="location.href='http://localhost:8080/member/correctionMember';">회원정보
					변경</button>
				<button
					onclick="location.href='http://localhost:8080/member/confirmation/0';">예약확인/취소</button>
				<button>공지사항</button>
				<button>1:1문의</button>
			</div>
			<div class="service-center">
				<h2>고객센터</h2>
				<p>전화 상담: 1544-5555</p>
				<p>운영시간: 평일 09:00~18:00</p>
				<p>토요일 09:00~17:00</p>
				<p>일요일 및 공휴일 휴무</p>
			</div>
		</div>



		<div class="mypage-content">
			<div class="welcome-box">
				<h2>안녕하세요! ${myInfo.custName}님</h2>
				<p>현재 등급: WELCOME | 0P</p>
			</div>
			<h3>나의 관람내역</h3>

			<div class="filter-bar">
				<!-- 드롭다운 메뉴 -->

				<!-- 기간 선택 버튼들 -->
				<div class="time-periods">
					<button onclick="setPeriod('day')">당일</button>
					<button onclick="setPeriod('week')">1주</button>
					<button onclick="setPeriod('month')">1개월</button>
					<button onclick="setPeriod('3months')">3개월</button>
					<button onclick="setPeriod('6months')">6개월</button>
				</div>

				<!-- 날짜 범위 선택 -->
				<div class="date-range">
					<input type="date" id="startDate"> <span>~</span> <input
						type="date" id="endDate">
				</div>
				<!-- 조회 버튼 -->
				<form id="searchbutton" action="/member/confirmation/0" method="POST"
					onsubmit="return serachReservationInfo()">
					<input type="hidden" name="startDateStr" id="startDateStr" value="">
					<input type="hidden" name="endDateStr" id="endDateStr" value="">
					<button >조회</button>
				</form>

			</div>
			<table class="order-table">
				<thead>
					<tr>
						<th>상품명</th>
						<th>좌석</th>
						<th>금액</th>
						<th>예매날짜</th>
						<th>공연날짜</th>
						<th>진행상태</th>
						<th>구매확정 및 리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="myPageList" items="${ReservationList}">
						<tr>
							<td><a
								href="/performance/detailViewPerformance/${myPageList.performanceId}">${myPageList.performanceName}</a>
							</td>
							<td>
							<c:choose>
									<c:when test="${myPageList.reservationSeatNumber != 0}">
										${myPageList.reservationSeatKindCd}${myPageList.reservationSeatNumber}
									</c:when>
									<c:when test="${myPageList.reservationSeatNumber == 0}">
										좌석취소
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${myPageList.totalPerformancePrice}" />원</td>
							<td><fmt:formatDate value="${myPageList.firstChangeDate}"
									pattern="yyyy.MM.dd hh:mm" /></td>

							<td><fmt:formatDate value="${myPageList.performanceDate2}"
									pattern="yyyy.MM.dd hh:mm" /></td>
							<td><c:choose>
									<c:when test="${myPageList.reservationStatus == 'Y'}">
										<span>결제완료</span>
									</c:when>
									<c:when test="${myPageList.reservationStatus == 'N'}">
										<span>결제취소</span>
									</c:when>
								</c:choose>
								<c:set var="now" value="${now}" />
								<c:choose>
							    <c:when test="${myPageList.reservationSeatNumber != 0}">
							        <td>
							            <form id="updateForm_${myPageList.reservationId}" method="post" action="<c:url value='/member/updateReservation'/>">
							                <input type="hidden" name="reservationId" value="${myPageList.reservationId}" />
							                <button type="button" class="updatebutton" onclick="confirmCancellation('${myPageList.reservationId}')">예매취소</button>
							            </form>
							        </td>
							    </c:when>

							    <c:otherwise>
							        <td><button type="button" class="updatebutton" onclick="confirmCancellation('${myPageList.reservationId}')" disabled>예매취소</button></td>
							    </c:otherwise>
						 	</c:choose>
			
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이징 네비게이션 -->
			<form id="myForm"  method="POST">
			<input type="hidden" name="startDateStr" id="startDateStr2" value="">
			<input type="hidden" name="endDateStr" id="endDateStr2" value="">
			<div class="pagination">
				<c:if test="${currentPage+1 > 1}">
					<a onclick="pageBefore()" href="#"  >&laquo; 이전</a>
				</c:if>
				<c:forEach var="i" begin="1" end="${totalPages}">
						<c:if test= "${i == currentPage+1}">
							<!-- 현재 페이지 표시 -->
							<span class="current-page">${i}</span>
						</c:if>
						
						<c:if test= "${i != currentPage+1}">
							<a  onclick="pageNumber(${i})" href="#" id="myLink2" >${i}</a>
						</c:if>
				</c:forEach>

				<c:if test="${currentPage+1 < totalPages}">
					<a   onclick="pageNext()" href="#" >다음 &raquo;</a>
				</c:if>
			</div>
			</form>


			<h3>관심목록</h3>
			<div class="interest">
				<img src="<c:url value='/img/musicul1.jpg'/>"> <img
					src="<c:url value='/img/musicul11.jpg'/>"> <img
					src="<c:url value='/img/musicul7.jpg'/>"> <img
					src="<c:url value='/img/consert11.jpg'/>">
			</div>

			<h3>유의사항</h3>
			<div class="warning">
				<h4>취소 유의사항</h4>
				<p>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</p>
				<p>- 예매 취소 시 결제 금액에서 수수료를 제외한 금액만큼 환불 처리 됩니다.</p>
				<p>(부분 취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)</p>
				<p>- 예매 취소 시점과 해당 카드사의 환불 처리 기준에 따라 환급방법과 환급일은 다소 차이가 있을 수 있습니다.</p>
			</div>

		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
<script>

function pageBefore(){
	event.preventDefault(); // 기본 링크 클릭 동작 방지
    // 추가적인 동작이 필요하면 여기에 작성
    serachReservationInfo2();
    
    // 폼의 action 속성 설정
    document.getElementById("myForm").action = '/member/confirmation/' + (parseInt("${currentPage}") - 1).toString();

    document.getElementById("myForm").submit(); // 폼 제출
}
function pageNumber(index){
	event.preventDefault(); // 기본 링크 클릭 동작 방지
    // 추가적인 동작이 필요하면 여기에 작성
    
    serachReservationInfo2();
    
    // 폼의 action 속성 설정
    document.getElementById("myForm").action = '/member/confirmation/' + (parseInt(index) -1).toString();

    document.getElementById("myForm").submit(); // 폼 제출
}
function pageNext(){
	event.preventDefault(); // 기본 링크 클릭 동작 방지
    // 추가적인 동작이 필요하면 여기에 작성
    
    serachReservationInfo2();
    
    // 폼의 action 속성 설정
    document.getElementById("myForm").action = '/member/confirmation/' + (parseInt("${currentPage}")+ 1).toString();

    document.getElementById("myForm").submit(); // 폼 제출
}


/* function deleteCartItem(reservationId) {
    fetch(`/deleteCart?reservationId=` + reservationId, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert("삭제되었습니다.");
            // 삭제 후 화면 갱신 등의 로직
        }
    })
    .catch(error => console.error('삭제 오류:', error));
}
 */
/*  
//관람내역 호출
function _reserVationInfo(event, index){
	event.preventDefault();  // a 태그의 기본 동작 방지 (페이지 이동 방지)
	
	alert(index);
	 
	let data = {
		    	"custId": '${sessionScope.sid}'
		    	,"pageNbr" : 0 + (index-1) * 10  
	};
	_transeCallService("/member/reservationInfo", data);
}

//좌석 비동기통신
function _transeCallService(url, data){
	
	fetch(url, {
	    method: 'POST',
	    headers: {
	        'Content-Type': 'application/json' // JSON 데이터를 보내는 경우
	    },
	    body: JSON.stringify(data)
	})
    .then(response => response.json())
    .then(data => {
    	console.log(data);
    })
    .catch(error => {
        console.error('Error:', error); // 오류 처리
    });
}; */

// 오늘 날짜를 가져오는 함수
function getToday() {
    const today = new Date();
    return today.toISOString().split('T')[0];
}

// 특정 기간 동안의 날짜 범위 설정 함수
function setPeriod(period) {
    const endDate = new Date();
    const startDate = new Date();

    switch (period) {
        case 'day':
            // 당일은 시작일과 종료일이 동일
            break;
        case 'week':
            startDate.setDate(endDate.getDate() - 7);
            break;
        case 'month':
            startDate.setMonth(endDate.getMonth() - 1);
            break;
        case '3months':
            startDate.setMonth(endDate.getMonth() - 3);
            break;
        case '6months':
            startDate.setMonth(endDate.getMonth() - 6);
            break;
    }

    // 날짜 형식을 "YYYY-MM-DD"로 설정
    document.getElementById('startDate').value = startDate.toISOString().split('T')[0];
    document.getElementById('endDate').value = endDate.toISOString().split('T')[0];

    // 버튼 스타일 업데이트
    //document.querySelectorAll('.time-periods button').forEach(button => button.classList.remove('active'));
    //document.querySelector(`button[onclick="setPeriod('${period}')"]`).classList.add('active');
}

function setPeriodMemory() {
	 // 주어진 날짜 문자열
    const startDate = "${startDateStr}";
	
    if(startDate == ""){
    	return false;
    }
    
    // 문자열을 연도, 월, 일로 분해
    const startYear = parseInt(startDate.substring(0, 4));
    const startYmonth = parseInt(startDate.substring(4, 6))-1;// 월은 0부터 시작
    const startYday = parseInt(startDate.substring(6, 8));
	
	
	 // 주어진 날짜 문자열
    const endDate = "${endDateStr}";
    
    // 문자열을 연도, 월, 일로 분해
    const year = parseInt(endDate.substring(0, 4));
    const month = parseInt(endDate.substring(4, 6))-1;// 월은 0부터 시작
    const day = parseInt(endDate.substring(6, 8));
	
    // Date 객체 생성
    const startDateObject = new Date(Date.UTC(startYear, startYmonth, startYday));
 	// Date 객체 생성
    const endDateObject = new Date(Date.UTC(year, month, day));

	// 날짜 형식을 "YYYY-MM-DD"로 설정
    document.getElementById('startDate').value = startDateObject.toISOString().split('T')[0];
    document.getElementById('endDate').value = endDateObject.toISOString().split('T')[0];
	
}

// 페이지 로드 시 기본 1개월로 설정
window.onload = () => {
	setPeriod('month');
	setPeriodMemory();
}


function serachReservationInfo() {
	const now = new Date();
	const year = now.getFullYear(); // 연도
	const month = now.getMonth() + 1; // 월 (0부터 시작하므로 1 더하기)
	const day = now.getDate().toString().length == 1 ? "0" + now.getDate() : now.getDate() ; // 일
	const today = year.toString() + month.toString() + day.toString();
	
    
	// 시작 날짜와 종료 날짜 가져오기
    const startDate = document.getElementById("startDate").value.replaceAll("-", "");;
    const endDate = document.getElementById("endDate").value.replaceAll("-", "");;
    
    if( parseInt(endDate) > parseInt(today) || parseInt(startDate) > parseInt(today) ){
    	alert("예매날짜는 현재일보다 미래일로 지정 불가능 합니다.");	
    	return false;
    }
    
    if( parseInt(startDate) > parseInt(endDate)  ){
    	alert("예매시작일자는 예매종료일자보다 미래일로 지정 불가능 합니다.");	
    	return false;
    }
    
    // 숨겨진 필드에 값 설정
    document.getElementById("startDateStr").value = startDate;
    document.getElementById("endDateStr").value = endDate;    
    
	return true;
	//window.location.href = startDate + "/" + endDate + "/" + 0;
}


function serachReservationInfo2() {
	//현재날짜 구하기
	const now = new Date();
	const year = now.getFullYear(); // 연도
	const month = now.getMonth() + 1; // 월 (0부터 시작하므로 1 더하기)
	const day = now.getDate().toString().length == 1 ? "0" + now.getDate() : now.getDate() ; // 일
	const today = year.toString() + month.toString() + day.toString();
	
    
	// 시작 날짜와 종료 날짜 가져오기
    const startDate = document.getElementById("startDate").value.replaceAll("-", "");;
    const endDate = document.getElementById("endDate").value.replaceAll("-", "");;
    
    if( parseInt(endDate) > parseInt(today) || parseInt(startDate) > parseInt(today) ){
    	alert("예매날짜는 현재일보다 미래일로 지정 불가능 합니다.");	
    	return false;
    }
    
    if( parseInt(startDate) > parseInt(endDate)  ){
    	alert("예매시작일자는 예매종료일자보다 미래일로 지정 불가능 합니다.");	
    	return false;
    }
    
    // 숨겨진 필드에 값 설정
    document.getElementById("startDateStr2").value = startDate;
    document.getElementById("endDateStr2").value = endDate;    
    
	return true;
	//window.location.href = startDate + "/" + endDate + "/" + 0;
};




// 회원정보 변경 버튼 클릭 시 확인 알림창
function confirmCancellation(reservationId) {
    if (confirm("예매를 취소하시겠습니까?")) {
        document.getElementById("updateForm_" + reservationId).submit();
    }
}

</script>
</html>