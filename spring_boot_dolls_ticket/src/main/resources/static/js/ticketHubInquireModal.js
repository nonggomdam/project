/**
 * ticketHubInquireModal.js
 */
 
window.onload=function(){
	/*
	var modal=document.getElementById('open-modal');
	var closeBtn=document.getElementsByClassName('close')[0];


	closeBtn.onclick=function(){
	    modal.style.display='none';
	}

	window.onclick=function(event){
	    if (event.target == modal){
	        modal.style.display='none';
	    }
	}
	*/
	
	
	$('#receiveBtn').click(function(event){
	
		if($('input[type="checkbox"]:checked').length === 0){
			event.preventDefault();
			alert("티켓을 선택하세요.");
			return;
		}
		/*
		else {
            modal.style.display = 'block';
        }
        */
        
        receiveTicket()
	
	});

};