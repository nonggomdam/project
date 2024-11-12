<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 공용으로 사용하는 css/script link 로만 구성 모든 뷰에 import 해서 사용 --> 
		
	    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
	    <link rel="stylesheet" type="text/css" href="<c:url value='/css/navbar.css'/>">
	    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/index.js'/>"></script>
		<script src="<c:url value='/js/performance.js'/>"></script>

		

<script>
  window.addEventListener('scroll', function () {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });
</script>