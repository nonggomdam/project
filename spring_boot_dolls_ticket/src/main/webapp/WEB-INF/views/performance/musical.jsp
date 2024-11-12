<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>musical page</title>
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
				<a href="<c:url value='/performance/detailViewPerformance/P0005'/>"><img
					src="<c:url value='/image/m_banner1.jfif'/>">
					<div class="slide-txt">
						<p class="slide-tit">뮤지컬 [알라딘] 한국 초연 (ALADDIN The Musical)</p>
						<p class="slide-detail">2024.11.11 ~ 2024.11.12</p>
					</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0006'/>"><img
					src="<c:url value='/image/m_banner2.jfif'/>">
					<div class="slide-txt">
						<p class="slide-tit">뮤지컬 [빈센트 반 고흐]</p>
						<p class="slide-detail">2024.11.13 ~ 2024.11.14</p>
					</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0011'/>"><img
					src="<c:url value='/image/m_banner3.jfif'/>">
					<div class="slide-txt">
						<p class="slide-tit">뮤지컬 〈젠틀맨스 가이드：사랑과 살인편〉</p>
						<p class="slide-detail">2024.11.20 ~ 2024.11.21</p>
					</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0007'/>"><img
					src="<c:url value='/image/m_banner4.jfif'/>">
					<div class="slide-txt">
						<p class="slide-tit">뮤지컬 〈이터니티〉</p>
						<p class="slide-detail">2024.11.16 ~ 2024.11.17</p>
					</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0008'/>"><img
					src="<c:url value='/image/m_banner5.jfif'/>">
					<div class="slide-txt">
						<p class="slide-tit">2024 뮤지컬 [지저스 크라이스트 수퍼스타]</p>
						<p class="slide-detail">2024.11.19 ~ 2024.11.20</p>
					</div></a>
			</div>
		</div>
	</div>
		<h1 id="now-open">NOW OPEN</h1>
		<table id="initialTable">
			<tr>
			<c:forEach items="${performanceOpenList}" var="performanceOpen" varStatus="status">
			<c:if test="${status.index % 4 == 0}">
	            <tr>
	        </c:if>
				<td class="ranking">
				<div class="infocoming">				
					<a href="/performance/detailViewPerformance/${performanceOpen.performanceId}">
					<img src="<c:url value='/image/${performanceOpen.performanceImagePath}'/>">
						<div class="info-txt">
							<p class="info-txt1">${performanceOpen.performanceName}</p>
							<p class="info-txt2"><fmt:formatDate value="${performanceOpen.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${performanceOpen.maxPerformanceDate}" pattern="yyyy.MM.dd"/></p>
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
				<a href="<c:url value='/performance/detailViewPerformance/P0006'/>"><img src="<c:url value='/image/킹키부츠.png'/>"></a>
			</div>
			<h1 id="comming-soon" >TICKET COMING SOON</h1>
			<table id="initialTable">
			<tr>
			<c:forEach items="${performanceOpenExpectedList}" var="performanceOpenExpected" varStatus="status">
			<c:if test="${status.index % 4 == 0}">
	            <tr>
	        </c:if>
				<td class="ranking">
					<div class="infocoming">				
						<a href="/performance/detailViewPerformance/${performanceOpenExpected.performanceId}">
						<img src="<c:url value='/image/${performanceOpenExpected.performanceImagePath}'/>">
							<div class="info-txt">
								<p class="info-txt1">${performanceOpenExpected.performanceName}</p>
								<p class="info-txt2"><fmt:formatDate value="${performanceOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${performanceOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/>
								<br><br><fmt:formatDate value="${performanceOpenExpected.reservationOpenExpectedDate}" pattern="yyyy.MM.dd"/> 오픈예정</p>
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
		</div>
	<div class="empty2"></div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="<c:url value='/js/swiper.js'/>"></script>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	
	<script>
    let currentPage = 1;

    function loadMorePerformances() {
        currentPage++;
        fetch(`/performance/musical?page=${currentPage}`)
            .then(response => response.text())
            .then(data => {
                // 새로운 공연 데이터를 추가적으로 삽입
                document.getElementById('performanceList').insertAdjacentHTML('beforeend', data);
            })
            .catch(error => console.error("Error loading more performances:", error));
    }
</script>
	
	</body>
</html>
 		
