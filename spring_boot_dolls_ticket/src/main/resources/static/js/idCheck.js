/**
 *  ID 중복 조회
 */
 
 document.addEventListener("DOMContentLoaded", function() {
    const idCheckButton = document.getElementById("idCheck");
    const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 아이디 패턴 정의

    idCheckButton.addEventListener("click", function() {
        const signupId = document.getElementById("signupId").value;

        if (!idPattern.test(signupId)) {
            alert("아이디는 4-12자의 영숫자여야 합니다.");
            return; // 아이디 형식이 잘못된 경우 중단
        } else {
            $.ajax({
                type: "post",
                url: "/member/idCheck",
                data: { "id": signupId }, // 입력한 ID 사용
                dataType: "text",
                success: function(result) {
                    // 컨트롤러에서 정수를 반환받아 해당 정수의 값을 이용해서 진행
                    if (result > 0) {
                        alert("중복된 ID 입니다.");
                    } else {
                        alert("사용 가능한 ID 입니다.");
                    }
                },
                error: function() {
                    alert("요청 실패");
                }
            }); // ajax 끝
        } // else 끝
    }); // 버튼 클릭 이벤트 끝
    console.log("중복 확인 요청:", signupId);
}); // document.ready 끝