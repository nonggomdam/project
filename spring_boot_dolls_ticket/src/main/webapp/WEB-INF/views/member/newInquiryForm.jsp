<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1 문의 작성</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<script src="<c:url value='/js/newInquiry.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			<h3>1:1 문의 작성</h3>
			<form id="newInquiryForm" method="POST" action="<c:url value='/member/insertInquiry'/>" enctype="multipart/form-data">
				<table class="listTable">
					<tr>
			            <th>문의 제목</th>
			            <td><input type="text" name="title" required></td>
			        </tr>
			        <tr>
			            <th>문의 분류</th>
			            <td>
			                <select name="category" required>
			                    <option value="GENERAL">일반 문의</option>
			                    <option value="ACCOUNT">계정 관련</option>
			                    <option value="BILLING">결제 및 청구</option>
			                    <option value="REFUND">환불 요청</option>
			                    <option value="OTHER">기타 문의</option>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <th>문의 내용</th>
			            <td><textarea name="content" rows="15" style="width: 850px" required></textarea></td>
			        </tr>
			    </table><br>
				<input type="submit" value="등록 완료">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>