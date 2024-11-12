/**
 * 공연 상세 정보 페이지 이동
 */
$(document).ready(function() {
	$(".performanceRow").on("click", function() {
		var performanceId = $(this).attr("id");
		
		window.location.href = "/admin/performanceDetailView/" + performanceId;
	});
	$(".noticeRow").on("click", function() {
		var noticeNo = $(this).attr("id");
		
		window.location.href = "/admin/noticeDetailView/" + noticeNo;
	});
	$(".inquiryRow").on("click", function() {
		var inquiryId = $(this).attr("id");
		
		window.location.href = "/admin/inquiryResponseView/" + inquiryId;
	});
});