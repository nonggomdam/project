<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/listView.js'/>"></script>
	</head>
	<body>
        <div class="adminMainWrapper">
            <table class="outerTable">
                <tr>
                    <td>
                        <div class="section">
                            <h3><a href="/admin/performanceList">공연 관리</a></h3>
                            <table id="performanceTable">
                                <thead>
                                    <tr>
                                        <th>공연 ID</th>
                                        <th>공연명</th>
                                        <th>분류</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="performanceItems">
                                    <c:choose>
                                        <c:when test="${empty performanceList}">
                                            <tr>
                                                <td colspan="4">등록된 공연이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${performanceList}" var="performance" varStatus="status">
                                                <tr id="${performance.performanceId}" class="performanceRow" style="cursor:pointer; display: ${status.index < 5? 'table-row' : 'none'};">
                                                    <td>${performance.performanceId}</td>
                                                    <td>${performance.performanceName}</td>
                                                    <td>
	                                                    <c:choose>
												            <c:when test="${performance.performanceKindCd == 'C'}">콘서트</c:when>
												            <c:when test="${performance.performanceKindCd == 'M'}">뮤지컬</c:when>
												        </c:choose>
													</td>
                                                    <td><fmt:formatDate value="${performance.firstChangeDate}" pattern="yyyy년 MM월 dd일"/></td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div class="section">
                            <h3><a href="/admin/noticeList">공지 사항</a></h3>
                            <table id="noticeTable">
                                <thead>
                                    <tr>
                                        <th>NO</th>
										<th>분류</th>
										<th>제목</th>
										<th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="noticeItems">
                                	<c:choose>
                                        <c:when test="${empty noticeList}">
                                            <tr>
                                                <td colspan="4">등록된 공지 사항이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                                <tr id="${notice.noticeNo}" class="noticeRow" style="cursor:pointer; display: ${status.index < 5? 'table-row' : 'none'};">
                                                    <td>${notice.noticeNo}</td>
                                                    <td>${notice.noticeType}</td>
                                                    <td>${notice.noticeTitle}</td>
                                                    <td><fmt:formatDate value="${notice.firstChangeDate}" pattern="yyyy년 MM월 dd일"/></td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="section">
                            <h3><a href="/admin/inquiryList">1:1 문의</a></h3>
                            <table id="qaTable">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>처리 상태</th>
                                        <th>제목</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="qaItems">
                                	<c:choose>
								        <c:when test="${empty inquiryList}">
								            <tr>
								                <td colspan="4">등록된 문의 사항이 없습니다.</td>
								            </tr>
								        </c:when>
								        <c:otherwise>
								            <c:forEach items="${inquiryList}" var="inquiry" varStatus="status">
								                <tr id="${inquiry.inquiryId}" class="inquiryRow" style="cursor:pointer; display: ${status.index < 5 ? 'table-row' : 'none'};">
								                    <td>${inquiry.inquiryId}</td>
								                    <td>${inquiry.status} </td>
								                    <td>${inquiry.title}</td>
								                    <td><fmt:formatDate value="${inquiry.regDate}" pattern="yyyy년 MM월 dd일" /></td>
								                </tr>
								            </c:forEach>
								        </c:otherwise>
								    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div class="section">
                            <h3><a href="/admin/memberList">회원 관리</a></h3>
                            <table id="memberTable">
                            	<thead>
                            		<tr>
                                        <th>ID</th>
                                        <th>권한</th>
                                        <th>전화 번호</th>
                                        <th>이메일</th>
                                    </tr>
                            	</thead>
                            	<tbody id="memberItems">
                                	<c:choose>
                                        <c:when test="${empty memberList}">
                                            <tr>
                                                <td colspan="4">등록된 회원이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${memberList}" var="member" varStatus="status">
                                                <tr id="${member.custId}" class="memberRow" style="cursor:pointer; display: ${status.index < 5? 'table-row' : 'none'};">
                                                    <td>${member.custId}</td>
                                                    <td>${member.administratorYN}</td>
                                                    <td>${member.custPhoneNumber}</td>
                                                    <td>${member.custEmail}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>