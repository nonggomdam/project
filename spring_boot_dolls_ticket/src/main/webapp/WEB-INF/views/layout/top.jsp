<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>

	<body>
		<div class="navbar ${sessionScope.administratorYn == 'Y' ? 'admin' : 'user'}">
			<div style="width:20%; text-align: center;" class="mainLogo">
				<a href="/">FiveDolls</a>
			</div>
	      	<!-- 관리자 여부에 따라 메뉴 표시 -->
	        <div style="width:60%; text-align: center;" class="categories">
	            <c:choose>
	                <c:when test="${sessionScope.administratorYn == 'Y'}">
	                    <!-- 관리자 메뉴 -->
	                    <a href="/admin">메인</a>
	                    <a href="/admin/performanceList">공연 관리</a>
	                    <a href="/admin/noticeList">공지 사항</a>
	                    <a href="/admin/inquiryList">1:1 문의</a>
	                    <a href="/admin/memberList">사용자 관리</a>
	                </c:when>
	                <c:otherwise>
	                    <!-- 일반 사용자 메뉴 -->
	                    <a href="<c:url value='/performance/musical'/>">뮤지컬</a>
	                    <a href="<c:url value='/performance/concert'/>">콘서트</a>
	                    <a href="<c:url value='/transfer/list'/>">양도하기</a>
	                </c:otherwise>
	            </c:choose>
	        </div>
	        
			
			<div style="width:20%; text-align: right;" class="member">
				<c:if test="${empty sessionScope.sid }">			
					<a class="login" href="<c:url value='/member/loginForm'/>">로그인</a>					
				</c:if>
						
				<c:if test="${not empty sessionScope.sid }">
					<%-- <span style="color: white;">${sessionScope.sid }님 환영합니다!</span> --%>		
					<a href="<c:url value='/member/logout'/>">로그아웃</a>					
					<a href="<c:url value='/member/myPage'/>">마이페이지</a>
				</c:if> 
			</div>
    	</div> 
    	
    </body>
</html>
