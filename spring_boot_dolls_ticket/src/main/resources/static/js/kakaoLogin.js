/**
 * 
 */
// 카카오 로그인 함수
$(document).ready(function() {
    function kakaoLogin() {
        // 카카오 인증 URL로 리디렉션
        window.location.href = '/kakao/oauth';
    }

    // 카카오 로그인 버튼 클릭 이벤트 핸들러
    $('#kakaoLoginBtn').on('click', function() {
    $.ajax({
        url: '/member/logout',
        type: 'POST',
        success: function() {
            // 로그아웃이 완료된 후 1초 뒤에 카카오 로그인 요청
            setTimeout(kakaoLogin, 1000); // 1초 대기
        },
        error: function() {
            console.error("로그아웃 중 오류 발생");
            // 오류가 발생하면 그냥 카카오 로그인 요청
            kakaoLogin();
        }
    });

    // 기본 폼 제출 방지
    return false;
});

    // 숨겨진 요소에서 kakaoInfo 값을 가져옵니다.
    var kakaoInfo = $('#kakaoInfo').text();

    if (kakaoInfo !== "") {
        try {
            var data = JSON.parse(kakaoInfo);
            alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
            alert(
                "user : \n" + 
                "email : " + data['email'] + 
                "\n nickname : " + data['nickname']
            ); 
        } catch (e) {
            console.error("JSON 파싱 오류: ", e);
            alert("로그인 정보 처리 중 오류가 발생했습니다.");
        }
    }
});

