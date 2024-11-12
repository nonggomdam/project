<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 30px;
            width: 400px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .error-container h2 {
            margin-bottom: 15px;
        }
        .error-container p {
            margin: 0;
            font-size: 18px;
        }
        .back-button {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #d4edda;
            color: #155724;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #c3e6cb;
        }
    </style>
</head>
<body>

    <div class="error-container">
        <h2>시스템오류</h2>
        <!-- 서버에서 전달된 오류 메시지 출력 -->
        <p>시스템에 오류가 발생하였습니다. <br> 고객센터로 연락 바랍니다. 032-1234-1234</p>
        <!-- 메인 페이지로 돌아가는 버튼 -->
        <a class="back-button" href="/">메인 페이지로 돌아가기</a>
    </div>

</body>
</html>
