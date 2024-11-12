<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 정보 수정 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/updatePerformance.js'/>"></script>
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
			<h3>${performance.performanceName} 정보 수정</h3>
			<p>등록일 : <fmt:formatDate value="${performance.firstChangeDate}" pattern="yyyy-MM-dd"/></p>
			<p>마지막 수정일 : <fmt:formatDate value="${performance.lastChangeDate}" pattern="yyyy-MM-dd"/></p>
			<form id="updatePerformanceForm" method="POST" action="<c:url value='/admin/updatePerformance'/>" enctype="multipart/form-data">
				<input type="hidden" name="performanceId" value="${performance.performanceId}">
				<input type="hidden" name="performanceImagePath" value="${performance.performanceImagePath}">
				<input type="hidden" name="performanceInformationImagePath" value="${performance.performanceInformationImagePath}">
				<table class="listTable">
					<tr>
						<th>공연 ID</th>
						<td>${performance.performanceId}</td>
					</tr>
					<tr>
						<th>공연 이름</th>
						<td><input type="text" name="performanceName" id="performanceName" value="${performance.performanceName}"></td>
					</tr>
					<tr>
	                    <th>공연 포스터</th>
	                    <td>
	                        <img id="posterPreview" src="<c:url value='/image/${performance.performanceImagePath}'/>" 
	                             alt="포스터 미리 보기" style="max-width: 300px; display: block; margin-top: 5px;">
	                        <input type="file" name="performancePoster" id="performancePoster" style="margin-top: 5px;"><br>
	                        <button type="button" id="deletePosterBtn" class="deleteImageBtn" style="margin-top: 10px;">삭제</button>
	                    </td>
	                </tr>
	                <tr>
	                    <th>공연 정보 이미지</th>
	                    <td>
	                        <img id="infoPreview" src="<c:url value='/image/${performance.performanceInformationImagePath}'/>" 
	                             alt="정보 이미지 미리 보기" style="max-width: 300px; display: block; margin-top: 5px;">
	                        <input type="file" name="performanceInfoImg" id="performanceInfoImg" style="margin-top: 5px;"><br>
	                        <button type="button" id="deleteInfoBtn" class="deleteImageBtn" style="margin-top: 5px;">삭제</button>
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
					    <td>
					        <input type="datetime-local" name="performanceDate1" id="performanceDate1" value="<fmt:formatDate value='${performance.performanceDate1}' pattern='yyyy-MM-dd\'T\'HH:mm'/>">
						</td>
					</tr>
					<tr>
					    <th>공연 일시2</th>
					    <td>
					        <input type="datetime-local" name="performanceDate2" id="performanceDate2" value="<fmt:formatDate value='${performance.performanceDate2}' pattern='yyyy-MM-dd\'T\'HH:mm'/>">
					    </td>
					</tr>
					<tr>
						<th>관람 소요 시간</th>
						<td>총 <input type="text" name="performanceTime" value="${performance.performanceTime}">분</td>
					</tr>
					<tr>
						<th>R석 가격</th>
						<td><input type="text" name="performancePriceR" id="performancePriceR" value="${performance.performancePriceR}">원</td>
					</tr>
					<tr>
						<th>S석 가격</th>
						<td><input type="text" name="performancePriceS" id="performancePriceS" value="${performance.performancePriceS}">원</td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td><input type="text" name="performanceRatingCode" id="performanceRatingCode" value="${performance.performanceRatingCode}">세 이상</td>
					</tr>
					<%-- <tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" id="performanceZipcode" name="performanceZipcode" size="5" value="${performance.performanceZipcode}" readonly>
							<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편 번호 찾기"><br>
							<input type="text" id="performanceAddress" name="performanceAddress" placeholder="주소 입력" size="70" value="${performance.performanceAddress}" readonly><br>
							<input type="text" id="performanceDetailAddress" name="performanceDetailAddress" placeholder="상세 주소 입력" size="70" value="${performance.performanceDetailAddress}">
						</td>
					</tr> --%>
					<tr>
						<th>공연장</th>
						<td>
							<select name="performanceLocationId">
								<c:forEach var="location" items="${locationList}">
									<option value="${location.performanceLocationId}"
					                    <c:if test="${location.performanceLocationId == performance.performanceLocationId}">selected</c:if>
					                >
					                    ${location.performanceLocationNm}
					                </option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>티켓 오픈 일자</th>
						<td>
					        <input type="datetime-local" name="reservationOpenExpectedDate" id="reservationOpenExpectedDate" value="<fmt:formatDate value='${performance.reservationOpenExpectedDate}' pattern='yyyy-MM-dd\'T\'HH:mm'/>"/>
						</td>
					</tr>
				</table><br>
				<input type="submit" value="수정 완료">
				<input type="reset" value="수정 취소" class="resetBtn">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>