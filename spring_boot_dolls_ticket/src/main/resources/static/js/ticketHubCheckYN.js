/**
 * ticketHubCheckYN.js
 */
 $(document).ready(function(){

	$('#submitBtn').click(function(){
	
		const title = document.getElementById('title').value;
		if(title.length <= 0){
			event.preventDefault();
			alert("제목을 입력하세요.");
			return;
		}
	
		if($('input[type="checkbox"]:checked').length === 0){
			event.preventDefault();
			alert("티켓을 선택하세요.");
		}
	
	});

});//ready끝