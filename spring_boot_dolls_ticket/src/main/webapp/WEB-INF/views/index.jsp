<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FiveDolls 티켓</title>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/body.css'/>">
		<script src="<c:url value='/js/body.js'/>"></script>
		<script src="<c:url value='/js/slideShow.js'/>"></script>	
		<script src="<c:url value='/js/index.js'/>"></script>
	</head>
	<body>
	 	<c:import url="/WEB-INF/views/layout/body.jsp"/>	 	
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>