/**
 * 
 
 $(document).ready(function() {
    $(".info a").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 방지
        const performanceId = $(this).data("id");
        // 클릭 카운트를 증가시키는 요청 후 상세 페이지로 이동
        $.post(`/performance/click/${performanceId}`, function() {
            // 성공적으로 카운트 증가 후 상세 페이지로 이동
            window.location.href = "/admin/performanceDetailView/" + performanceId;
        }).fail(function() {
            alert("클릭 카운트 증가 실패");
        });
    });
});
 */
 
