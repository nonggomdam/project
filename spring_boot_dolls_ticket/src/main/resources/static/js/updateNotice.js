/**
 * 
 */
$(document).ready(function() {
    $('.resetBtn').on('click', function(event) {
        if (!confirm("정말 취소하겠습니까?")) {
            event.preventDefault();
        }
    });
    $('#updateNoticeForm).on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출을 막음

        // FormData 객체 생성
        const formData = new FormData(this);
        
        // 기존 값을 확인하여 FormData에 추가
       	const noticeTitle = $('input[name="noticeTitle"]').val();
       	const noticeType = $('input[name="noticeType"]').val();
       	const noticeContent = $('input[name="noticeContent"]').val();
		
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
		
		// FormData에 포함된 내용을 확인
	    const formData = $(this).serialize(); // jQuery를 사용하여 폼 데이터를 직렬화

        $.ajax({
            url: $(this).attr("action"),
            type: "POST",
            data: formData,
            success: function(data) {
                alert("공지 사항이 성공적으로 수정되었습니다.");
                window.location.href = "<c:url value='/admin/noticeList'/>"; // 공지 사항 목록 페이지로 이동
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert("공지 사항 수정 중 오류가 발생했습니다.");
            }
        });
    });
});