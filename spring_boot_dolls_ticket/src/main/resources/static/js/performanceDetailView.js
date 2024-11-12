$(document).ready(function() {
    $(".info a").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 방지
        
        const performanceId = $(this).data("id");
        console.log("Performance ID:", performanceId);

        // 클릭 카운트를 증가시키는 요청
        $.post(`/performance/click/${performanceId}`, function() {
            console.log("AJAX 호출 성공");
            // 클릭 카운트 증가가 성공하면 상세 페이지로 이동
            window.location.href = "/admin/performanceDetailView/" + performanceId;
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX 호출 실패:", textStatus, errorThrown);
            alert("서버 오류 발생");
            // AJAX 호출이 실패하면 페이지 이동을 하지 않음
        });
    });
});