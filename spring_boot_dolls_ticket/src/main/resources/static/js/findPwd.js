/**
 * 
 */
 
window.onload = function(){
	
	const form = document.getElementById('findPwdForm');
	
	form.addEventListener("submit", function(event) {
        event.preventDefault();
        
        const pwCheck = document.getElementById('pwCheck').value;
        
        $.ajax({
            type: 'POST',
            url: '/member/checkId', // 서버에서 아이디 확인을 처리하는 경로
            data: { id: pwCheck },
            success: function(response) {
                if (response.exists) { // 서버에서 응답이 true일 때
                    window.location.href = 'searchPwwd'; // 비밀번호 재설정 페이지로 이동
                } else {
                    alert('아이디가 존재하지 않습니다.'); // 경고 메시지
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.'); // 오류 메시지
            }  
        });
    });
};