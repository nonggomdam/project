/**
 * 
 */
 
window.onload = function() {
    const emailButton = document.getElementById('emailButton');
    const phoneButton = document.getElementById('phoneButton');
    const emailGroup = document.getElementById('emailGroup');
    const phoneGroup = document.getElementById('phoneGroup');
    const form = document.forms['idfrm'];

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
            url: "/member/findId",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(foundIds) {
                const resultContainer = document.getElementById("resultContainer");
                resultContainer.innerHTML = ""; // 결과 초기화
                
                if (foundIds.length > 0) {
                    const list = document.createElement("ul");
                    foundIds.forEach(id => {
                        const listItem = document.createElement("li");
                        listItem.textContent = id;
                        list.appendChild(listItem);
                        
                    });
                    resultContainer.appendChild(list);
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
};