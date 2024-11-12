document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("joinForm");

    form.addEventListener("submit", function(event) {
        const signupId = document.getElementById("signupId").value; 
        const signupPwd = document.getElementById("signupPwd").value; 
        const signupPwwd = document.getElementById("signupPwwd").value; 
        const signupPhoneNumber = document.getElementById("signupPhoneNumber").value;
        const signupEmail = document.getElementById("signupEmail").value;

        const idPattern = /^[a-zA-Z0-9]{4,12}$/; // 4-12자의 영숫자
        const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/; // 최소 8자 최대 16자 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자
        const phonePattern = /^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$/; // 앞자리가 01이며 중간에 3~4자리, 세번째는 4자리인 전화번호
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/; // @가 포함되며 .뒤에 2글자 또는 세글자

        let valid = true; // 유효성 검사 플래그

        if (!idPattern.test(signupId)) {
            alert("아이디는 4-12자의 영숫자여야 합니다.");
            valid = false; // 유효성 검사 실패
        }

        if (!passwordPattern.test(signupPwd)) {
            alert("비밀번호는 최소 8자, 최대 16자이며, 영문자, 숫자, 특수문자를 포함해야 합니다.");
            valid = false; // 비밀번호 형식 검증 추가
        }
        
        if (!phonePattern.test(signupPhoneNumber)){
        	alert("휴대전화번호는 01x-xxxx-xxxx 패턴이여야 합니다.");
        	valid = false; // 유효성 검사 실패
        }
        
        if (!emailPattern.test(signupEmail)) {
        	alert("이메일 형식이 아닙니다.");
        	valid = false; // 유효성 검사 실패
        }

        if (signupPwd !== signupPwwd) {
            alert("비밀번호가 일치하지 않습니다.");
            valid = false; // 비밀번호 불일치
        }

        if (!valid) {
            event.preventDefault(); // 유효성 검사 실패 시 제출 방지
        }
    });
});