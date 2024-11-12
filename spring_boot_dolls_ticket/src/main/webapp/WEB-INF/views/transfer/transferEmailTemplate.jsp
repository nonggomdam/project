<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>티켓 이메일 전송</title>
</head>
<body>

	
		<div>
			<p>안녕하세요. <span>${receiveCustId}</span> 님</p> 
		</div>
		
		

	
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>