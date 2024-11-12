<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true"%>
<%
// 세션에서 "username"이라는 값을 가져옴
String userId = (String) session.getAttribute("sid");
if (userId == null) {
	userId = ""; // 세션에 값이 없으면 빈 문자열로 설정
}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>detail Page</title>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/performanceDetail.css'/>">	
<script>
$(document).ready(function() {
    $('#ticketOpenBtn').on('click', function() {
    	var userId = "<%=userId%>";
        var userConfirmed = confirm("좌석예약 페이지로 이동하시겠습니까?");
        
        if (userConfirmed && userId != "") {
            // 사용자가 "예"를 눌렀을 때 페이지 이동
            window.location.href = '/performance/dateReservation/${pfm.performanceId}'; // 원하는 URL로 변경
        }else if(userId == ""){
        	confirm("로그인 화면으로 이동합니다.")
        	location.href = '/member/loginForm';
        }
    });
});
$(document).ready(function() {
    $('#layer_popup').on('click', function() {
    	var userId = "<%=userId%>";
		if(userId == ""){
        	confirm("로그인이 필요합니다.")
        	location.href = '/member/loginForm';
        }
    });
});
</script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8b9536e6724dcad202e98a2dcdaee950"></script>
<script src="<c:url value='/js/ticketOpen.js'/>"></script>
<script src="<c:url value='/js/review.js'/>"></script>	
	</head>
