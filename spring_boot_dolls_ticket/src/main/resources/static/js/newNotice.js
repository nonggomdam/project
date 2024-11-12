$(document).ready(function() {
    $("#newNoticeForm").on("submit", function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 방지

        // 입력 값 가져오기
        const noticeTitle = $("input[name='noticeTitle']").val().trim();
        const noticeType = $("select[name='noticeType']").val();
        const noticeContent = $("input[name='noticeContent']").val().trim();

        // 유효성 검사
        if (!noticeTitle) {
            alert("공지 제목을 입력해 주세요.");
            return;
        }
        if (!noticeType) {
            alert("공지 분류를 선택해 주세요.");
            return;
        }
        if (!noticeContent) {
            alert("공지 내용을 입력해 주세요.");
            return;
        }

        // AJAX 요청
        const formData = $(this).serialize(); // jQuery를 사용하여 폼 데이터를 직렬화

        $.ajax({
            url: $(this).attr("action"),
            type: "POST",
            data: formData,
            success: function(data) {
                alert("공지 사항이 성공적으로 등록되었습니다.");
                window.location.href = "<c:url value='/admin/noticeList'/>"; // 공지 사항 목록 페이지로 이동
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert("공지 사항 등록 중 오류가 발생했습니다.");
            }
        });
    });
});