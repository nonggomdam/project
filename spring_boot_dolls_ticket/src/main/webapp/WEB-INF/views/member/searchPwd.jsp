<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="/css/searchPwd.css" rel="stylesheet" type="text/css">
<link href="/css/font3.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/js/findPwd.js"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>
	<div id="logo">
		<a href="/">
			<h1>Five Dolls</h1>
		</a>
	</div>

	<div class="idFind-form">
    	<div align="center">
        	<h2>비밀번호 찾기</h2>
    	</div>
    
    	<h3>아이디 확인 후 <br>비밀번호를 재설정 할 수 있습니다</h3>

        <form id="findPwdForm"> 
            <div class="input-group">
                <input type="text" id="pwCheck" placeholder="아이디를 입력하세요." required>
            </div>
            <button type="submit">아이디 확인</button> 
        </form>
	</div>
</body>
</html>