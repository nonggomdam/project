<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>concert page</title>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/body.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/concert.css'/>">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/body.js'/>"></script>
	</head>
	<body>
	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0001'/>"><img src="<c:url value='/image/c_banner1.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 나훈아 콘서트</p>
						<p class="slide-detail">2024.11.19 ~ 2024.11.20</p>
				</div></a>
		  </div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0003'/>"><img src="<c:url value='/image/c_banner2.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 NE-YO 콘서트</p>
						<p class="slide-detail">2024.11.18 ~ 2024.11.19</p>
				</div></a>
		  </div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0002'/>"><img src="<c:url value='/image/c_banner3.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 적재 콘서트</p>
						<p class="slide-detail">2024.11.23 ~ 2024.11.24</p>
				</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0004'/>"><img src="<c:url value='/image/c_banner4.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 이찬원 콘서트</p>
						<p class="slide-detail">2024.11.13 ~ 2024.11.14</p>
				</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0011'/>"><img src="<c:url value='/image/c_banner5.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 송골매 콘서트</p>
						<p class="slide-detail">2024.11.30 ~ 2024.12.01</p>
				</div></a>
			</div>
	      <div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0012'/>"><img src="<c:url value='/image/c_banner6.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">박진영 30주년 콘서트〈Still JYP〉</p>
						<p class="slide-detail">2024.12.14 ~ 2024.12.15</p>
				</div></a>
			</div>
	    </div>
  	</div>
  	
	<h1 id="now-open">NOW OPEN</h1>
	<table id="initialTable">
		<tr>
		<c:forEach items="${consertOpenList}" var="consertOpen" varStatus="status">
		<c:if test="${status.index % 4 == 0}">
            <tr>
        </c:if>
			<td class="ranking">
				<div class="infocoming">				
					<a href="/performance/detailViewPerformance/${consertOpen.performanceId}">
					<img src="<c:url value='/image/${consertOpen.performanceImagePath}'/>">
						<div class="info-txt">
							<p class="info-txt1">${consertOpen.performanceName}</p>
							<p class="info-txt2"><fmt:formatDate value="${consertOpen.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpen.maxPerformanceDate}" pattern="yyyy.MM.dd"/></p>
						</div>
					</a>						
				</div>	
			</td>
		    <c:if test="${(status.index + 1) % 4 == 0}">
	            </tr>
	        </c:if>
		</c:forEach>
		</tr>
	</table>

		<div class="banner">
				<a href="<c:url value='/performance/detailViewPerformance/P0013'/>"><img src="<c:url value='/image/long_banner.png'/>"></a>
		</div>
		<h1 id="comming-soon">TICKET COMING SOON</h1>
		<table id="initialTable">
		<tr>
		<c:forEach items="${consertOpenExpectedList}" var="consertOpenExpected" varStatus="status">
		<c:if test="${status.index % 4 == 0}">
            <tr>
        </c:if>
			<td class="ranking">
				<div class="infocoming">				
					<a href="/performance/detailViewPerformance/${consertOpenExpected.performanceId}">
					<img src="<c:url value='/image/${consertOpenExpected.performanceImagePath}'/>">
						<div class="info-txt">
							<p class="info-txt1">${consertOpenExpected.performanceName}</p>
							<p class="info-txt2"><fmt:formatDate value="${consertOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/>
							<br><br><fmt:formatDate value="${consertOpenExpected.reservationOpenExpectedDate}" pattern="yyyy.MM.dd"/> 오픈예정</p>
						</div>
					</a>						
				</div>	
			</td>
		    <c:if test="${(status.index + 1) % 4 == 0}">
	            </tr>
	        </c:if>
		</c:forEach>
		</tr>
		</table>

	<div class="empty2"></div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="<c:url value='/js/swiper.js'/>"></script>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
	</body>
</html>
 		
