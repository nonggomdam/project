<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 정보 등록 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/newPerformance.js'/>"></script>
		<style>
	        #posterPreview, #infoPreview {
	            width: 300px;
	            height: auto;
	            margin-top: 10px;
	            display: none;
	        }
		</style>
	</head>
	<body>
		<div class="wrapper">
			<h3>공연 정보 등록</h3>
			<form id="newPerformanceForm" method="POST" action="<c:url value='/admin/insertPerformance'/>" enctype="multipart/form-data">
				<table class="listTable">
					<tr>
						<th>공연 이름</th>
						<td><input type="text" name="performanceName"></td>
					</tr>
					<tr>
						<th>공연 포스터</th>
						<td>
							<img id="posterPreview" alt="포스터 미리 보기" style="display:none; max-width: 300px; margin-top: 5px;"><br>
							<input type="file" name="performancePoster" id="performancePoster"><br>
							<button type="button" id="deletePosterBtn" class="deleteImageBtn" style="display:none; margin-top: 10px;">삭제</button>
						</td>
					</tr>
					<tr>
						<th>공연 정보 이미지</th>
						<td>
							<img id="infoPreview" alt="정보 이미지 미리 보기" style="display:none; max-width: 300px; margin-top: 5px;"><br>
							<input type="file" name="performanceInfoImg" id="performanceInfoImg"><br>
							<button type="button" id="deleteInfoBtn" class="deleteImageBtn" style="display:none; margin-top: 10px;">삭제</button>
						</td>
					</tr>
					<tr>
						<th>공연 종류</th>
						<td>
							<select name="performanceKindCd">
								<option value="C">콘서트</option>
								<option value="M">뮤지컬</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>공연 일시1</th>
						<td><input type="datetime-local" name="performanceDate1"/></td>
					</tr>
					<tr>
						<th>공연 일시2</th>
						<td><input type="datetime-local" name="performanceDate2"></td>
					</tr>
					<tr>
						<th>관람 소요 시간</th>
						<td>총 <input type="text" name="performanceTime">분</td>
					</tr>
					<tr>
						<th>R석 가격</th>
						<td><input type="text" name="performancePriceR">원</td>
					</tr>
					<tr>
						<th>S석 가격</th>
						<td><input type="text" name="performancePriceS">원</td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td><input type="text" name="performanceRatingCode">세 이상</td>
					</tr>
<!-- 					<tr>
						<th>공연장</th>
						<td colspan="3">
							<input type="text" id="performanceZipcode" name="performanceZipcode" size="15">
							<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편 번호 찾기"><br>
							<input type="text" id="performanceAddress" name="performanceAddress" placeholder="주소 입력" size="50"><br>
							<input type="text" id="performanceDetailaddress" name="performanceDetailAddress" placeholder="상세 주소 입력" size="50">
						</td>
					</tr> -->
					<tr>
						<th>공연장</th>
						<td>
							<select name="performanceLocationId">
								<c:forEach var="location" items="${locationList}">
									<option value="${location.performanceLocationId}">${location.performanceLocationNm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>티켓 오픈 일자</th>
						<td><input type="datetime-local" name="reservationOpenExpectedDate" id="reservationOpenExpectedDate"></td>
					</tr>
				</table><br>
				<input type="submit" value="등록 완료">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>