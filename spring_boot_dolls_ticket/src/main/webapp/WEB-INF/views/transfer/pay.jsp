<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양도 결제</title>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubPay.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>

<body>
	<div id="wrapper">
		<div class="banner" style="width:100%; height:80px;line-height:20px;">
		    <div class="text-box small-text">안전하고 투명한 <span style="font-weight:bold;color:#a22110;">티켓 양도</span> 거래!</div>
		    <div class="text-inline">
		        <span style="font-size:25px;">신뢰할 수 있는</span>
		        <span class="large-text">파이브돌스</span>
		        <span style="font-size:25px;">에서 안전하게</span>
		        <span class="text-box2 small-text hide-and-slide stylish-box" style="display:inline-block;"><span style="font-weight:bold;">티켓</span>을 <span style="font-weight:bold;">양도</span>하세요</span>
		    </div>
		</div>
	<div style='margin-top:100px;'></div>
	<c:forEach var="item" items="${list}" varStatus="status"> 
	<hr style="border:1px solid #eee;width:1000px;"/>
	<div class="show-item">
		<table style='width:1000px;border-top:0px solid lightgray;border-collapse:collapse;'>
			<tr>
				<td style='width:150px'><img src="/image/${item.performanceImagePath}" width='120px'></td>
				<td>
					
					<div><span>${item.performanceName}</span></div>
					<div>
						<span>일시 : ${item.performanceDate}</span>
					</div>
					<div>
						<span>좌석 : ${item.reservationSeatKindCd}${item.reservationSeatNumber}석</span>
					</div>
					<div>
						<span class="price" data-price=${item.price }>가격 : <fmt:formatNumber value="${item.price}" pattern="#,###"/>원</span>						 										
					</div>									
				</td>
			</tr>
		</table>								
	</div>
	</c:forEach>
	<hr style="border:1px solid #eee;width:1000px;"/>

 	<div style='width:1000px;margin-top: 20px;'>
 		<div style="font-size:20px;">
			최종 결제 금액 <span style="font-size:30px;font-weight:bold;">&nbsp;&nbsp;<fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span><span style="font-size:30px;">원</span>
		</div>
	
	    <div id="payment-method" ></div>
	    <div id="agreement"></div>
	  
	    <button id="payment-button" class="payment-button">결제하기</button>

	    
		<form action="<c:url value='/receive/complete'/>" method="post" name="frm1">
			<input type="hidden" value="${noticeId}" name="noticeId"/>
			<c:forEach items="${assignmentSqno}" var="item">
				<input type='hidden' name="assignmentSqno" value="${item}"/>
			</c:forEach>
		</form>
	</div>
    <script>
    
      const button = document.getElementById("payment-button");
      const button1 = document.getElementById("payment-button1");
      const amount = ${totalPrice};

 
      const widgetClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
      const customerKey = '${sessionScope.sid}';
      const paymentWidget = PaymentWidget(widgetClientKey, customerKey); 
      const paymentMethodWidget = paymentWidget.renderPaymentMethods(
        "#payment-method",
        { value: amount },
        { variantKey: "DEFAULT" }
      );

      paymentWidget.renderAgreement(
        "#agreement",
        { variantKey: "AGREEMENT" }
      );

 

      button.addEventListener("click", function () {
    	 
        paymentWidget.requestPayment({
          orderId: "${orderNo}",
          orderName: "${itemName}",
          successUrl: window.location.origin + "/success",
          failUrl: window.location.origin + "/fail",
          customerEmail: "",
          customerName: "",
          customerMobilePhone: "01011111111",
        });
      });
      
      button1.addEventListener("click", function() {
    	  frm1.submit();
      });
    </script>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>