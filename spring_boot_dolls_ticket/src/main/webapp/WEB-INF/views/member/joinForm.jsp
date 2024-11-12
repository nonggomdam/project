<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="/css/join.css" rel="stylesheet" type="text/css">
<link href="/css/font3.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/join.js"></script>
<script src="/js/idCheck.js"></script>
</head>
<body>
    <div class="main-signup">
        <!--웹페이지 상단-->
        <header>
            <!-- LOGO -->
            <div class="logo">
                <a href="/">FiveDolls</a>
            </div>
        </header>

        <!--회원가입 부분-->
        <section class="signup-wrap">
            <form id="joinForm" name="joinForm" method="post"  
	        			action="<c:url value='/member/join'/>"> <!-- 중복 form 제거 -->

                <div>
                    <!--아이디,비번,비번재확인-->

                    <h3>아이디</h3>
                    <span class="signup-input">
                        <input id="signupId" type="text" name="custId"></input>
                        <button id="idCheck" type="button">중복확인</button>
                    </span>
                    

                    <h3>비밀번호</h3>
                    <span class="signup-input">
                        <input id="signupPwd" type="password" name="custPassWord"></input> <!-- 비밀번호는 type="password"로 -->
                        <span class="pw-lock"></span>
                    </span>

                    <h3>비밀번호 재확인</h3>
                    <span class="signup-input">
                        <input id="signupPwwd" type="password"></input> <!-- 비밀번호는 type="password"로 -->
                        <span class="pww-lock"></span>
                    </span>

                </div>

                <div style="margin-top: 20px;">
                    <!--이름,성년월일,성별,이메일-->
                    <h3>이름</h3>
                    <span class="signup-input">
                        <input id="signupName" type="text" name="custName"></input>
                    </span>

                    <h3>성별</h3>
                    <span class="signup-input">
                        <select id="signupGender" name="custGender">
    						<option value="gender">성별</option>
    						<option value="man">남자</option>
    						<option value="woman">여자</option>
    						<option value="no">선택 안함</option>
                        </select>
                    </span>

                    <span class="choice">
                        <h3>이메일 주소</h3>
                     
                    </span>
                    <span class="signup-input">
                        <input id="signupEmail" type="text" name="custEmail"></input>
                    </span>

                </div>

                <div style="margin-top: 20px;">
                    <!--휴대전화-->
                    <h3>휴대전화</h3>
                    <div style="display: flex;">
                        <span class="signup-input" style="width:100%;">
                            <input id="signupPhoneNumber" type="text" name="custPhoneNumber" placeholder="전화번호 입력"></input>
                        </span>
                    </div>  
                </div>      

                <div>
                    <!--가입하기-->
                    <div class="signup-btn-wrap">
                        <button id="signupBtn" type="submit">가입하기</button> <!-- type="submit" 추가 -->
                    </div>
                </div>
            </form>
        </section>
    </div>
</body>
</html>