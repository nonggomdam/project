<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FiveDolls 티켓예매</title>
<c:import url="/WEB-INF/views/layout/top.jsp"/>
<c:import url="/WEB-INF/views/layout/head.jsp"/>
<script src="jquery-3.7.1.min.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/datechoice.css'/>">
</head>
<body>
	<div class="step-header"><h2>관람일/회차선택</h2></div>
	<div class="performanceDateInfo">
		<div class="left-panel">
			<h3>공연일자 선택</h3>
			<p>지난공연은 선택이 불가합니다</p>
			<div class="calendar-time-container">
				<!-- 새로운 컨테이너 추가 -->
				<div class="calendar">
					<div class="calendar-entire">
						<div class="calendar-header">
						
							 <select id="year"
								onchange="renderCalendar()"></select><label for="year">  년</label>
							<select id="month" onchange="renderCalendar()">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select><label for="month">   월</label>
						</div>

						<div class="calendar-body">

							<table id="calendar-day">
								<thead>
									<tr>
										<th>일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="poster">
			<h3 >회차 선택</h3>
			<div id = "round" >
			</div>
		</div>

		<div class="poster">
			<h3>잔여석</h3>
			<div id = "remainingSeat" >
			</div>
		</div>

		<div class="right-panel">

			<div class="my-info">
				<h3>My예매정보</h3>
				<img src="<c:url value='/image/${performanceInfo.performanceImagePath}'/>">
				<p id="id">${performanceInfo.performanceName}</p>
				<p>관람 등급 : ${performanceInfo.performanceRatingCode}세</p>
				<p>공연 날짜 :
					<fmt:formatDate value="${performanceInfo.performanceDate1}"
						pattern="yyyy.MM.dd" />
					~
					<fmt:formatDate value="${performanceInfo.performanceDate2}"
						pattern="yyyy.MM.dd" />
				</p>
				<p id = "reservationDate">일시 : 선택된 날짜 및 시간</p>
				
			</div>
			<div class="total-section">
				<div class="next">
						<button type="button" onclick="alert('이전 단계로 이동하시겠습니까?'); history.back()" value="이전단계" >이전단계</button>
						<button type="button" onclick="_changePage()" id="nextbutton">다음단계</button>
				</div>
			</div>
		</div>
	</div>
	<div class="notice">
	    <h4>유의사항</h4>
	    <ul>
	        <li>유효기간내에 사용하지 않으면 자동소멸됩니다. 유효기간 연장이나 환불은 불가하오니, 유효기간내에 이용하시기 바랍니다.</li>
	        <li>지각 시 입장이 제한될 수 있습니다.</li>
	        <li>입장 시 신분증을 확인할 수 있습니다.</li>
	        <li>웹에서만 예매가 가능하오니, 유의하시기 바랍니다.</li>
	        <li>당일관람 상품예매시에는 취소불가합니다.</li>
	    </ul>
	</div>
			
	<script>
		var curruntCheckDate = "" ;
	
		const yearSelect = document.getElementById('year');
		const monthSelect = document.getElementById('month');
		const currentYear = new Date().getFullYear();
		
		//100년치 달력넣기
		for (let i = currentYear - 1; i <= currentYear + 1; i++) {
			const option = document.createElement('option');
			option.value = i;
			option.text = i;
			yearSelect.appendChild(option);
		}

		yearSelect.value = currentYear;
		monthSelect.value = new Date().getMonth()+1;

		// Render calendar based on selected year and month
		function renderCalendar() {
			const year = yearSelect.value;
			const month = monthSelect.value;
			const firstDay = new Date(year, month-1, 1).getDay();
			const daysInMonth = new Date(year, month, 0).getDate();
			const calendarBody = document.querySelector('#calendar-day tbody');
			calendarBody.innerHTML = ''; // Clear previous calendar

			let date = 1;
			for (let i = 0; i < 6; i++) { // Create 6 rows (weeks)
				const row = document.createElement('tr');

				for (let j = 0; j < 7; j++) { // Create 7 columns (days)
					const cell = document.createElement('td');
					if (i === 0 && j < firstDay) {
						cell.innerHTML = ''; // Empty cell before the 1st day
					} else if (date > daysInMonth) {
						break; // Stop when all days are filled
					} else {
						cell.innerHTML = date;
						
						//공연있는날짜 빨간표시
						const makeDate = year + _makeZero(month) + _makeZero(cell.innerText);
						if(_checkPerformanceToCalendal(makeDate)){
							cell.style.backgroundColor = 'peachpuff';	
						}else{
							cell.style.backgroundColor = 'white';	
						}
						cell.addEventListener(
										'click',
										function() {
											//회차선택 화면 초기화
											document.getElementById('round').replaceChildren();
											//잔여석 화면 초기화
											document.getElementById('remainingSeat').replaceChildren();
											
											//회차선택 전역변수 초기화 (다음단계 누를때 현재 체크된 시간 넘어감)
											curruntCheckDate = ""
											
											// 캘린더 자식요소 다가져오기
											const children = document.querySelector('#calendar-day tbody').querySelectorAll('*');
											// 모든 자식 요소의 스타일을 초기화
										 	children.forEach(function(child) {
												if(child.style.cssText == "background-color: salmon;" ){
													child.style.backgroundColor = 'peachpuff'; // 인라인 스타일을 초기화
												}
											    child.removeAttribute('class'); // 클래스 제거
											}); 
											
											//공연날짜 외에 다른거 클릭시 return;
											if(!_checkPerformanceToCalendal(makeDate)){
											 	alert("해당 날짜에는 공연이 없습니다.");		
											 	return;
											}
											cell.style.backgroundColor = 'salmon';	
											
											//현재 캘린더 클릭 연도및날짜
											const makeDate2 = year + _makeZero(month) + _makeZero(cell.innerText);
											
											//회차선택 동적셋팅
											_changeCalendalDate(makeDate);
										});
						date++;
					}
					row.appendChild(cell);
				}
				calendarBody.appendChild(row);
			}
		}

		// Initial calendar render
		renderCalendar();
		
		function _makeZero(str){
			if(str.length == 1){
				str = "0" + str.toString();
			}
			return str;
		}
		
		//공연날짜 있으면 true
		function _checkPerformanceToCalendal(makeDate){
			<c:forEach items="${performanceDateList}" var="item">
			//공연있는날짜 판단
				if(  makeDate == "${item}".substr(0, 8)){
					return true;	
				}
			</c:forEach>
			return false;
		};
		
		//회차 동적컨트롤
		function _changeCalendalDate(makeDate){
			
			<c:forEach items="${performanceDateList}" var="item">
				//클릭한 날짜와 공연날짜가 일치하면 일시넣기
				if(  makeDate == "${item}".substr(0, 8)){
					//회차 p태그로 넣기
					const p = document.createElement("p");
					const p1 = document.createElement("p1");
					const p2 = document.createElement("p2");
					const p3 = document.createElement("p3");
					p.innerText =  "${item}".substr(8);
					p1.innerText =  "${item}".substr(0, 4);
					p2.innerText =  "${item}".substr(4, 2);
					p3.innerText =  "${item}".substr(6, 2);
					//리스너 넣기
					p.addEventListener(
								'click',
								function() {
									
									// 캘린더 자식요소 다가져오기
									const children = document.querySelector('#round').querySelectorAll('*');
									// 모든 자식 요소의 스타일을 초기화
									children.forEach(function(child) {
									    child.style.cssText = ''; // 인라인 스타일을 초기화
									    child.removeAttribute('class'); // 클래스 제거
									});
									
									//클릭날짜 노란색표시
									p.style.backgroundColor = 'lightgray';
									
									document.getElementById('reservationDate').innerText = 
										"선택일시 : "+ /* makeDate */p1.innerText + "-" + p2.innerText+"-"+p3.innerText + "\n\n공연시간 : " + p.innerText;
									
									//좌석수 가져오기
									_getSeatInfo(makeDate+p.innerText);
								}); 
					document.querySelector("#round").appendChild(p);
				}
			</c:forEach>
		};
		
		//좌석 비동기통신
		function _getSeatInfo(ticketDate){
	 		
			curruntCheckDate = ticketDate.replace(":","");
			
			fetch('/performance/dateReservation/seatInfo', {
			    method: 'POST',
			    headers: {
			        'Content-Type': 'application/json' // JSON 데이터를 보내는 경우
			    },
			    body: JSON.stringify({
			    	"performanceId": '${performanceId}'
			    	,"performanceDate": ticketDate
			    })
			})
		    .then(response => response.json())
		    .then(data => {
		    	
		    	//잔여석 초기화
				document.getElementById('remainingSeat').replaceChildren();
		        
		    	//잔여석 생성
		    	_makeRemainingSeat(data, "R");
		    	//잔여석 생성
		    	_makeRemainingSeat(data, "S");
		        
		    })
		    .catch(error => {
		        console.error('Error:', error); // 오류 처리
		    });
		};
		
		//잔여석만들기
		function _makeRemainingSeat(data, seatKndCd){
			
			//태그 넣기
			const p = document.createElement("p");
	        var cnt = 0;
			data.forEach(function(data) {
				if(  seatKndCd == data.seatKindCd &&  data.seatStatus == 'N'){
					cnt++;					
				}
			});
			
			p.innerText = seatKndCd +"구역 " + cnt + "석";
			document.querySelector("#remainingSeat").appendChild(p);
		}
		
		//화면이동
		function _changePage(){
			if( "${sessionScope.sid }" == ""){
				window.location.href='/member/loginPage';	
			}
			
			if( curruntCheckDate == ""){
				alert("관람일과 회차 선택 바랍니다.");
				return false;
			}
			
			const now = new Date();
			const year = now.getFullYear();
			const month = now.getMonth() + 1; // 월은 0부터 시작하므로 +1 필요
			const day = now.getDate();
			const hours = now.getHours();
			const minutes = now.getMinutes();
			const seconds = now.getSeconds();
			
			const tempTime = _makeZero(year.toString()) 
								+ _makeZero(month.toString())
								+ _makeZero(day.toString()) 
								+ _makeZero(hours.toString()) 
								+ _makeZero(minutes.toString()) 
			console.log(tempTime ); 

			if(  curruntCheckDate < tempTime ){
				alert("관람시간이 지나 예매 불가능 합니다.");
				return false;
			}			
			
			
		    if (confirm("좌석 예약 페이지로 이동하시겠습니까?")) {  // userConfirmed가 true일 경우에만 창을 엽니다
		        window.location.href = "/performance/seatReservation/${performanceId}/" +curruntCheckDate;
		    }
		}


	</script>

	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>

</html>
