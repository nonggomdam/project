/**
 * 
 */
 
 
 function commonAjax(type, url, data, dataType){
 	console.log("commonAjax do...");
 	$.ajax({
 		type: type
 		, url: url
 		, data: data
 		, dataType: dataType
 		, success: function(response) {
        	if (response === 'success') {
            	// 로그인 성공 처리
        	} else {
            	// 로그인 실패 처리
        	}
 		}
 		, error: function(err) {
 			console.error("Login error: ", error);
 			// 공통 에러페이지 이동
 			/*
 			location.href = 'error 페이지';
 			*/
 		}
 	})
 }

 
 
 function stringutil(str) {
 	// 100000 -> 100,000 명
 	return str + " 테스트";
 }