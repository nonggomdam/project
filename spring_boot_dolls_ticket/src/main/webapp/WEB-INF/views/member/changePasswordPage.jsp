<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <style>

         .passchange {
            max-width: 500px;
            margin-top : 230px;
            margin-bottom: 230px;
            padding: 50px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            height: 360px;
        }
        .passchange h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .chagneform {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            margin-top:30px;
        }
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .passchange button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top:40px;
        }
        .passchange button:hover {
            background-color: #0056b3;
        }
        #result {
            margin-top: 10px;
            text-align: center;
            color: red;
        } 
    </style>
</head>
<body>

    <div class="passchange">
        <h2>비밀번호 변경</h2>
        <form class="chagneform"action="<c:url value='/member/pwdChange'/> method="post" id="passwordForm">
            <!-- 비밀번호 변경 입력 필드 -->
            <div class="form-group">
                <label for="newPassword">새 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>

            <!-- 비밀번호 확인 입력 필드 -->
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <!-- 비밀번호 변경 버튼 -->
            <button type="submit">비밀번호 변경</button>

            <!-- 결과 출력 -->
            <div id="result"></div>
        </form>
        
    </div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
    <script>
        document.getElementById('passwordForm').addEventListener('submit', function(event) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const resultDiv = document.getElementById('result');

            // 비밀번호와 비밀번호 확인이 다를 경우 폼 전송 차단
            if (newPassword !== confirmPassword) {
                event.preventDefault();
                resultDiv.style.color = 'red';
                resultDiv.textContent = '비밀번호가 일치하지 않습니다.';
            }
        });
    </script>
</html>
