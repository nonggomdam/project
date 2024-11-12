<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/correctionMember.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/font5.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/navbar.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/js/searchZip.js'/>"></script>
<script src="<c:url value='/js/canclelation.js'/>"></script>
<script src="<c:url value='/js/moveChangepassword.js'/>"></script>

</head>

<body>

	<c:import url="/WEB-INF/views/layout/top.jsp" />
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
			<div class="main-container">
				<h2>기본정보</h2>
				<form id="updateForm" name="updateForm" method="post"
					action="<c:url value='/member/memberUpdate'/>">
					<table>
						<tr>
							<th>아이디</th>
							<td class="input-group"><input type="hidden" id="custId"
								name="custId" value="${myInfo.custId}"> ${myInfo.custId}
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="input-group"><input type="hidden" id="custName"
								name="custName" value="${myInfo.custName}">
								${myInfo.custName}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>**** 년 ** 월 ** 일</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="input-group"><input type="email" id="custEmail"
								name="custEmail" value="${myInfo.custEmail}"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td class="input-group"><input type="text"
								id="custPhonenumber" name="custPhonenumber"
								value="${myInfo.custPhoneNumber}" maxlength="11"
								placeholder="숫자로만 입력하세요"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" id="custZipcode" name="custZipcode"
								value="${myInfo.custZipcode}" size="5" readonly> <input
								type="button" id="searchZipBtn" name="searchZipBtn"
								value="우편번호 찾기"><br></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="custAddress" name="custAddress"
								value="${myInfo.custAddress}" readonly></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" id="custDetailAddress"
								name="custDetailAddress" value="${myInfo.custDetailAddress}"
								placeholder="상세주소를 입력해주세요"></td>
						</tr>
						<tr>
							<th>카카오 로그인</th>
							<td class="toggle">
								<div class="input-switch">
									<input id="inputSwitch" type="checkbox"> <label
										for="inputSwitch" data-on="OFF" data-off="ON"></label>
								</div>
								<div>
									<p>카카오 로그인 사용 여부를 설정할 수 있습니다</p>
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><button type="button" class="change"
									onclick="changePassword()">변경하기</button></td>

						</tr>
					</table>

					<div class="buttons">
						<button type="submit" id="updateMember">회원정보 수정</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>

</body>

<script>
	function changePassword() {
		// 이동할 URL 설정
		var confirmed = confirm("비밀번호를 변경하시겠습니까?");
		if (!confirmed) {
			event.preventDefault(); // '취소'를 눌렀을 때 폼 제출을 방지
		} else {
			window.location.href = "/member/passwordChange"; // 
		}
	}

	// 회원정보 변경 버튼 클릭 시 확인 알림창
	document.getElementById('updateMember').addEventListener('click',
			function(event) {
				// 확인창을 띄움
				var confirmed = confirm("회원정보를 변경하시겠습니까?");

				// '확인' 버튼을 누르면 폼이 제출되고, '취소'를 누르면 제출이 취소됨
				if (!confirmed) {
					event.preventDefault(); // '취소'를 눌렀을 때 폼 제출을 방지
				} else {
					confirm("마이페이지로 이동합니다");
				}
			});
</script>
</html>
