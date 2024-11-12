document.addEventListener("DOMContentLoaded", function() {
    // 폼과 입력값을 가져옵니다.
    const form = document.getElementById("joinForm");
    const signupId = document.getElementById("signupId");
    const signupPwd = document.getElementById("signupPwd");
    const signupPwwd = document.getElementById("signupPwwd");
    const signupPhoneNumber = document.getElementById("signupPhoneNumber");
    const signupEmail = document.getElementById("signupEmail");
    const signupZipCode = document.getElementById("signupZipCode");
    const signupAddress1 = document.getElementById("signupAddress1");
    const signupAddress2 = document.getElementById("signupAddress2");

    // 패턴 정의 (정규식)
    const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 4-12자의 영숫자
    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/; // 최소 8자 최대 16자, 대소문자, 숫자, 특수문자
    const phonePattern = /^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$/; // 전화번호 패턴
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/; // 이메일 패턴

    // 우편번호 검색 함수
    function searchPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddress = data.address; // 기본 주소
                var extraAddress = ''; // 추가 주소

                // 법정동 주소인 경우 추가 주소를 포함시킴
                if (data.addressType === 'R') {
                    if (data.bname !== '') {
                        extraAddress += data.bname;
                    }
                    if (data.buildingName !== '') {
                        extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddress += (extraAddress !== '' ? ' (' + extraAddress + ')' : '');
                }

                // 기본주소와 상세주소 입력란에 값 채우기
                signupAddress1.value = fullAddress;  // 기본 주소
                signupAddress2.focus();  // 상세 주소로 포커스 이동
                signupZipCode.value = data.zonecode;  // 우편번호
            }
        }).open();
    }

    // 폼 제출 이벤트 처리
    form.addEventListener("submit", function(event) {
        let valid = true; // 유효성 검사 플래그

        // 아이디 유효성 검사
        if (!idPattern.test(signupId.value)) {
            alert("아이디는 4-12자의 영숫자여야 합니다.");
            valid = false;
        }

        // 비밀번호 유효성 검사
        if (!passwordPattern.test(signupPwd.value)) {
            alert("비밀번호는 최소 8자, 최대 16자이며, 영문자, 숫자, 특수문자를 포함해야 합니다.");
            valid = false;
        }

        // 비밀번호 일치 여부 검사
        if (signupPwd.value !== signupPwwd.value) {
            alert("비밀번호가 일치하지 않습니다.");
            valid = false;
        }

        // 휴대전화번호 유효성 검사
        if (!phonePattern.test(signupPhoneNumber.value)) {
            alert("휴대전화번호는 01x-xxxx-xxxx 패턴이어야 합니다.");
            valid = false;
        }

        // 이메일 유효성 검사
        if (!emailPattern.test(signupEmail.value)) {
            alert("이메일 형식이 아닙니다.");
            valid = false;
        }

        // 우편번호, 주소 유효성 검사
        if (signupZipCode.value === "" || signupAddress1.value === "") {
            alert("주소를 정확하게 입력해주세요.");
            valid = false;
        }

        // 유효성 검사 실패 시 폼 제출 방지
        if (!valid) {
            event.preventDefault();
        }
    });

    // 우편번호 검색 버튼에 이벤트 리스너 추가
    const zipcodeSearchBtn = document.getElementById("zipcodeSearchBtn");
    if (zipcodeSearchBtn) {
        zipcodeSearchBtn.addEventListener("click", searchPostcode);
    }
});