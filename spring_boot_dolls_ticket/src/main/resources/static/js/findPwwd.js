/**
 * 
 */
 
 document.addEventListener("DOMContentLoaded", function() {
    const emailButton = document.getElementById('emailButton');
    const phoneButton = document.getElementById('phoneButton');
    const emailGroup = document.getElementById('emailGroup');
    const phoneGroup = document.getElementById('phoneGroup');
    const form = document.getElementById('findPwdForm');

    emailButton.addEventListener('click', () => {
        emailGroup.style.display = 'block';
        phoneGroup.style.display = 'none';
        document.querySelector('input[name="phone"]').required = false;
        document.querySelector('input[name="email"]').required = true;
    });

    phoneButton.addEventListener('click', () => {
        emailGroup.style.display = 'none';
        phoneGroup.style.display = 'block';
        document.querySelector('input[name="email"]').required = false;
        document.querySelector('input[name="phone"]').required = true;
    });

    form.addEventListener("submit", function(event) {
        event.preventDefault();

        const name = form.name.value;
        const email = emailGroup.style.display === "block" ? form.email.value : null;
        const phone = phoneGroup.style.display === "block" ? form.phone.value : null;

        const data = { name, email, phone };

        $.ajax({
            type: "POST",
            url: "/member/findPwd",  // URL 경로 수정
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(foundIds) {
                const resultContainer = document.getElementById("resultContainer");
                resultContainer.innerHTML = ""; // 결과 초기화

                if (foundIds.length > 0) {
                    // 아이디가 발견되면 비밀번호 재설정 입력란 보여주기
                    const resetPasswordDiv = document.createElement("div");
                    resetPasswordDiv.innerHTML = `
                        <h3>새 비밀번호 입력</h3>
                        <input type="password" id="newPassword" placeholder="새 비밀번호" required>
                        <input type="password" id="confirmPassword" placeholder="비밀번호 확인" required>
                        <button id="resetPasswordButton">비밀번호 재설정</button>
                    `;
                    resultContainer.appendChild(resetPasswordDiv);

                    document.getElementById("resetPasswordButton").addEventListener("click", function() {
                        const newPassword = document.getElementById("newPassword").value;
                        const confirmPassword = document.getElementById("confirmPassword").value;

                        if (newPassword === confirmPassword) {
                            // 비밀번호 재설정 요청
                            $.ajax({
                                type: "POST",  
                                url: "/member/resetPassword",  // URL 경로 수정
                                contentType: "application/json",
                                data: JSON.stringify({ name, email, newPassword }),
                                success: function() {
                                    alert("비밀번호가 성공적으로 재설정되었습니다.");
                                    resultContainer.innerHTML = ""; // 결과 초기화
                                },
                                error: function(xhr, status, error) {
                                    console.error("Error:", error);
                                    alert("비밀번호 재설정 중 오류가 발생했습니다.");
                                }
                            });
                        } else {
                            alert("비밀번호가 일치하지 않습니다.");
                        }
                    });
                } else {
                    resultContainer.innerHTML = "<p>일치하는 아이디가 없습니다.</p>";
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    });
});