<body>
	<div class="detailPage-wrap">
		<div class="detailPage-content">
			<div class="dt-01">
				<!--로케이션-->
				<p class="dt-location">
					<c:if test="${pfm.performanceKindCd eq 'C'}">
						<a>콘서트 ></a>
					</c:if>
					<c:if test="${pfm.performanceKindCd eq 'M'}">
						<a>뮤지컬 ></a>
					</c:if>
				</p>
			</div>
		</div>
		<div class="dt-02">
			<!--제목-->
			<input type="hidden" id="performanceId" value="${pfm.performanceId}">
			<p class="dt-title">${pfm.performanceName}</p>
		</div>
	</div>
	<div class="concert-wrap"></div>
	<div class="detailPage-wrap dw2">
		<div class="detailPage-content">
			<div class="dt-03">
				<!--상단-->
				<div class="dt-03-left">
					<!--포스터-->
					<div class="dt-product-imgbox">
						<img src="<c:url value='/image/${pfm.performanceImagePath}'/>">
					</div>
				</div>
				<div class="dt-03-right">
					<!--상품정보-->
					<dl>
						<dt>등급</dt>
						<c:if test="${pfm.performanceRatingCode == 0}">
							<dd>&nbsp;전체 관람가</dd>
						</c:if>
						<c:if test="${pfm.performanceRatingCode != 0}">
							<dd>&nbsp;만 ${pfm.performanceRatingCode}세 이상</dd>
						</c:if>
						<dt>관람시간</dt>
						<dd>&nbsp;총 ${pfm.performanceTime}분</dd>
						<dt>장소</dt>
						<c:if test="${pfm.performanceLocationId == 'SE0000001'}">
							<dd>&nbsp;올림픽홀</dd>
						</c:if>
						<c:if test="${pfm.performanceLocationId == 'SE0000002'}">
							<dd>&nbsp;샤롯데씨어터</dd>
						</c:if>
						<dt>가격</dt>
						<dd>&nbsp;R석 <fmt:formatNumber value="${pfm.performancePriceR}" pattern="###,###"/>원</dd>
						<dd>&nbsp;S석 <fmt:formatNumber value="${pfm.performancePriceS}" pattern="###,###"/>원</dd>
						<dt>공연시간</dt>
						<dd>&nbsp;<fmt:formatDate value="${pfm.performanceDate1}" pattern="YYYY년 MM월 dd일(E) a h시"/></dd>
						<dd>&nbsp;<fmt:formatDate value="${pfm.performanceDate2}" pattern="YYYY년 MM월 dd일(E) a h시"/></dd>
					</dl>
					<button id="ticketOpenBtn" disabled></button>
				</div>
			</div>
		</div>
		<div class="dt-04">
			<a href="" id="describe"><span>상세정보</span></a>
				<a href="" id="goReview"><span>관람후기<span class="dt-04-count">(${reviewList.size()})</span></span></a>
		</div>
		<div class="detailPage-describe">
			<div class="dt-05">
				<p class="dt05-tit">유의사항</p>
				<p>※ 매수제한 : 1인 4매</p>
				<p>※ 본 공연은 할인쿠폰이벤트 대상에서 제외됩니다.</p>
				<p>※ 불법적인 경로 혹은 불법적인 시스템을 통해 티켓을 구매할 경우 법적 제재를 받을 수 있습니다.</p>
				<p class="dt05-tit">공연정보<br><br> 
				<img src="<c:url value='/image/${pfm.performanceInformationImagePath}'/>"></p>
				<p class="dt05-tit">장소안내</p>
				<div id="map"></div>
				<input type="hidden" id="performanceLocationId" value="${pfm.performanceLocationId}">
				<p>주차공간이 없으므로 대중교통을 이용하시기 바랍니다.</p>
				<p class="dt05-tit">상품정보제공 고시</p>
				<div class="dt05-txt">
					<div class="dt05-tbl dt05-tbl-plus">
						<table>
							<caption></caption>
							<colgroup>
								<col width="18.5%">
								<col width="31.5%">
								<col width="18.5%">
								<col width="31.5%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">주최/기획</th>
									<td>파이브돌스엔터테인먼트</td>
									<th scope="row" class="rn08-tbl-tit2">고객센터</th>
									<td>1234-1234</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">관람시간</th>
									<td>${pfm.performanceTime}분</td>
									<th scope="row" class="rn08-tbl-tit2">관람등급</th>
									<td>만 ${pfm.performanceRatingCode}세 이상</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">예매수수료</th>
									<td>2,000원</td>
									<th scope="row" class="rn08-tbl-tit2">배송료</th>
									<td>3,000원</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">유효기간</th>
									<td colspan="3"><fmt:formatDate
											value="${pfm.performanceDate1}"
											pattern="YYYY년 MM월 dd일(E) a h시" />, <fmt:formatDate
											value="${pfm.performanceDate2}"
											pattern="YYYY년 MM월 dd일(E) a h시" /> 예매한 공연 날짜, 회차에 한해 이용가능</td>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">취소/환불방법</th>
									<td colspan="3">
										<div class="dt05-detail-box">
											<p>
												공연시작 3시간 전까지 취소수수료가 없으며, 예매 수수료도 환불됩니다.<br> 취소는
												마이페이지&gt;예매확인/취소 에서 직접 취소 또는 고객센터(1234-1234)를 통해 취소 가능합니다.<br>
												티켓이 배송된 후에는 인터넷 취소가 불가하며, 취소마감시간 이전에 고객센터로 티켓이 반송되어야 취소
												가능합니다.<br>
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					<p class="dt05-tit">관람후기</p>
					<form id="reviewForm" name="reviewForm" method="post" action="<c:url value='/performance/insertReview'/>">
						<input type="hidden" id="performanceId" name="performanceId" value="${pfm.performanceId}">
						<div class="write">
							<input type="checkbox" id="layer_popup"><label for="layer_popup">후기 작성하기</label>
							<div id="layer_bg">
								<div id="popup">
									<h2>${pfm.performanceName} <label for="layer_popup">X</label></h2>
									<div class="star-rating">
										<input type="hidden" id="reviewScore" name="reviewScore">
										<p class="star-tit">별점</p>
										<div class="star-box">
											<a href="#"><img src="<c:url value='/image/icons8-star-48-off.png'/>"></a>
											<a href="#"><img src="<c:url value='/image/icons8-star-48-off.png'/>"></a>
											<a href="#"><img src="<c:url value='/image/icons8-star-48-off.png'/>"></a>
											<a href="#"><img src="<c:url value='/image/icons8-star-48-off.png'/>"></a>
											<a href="#"><img src="<c:url value='/image/icons8-star-48-off.png'/>"></a>
										</div>
									</div>
									<div class="write-area">
										<p class="w-tit">관람후기</p>
										<div class="w-write-box">
											<textarea id="txtReview" name="reviewMessage"
												placeholder="내용을 작성해주세요. (최소 20byte / 최대 2,000byte)"></textarea>
										</div>
									</div>
									<div class="write-caution">
										<p class="w-caution-tit">관람후기 작성 시 유의사항</p>
										<p class="w-caution-txt">FIVEDOLLS 게시판 운영 규정에 위반된다고 판단되는
											글은 사전고지 없이 삭제될 수 있습니다.</p>
										<ul class="w-caution-list">
											<li>티켓 매매 및 양도, 교환의 글</li>
											<li>전화번호, 이메일, 주소 등 회원 및 타인의 개인정보 유출이 우려되는 경우</li>
											<li>욕설, 비방, 도배성 글을 작성한 경우</li>
											<li>명예훼손, 저작권, 초상권의 권리 침해 및 음란한 사진을 게재한 경우</li>
										</ul>
									</div>
									<div class="write-btns">
										<button type="submit" id="insertReview">등록</button>
										<button type="button" id="cancellation">취소</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div id="rev_container">
					<ul class="review">
						<c:choose>
							<c:when test="${empty reviewList}">
								<li>등록된 후기가 없습니다.</li>
							</c:when>
						<c:otherwise>
							<c:forEach items="${reviewList}" var="reviewList">
								<li>
									<div class="writerBox">
										<span class="writerId">${reviewList.custId}</span> 
										<span class="writeDate"><fmt:formatDate value="${reviewList.firstChangeDate}" 
										pattern="YY.MM.dd" /></span>
										<span class="reviewGrade"> 
											<c:forEach begin="1" end="${reviewList.reviewScore}">
												<img src="<c:url value='/image/icons8-star-16.png'/>">
											</c:forEach>
										</span>
										<c:if test="${reviewList.custId == sessionScope.sid}">
											<a href="#" class="deleteReview" data-review-id="${reviewList.reviewSeq}">삭제</a>
										</c:if>
										<div class="reviewText">${reviewList.reviewMessage}</div>
									</div>
								</li>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</ul>
						<c:choose>
							<c:when test="${!empty reviewList}">
								<div class="list-pagination" style="display: block;">
									<a href="" class="list-page-first"><img
										src="<c:url value='/image/icons8-arrow-20.png'/>"></a>
									<div>
										<a href="#" onclick="return false;" class="on"><span>1</span></a><a
											href=""><span>2</span></a><a href=""><span>3</span></a><a
											href=""><span>4</span></a><a href=""><span>5</span></a>
									</div>
									<a href="" class="list-page-last"><img
										src="<c:url value='/image/icons8-arrow-20_2.png'/>"></a>
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
	</div>
	</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>

</html>
