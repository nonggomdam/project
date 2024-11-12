<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link href="/css/searchPwwd.css" rel="stylesheet" type="text/css">
<link href="/css/font3.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/js/findPwwd.js" defer></script>
</head>
<body>
	<div id="logo">
		<a href="/">
			<h1>Five Dolls</h1>
		</a>
	</div>
    <div class="pwFind-form">
        <form id="findPwdForm" action="" method="post" class="form-horizontal" name="pwfrm">
            <div class="row">
                <div align="center">
                    <h2>비밀번호 재설정</h2>
                </div>
            </div>

            

          <div class="form-group row">
    		<div class="col-8 offset-4 method-buttons">
        		<button type="button" id="emailButton" class="method-button">이메일로 변경</button>
        		<button type="button" id="phoneButton" class="method-button">전화번호로 변경</button>
    		</div>
		  </div>
			<div class="form-group row">
                <label class="col-form-label col-4">이름</label>
                <div class="col-8">
                    <input type="text" class="form-control" name="name" placeholder="이름을 입력하세요." required="required">
                </div>        	
            </div>
            <div class="form-group row" id="emailGroup" style="display: block;">
                <label class="col-form-label col-4">이메일</label>
                <div class="col-8">
                    <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요." required="required">
                </div>        	
            </div>
 
            <div class="form-group row" id="phoneGroup" style="display: none;">
                <label class="col-form-label col-4">전화번호</label>
                <div class="col-8">
                    <input type="tel" class="form-control" name="phone" placeholder="전화번호를 입력하세요." required="required">
                </div>        	
            </div>
 
            <div class="form-group row">
                <button type="submit" id="submit" class="btn-primary btn-lg">확인 후 비밀번호 재설정</button>
            </div>
           		
        </form>
    </div>
    <div id="resultContainer"></div>
</body>
</html>