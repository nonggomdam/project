/**
 * 
 */
 
 
 // 카카오 로그인 함수
$(document).ready(function() {
    function naverLogin() {
        const reqUrl = "https://nid.naver.com/oauth2.0/authorize" +
            "?client_id=M8tmkDymjlbYysnk7E5u" +
            "&redirect_uri=http://localhost:8080/naver/callback" +
            "&response_type=code" +
            "&prompt=login"; 

        window.location.href = reqUrl;
    }

    $('#naverLoginBtn').on('click', function() {
        $.ajax({
            url: '/member/logout',
            type: 'POST',
            success: function() {
                // 로그아웃이 성공적으로 완료된 후에만 네이버 로그인 요청
                naverLogin();
            },
            error: function() {
                console.error("로그아웃 중 오류 발생");
                // 로그아웃 실패 시 사용자에게 경고 메시지 등 추가 처리
                alert("로그아웃에 실패했습니다. 다시 시도해 주세요.");
            }
        });

        return false; // 기본 폼 제출 방지
    });

    var naverInfo = $('#naverInfo').text();

    if (naverInfo !== "") {
        try {
            var data = JSON.parse(naverInfo); 
            alert("네이버로그인 성공 \n accessToken : " + data['accessToken']);
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