<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이 페이지</title>
<script src="jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/font5.css'/>">
<script type="text/javascript"></script>
<c:import url="/WEB-INF/views/layout/top.jsp" />
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
	border-bottom: 2px solid #333;
}

.event img {
	width: 100%;
	margin-bottom: 15px;
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
	font-weight: bold; /* 버튼 텍스트 굵게 */
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
	font-family: 'TheJamsil2Light', sans-serif;
	font-weight: bold; /* 버튼 텍스트 굵게 */
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
	padding: 15px;
	text-align: left;
}

.order-table th {
	background-color: #f4f4f4;
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
.welcome-box p {
	font-family: 'TheJamsil2Light', sans-serif;
}
.welcome-box h2 {
	font-size: 22px;
	margin-top: 8px;
	margin-bottom: 15px;
}

.myInfo {
	margin-top: 30px;
	margin-bottom: 60px;
	padding: 10px;
	align-items: center; /* 수직 중앙 정렬 */
	border-radius: 8px;
	background-color: #D78E8E;

}
.myInfo p{
	font-family: 'TheJamsil2Light', sans-serif;
}
.service-center {
    margin-left:15px;
	margin-top: 60px;
}
        
.service-center p{
	font-family: 'TheJamsil2Light', sans-serif;
}
.warning {
	background-color: #f9f9f9;
	padding: 15px;
	border: 1px solid #ddd;
	color: red;
	font-size: 0.9em;
	margin-top: 30px;
	text-align: left;
	font-family: 'TheJamsil2Light', sans-serif;
	border-radius: 8px;
	margin-bottom : 30px;
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

.container {
	display: flex;
	margin: 50px;
	width: 90%;
}

.section-title {
	font-size: 18px;
	color: #5A2D82; /* 보라색 제목 */
	text-align: left;
}

.movie-info, .preference-info {
	margin: 0 auto;
	width: 40%;
	height: 80%;
}

.movie-info .stats {
	display: flex;
	justify-content: space-around;
	margin-top: 16px;
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	 text-decoration: none;
}

.preference-info .details {
	margin-top: 16px;
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.details li {
	justify-content: flex-start; /* 요소를 왼쪽으로 붙임 */
	margin-top: 6px;
	font-family: 'TheJamsil2Light', sans-serif;
	font-weight: bold;
}

.stat-item {
	text-align: center;
	font-size: 24px;
	color: #009688; /* 파란색 숫자 */
}

.stat-item a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: #009688; /* 링크 텍스트 색상 */
}

.stat-item label {
	display: block;
	font-size: 14px;
	padding-top: 5px;
	color: #666;
	font-family: 'TheJamsil2Light', sans-serif;
	font-weight: bold;
}

.button {
	padding: 8px 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	cursor: pointer;
	margin-top: 10px;
}

.button:hover {
	background-color: #eee;
}

.settings-button {
	width: 80px;
	height: 25px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	cursor: pointer;
	float: right;
}

.settings-button:hover {
	background-color: #eee;
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
				<p>전화 상담: 1234-1234</p>
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

			<div class="container">
				<!-- 나의 무비스토리 영역 -->
				<div class="movie-info">
					<div class="section-title">나의 무비스토리</div>
					<div class="stats">
						<div class="stat-item">
							<a href="/member/confirmation/0">${totalCnt}<label>관람한 공연</label></a>
						</div>
						<div class="stat-item">
							0 <label>관람평</label>
						</div>
						<div class="stat-item">
							0 <label>위시리스트</label>
						</div>
					</div>
				</div>

				<!-- 선호관람정보 영역 -->
				<div class="preference-info">
					<div class="section-title">
						선호관람정보
						<button class="settings-button">설정</button>
					</div>
					<!-- <button class="settings-button">설정</button> -->
					<div class="details">
						<ul>
							<li>내 선호장르 : 뮤지컬</li>
							<li>내 선호시간 : 20시</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="event">
				<h3>이벤트 현황</h3>
				<img src="<c:url value='/image/banner12.gif'/>">
			</div>
			
			
			<!-- <h3>
				나의 예매내역 <span style="font-size: 12px; font-weight: normal;">한달
					이내의 예매내역이 표시됩니다.</span>
			</h3> -->
			<%-- <table class="order-table">
				<thead>
					<tr>
						<th>상품명</th>
						<th>좌석</th>
						<th>금액</th>
						<th>공연날짜</th>
						<th>진행상태</th>
						<th>구매확정 및 리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="myPageList" items="${myPageReservationList}">
						<tr>
							<td><a
								href="/performance/detailView/${myPageList.performanceId}">${myPageList.performanceName}</a>
							</td>
							<td>
								${myPageList.reservationSeatKindCd}${myPageList.reservationSeatNumber}
							</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${myPageList.performancePrice}" />원</td>
							<td>${myPageList.performanceDate}분</td>
							<td><c:choose>
									<c:when test="${myPageList.reservationStatus == 'Y'}">
										<span>결제완료</span>
									</c:when>
									<c:when test="${myPageList.reservationStatus == 'N'}">
										<span>결제취소</span>
									</c:when>
								</c:choose>
							<td><button>리뷰작성</button><button>구매취소</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<!-- 페이징 네비게이션 -->
			<div class="pagination">
				<c:if test="${currentPage > 1}">
					<a href="?page=${currentPage - 1}">&laquo; 이전</a>
				</c:if>

				<c:forEach var="i" begin="1" end="10">
					<c:choose>
						<c:when test="${i == currentPage}">
							<span class="current-page">${i}</span>
							<!-- 현재 페이지 표시 -->
						</c:when>
						<c:otherwise>
							<a href="?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${currentPage < totalPages}">
					<a href="?page=${currentPage + 1}">다음 &raquo;</a>
				</c:if>
			</div> --%>


			<h3>유의사항</h3>
			<div class="warning">
				<h4>예매 유의사항</h4>
				<p>- 다른 좌석등급이나 다른 상품으로 변경은 불가합니다.</p>
				<p>- 유효기간내에 사용하지 않으면 자동소멸됩니다. 유효기간 연장이나 환불은 불가하오니, 유효기간내에 이용하시기
					바랍니다.</p>
				<p>- 예매권으로 예매시에는, 별도 예매수수료 없이 예매됩니다.</p>
				<p>- 웹에서만 예매가 가능하오니, 유의하시기 바랍니다.</p>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<script type="text/javascript">
		//관람내역 호출
		function _reserVationInfo(){
			
			const url = "/member/myPage";
			
			var data = {
				    	"custId": "${sessionScope.sid}"
			};
			_transeCallService(url, data);
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
		    	
		    })
		    .catch(error => {
		        console.error('Error:', error); // 오류 처리
		    });
		};
	</script>
</body>
</html>

