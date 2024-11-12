<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div id="wrapper">
		<article  id="slideShow"> <!-- 슬라이드 쇼 -->   	
	        <!-- 이전/다음 버튼 -->
			<div id="prevNextButtonBox">
				<img id="prevButton" src="image/prevButton.png">
				<img id="nextButton" src="image/nextButton.png">
			</div>	
			<div id="slideShowBox">
				<div id="slidePanel">
					<a href="<c:url value='/performance/detailViewPerformance/P0002'/>">
					<img src= "<c:url value='/image/banner1.png'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0004'/>">
					<img src= "<c:url value='/image/banner2.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0011'/>">
					<img src= "<c:url value='/image/banner3.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0006'/>">
					<img src= "<c:url value='/image/banner4.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0015'/>">
					<img src= "<c:url value='/image/banner5.png'/>" class="slideImage"></a>
				</div>
			</div> <!-- slideShowBox 끝 -->  
			<div id = "controlPanel">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
			</div>	
	    </article>
			<h1>RANKING</h1>
			<div class='bTab'>
				<div class="hashtag"><span class='active' data='#initialTable'>#콘서트</span></div>
				<div class="hashtag"><span data='#dynamicTable' >#뮤지컬</span></div>
			</div>
				
			<table id="initialTable">
				<tr>
				<c:forEach items="${consertOpenList}" var="consertOpen" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
		            <tr>
		        </c:if>
					<td class="ranking">
						<div class="info">				
							<img src="<c:url value='/image/${consertOpen.performanceImagePath}'/>">
								<div class="textinfo">
									<span>${consertOpen.performanceName}<br>
										  <br>
										  <fmt:formatDate value="${consertOpen.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpen.maxPerformanceDate}" pattern="yyyy.MM.dd"/><br>
										  <br><a href="/performance/detailViewPerformance/${consertOpen.performanceId}">공연 상세정보</a>
									</span>	  
								</div>						
						</div>	
					</td>
				    <c:if test="${(status.index + 1) % 4 == 0}">
			            </tr>
			        </c:if>
				</c:forEach>
				</tr>
			</table>
		</div>
		
		<div id="dynamicTable" style="display:none;">
      		<table>
			<tr>
			<c:forEach items="${performanceOpenList}" var="performanceOpen" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
		            <tr>
		        </c:if>
				<td class="ranking">
					<div class="info">
						<img src="<c:url value='/image/${performanceOpen.performanceImagePath}'/>">
							<div class="textinfo">
								<span>${performanceOpen.performanceName}<br>
									  <br>
									  <fmt:formatDate value="${performanceOpen.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${performanceOpen.maxPerformanceDate}" pattern="yyyy.MM.dd"/><br>
									  <br><a href="/performance/detailViewPerformance/${performanceOpen.performanceId}">공연 상세정보</a>
								</span>	  
							</div>
					</div>
				</td>
				<c:if test="${(status.index + 1) % 4 == 0}">
			         </tr>
			    </c:if>
			</c:forEach>	
			</tr>
			</table>	
		</div> <!--dynamicTable 끝  -->
		<div class="banner">
			<a href="<c:url value='/performance/detailViewPerformance/P0006'/>"><img src="<c:url value='/image/뮤지컬.png'/>"></a>
		</div>
		<div id="box2">
			<h1>TICKET COMING SOON</h1>
			<table>
				<tr>
				<c:forEach items="${performanceOpenExpectedList}" var="performanceOpenExpected" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
		            <tr>
		        </c:if>
					<td class="ranking">
						<div class="infocoming">
							<a href="/performance/detailViewPerformance/${performanceOpenExpected.performanceId}"><img src="<c:url value='/image/${performanceOpenExpected.performanceImagePath}'/>">
								<div class="donut-dday">D-6</div>
								<div class="info-txt">
									<p class="info-txt1">${performanceOpenExpected.performanceName}</p>
									<p class="info-txt2"><fmt:formatDate value="${performanceOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${performanceOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/>
									<br><br><fmt:formatDate value="${performanceOpenExpected.reservationOpenExpectedDate}" pattern="yyyy.MM.dd"/> 오픈예정</p>
								</div></a>
						</div>
					</td>
				</c:forEach>	
				</tr>
			</table>
		</div>
		<div class="empty2"></div>
		
 		