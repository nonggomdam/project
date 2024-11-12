/**
 *  비동기 통신 (ajax) 활용한 login submit
 */
 
 $(document).ready(function() {
    $('#loginForm').on('submit', function(event) {
        event.preventDefault(); // 기본 submit 기능 중단
        const data = {
            id: $('#signupId').val(),
            pwd: $('#signupPwd').val()
        };

        $.ajax({
            type: "POST",
            url: "/member/login",
            data: data,
            success: function(response) {
                if (response === 'admin') {
                    // 관리자 로그인 성공
                    window.location.href = "/admin";
                } else if (response == 'main') {
                	// 일반 사용자 로그인 성공
                	window.location.href = "/";
                } else {
                    // 로그인 실패 처리
                    alert("로그인을 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Login error: ", error);
                // 오류 처리
                alert("로그인 중 오류가 발생했습니다."); // 오류 처리
            }
        });
    }); // on 끝
}); // ready 