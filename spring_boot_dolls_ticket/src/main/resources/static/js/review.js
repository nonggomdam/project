/**
 * 
 */
// ID 마스킹 함수
function maskId(id) {
    if (id.length > 4) {
        let visiblePart = id.substring(0, id.length - 4); // 마지막 4자리를 제외한 부분
        let maskedPart = "****"; // 마지막 4자리를 대체할 별표
        return visiblePart + maskedPart; // 마스킹된 ID 반환
    }
    return id;  // 4자 이하일 경우 마스킹하지 않음
}

// DOM이 로드된 후에 실행
document.addEventListener("DOMContentLoaded", function() {
    // 모든 writerId 요소에 대해 마스킹 처리
    const writerIds = document.querySelectorAll('.writerId');
    
    writerIds.forEach(function(writerIdElement) {
        let originalId = writerIdElement.textContent.trim();  // 원래 ID 값 가져오기
        let maskedId = maskId(originalId);  // 마스킹된 ID로 변경
        writerIdElement.textContent = maskedId;  // 마스킹된 ID를 HTML에 출력
    });
});

 // 바이트 계산 함수
function getByteLength(val) {
    let byteLength = 0;
    for (let i = 0; i < val.length; i++) {
        let char = val.charAt(i);
        if (escape(char).length > 4) {
            byteLength += 2; // 한글은 2바이트
        } else {
            byteLength += 1; // 영문, 숫자는 1바이트
        }
    }
    return byteLength;
}
$(document).on('click', '.star-box a', function(e){	
	e.preventDefault();
	var bigstar = $(this).index() + 1;
	$('#reviewScore').val(bigstar); // 선택된 별점 값을 hidden input에 저장
	$('.star-box a').removeClass('on');
	$(".star-box a img").attr("src","/image/icons8-star-48-off.png");
	for (var i = 0; i < bigstar; i++) {
		$('.star-box a').eq(i).addClass('on');
		$(".star-box a").eq(i).find("img").attr("src","/image/icons8-star-48-on.png");
	}
});
		
$(document).on('click', '#cancellation', function(e){	
	e.preventDefault();
	alert("관람후기 작성을 취소하시겠습니까?");
	history.go(0);
});

$(document).on('click', '#insertReview', function(e){	
    e.preventDefault();

    // 별점 선택 여부 검사
    if ($(".star-box a.on").length <= 0) {
        alert("별점을 선택해주세요.");
        return;
    }

    // 리뷰 내용 길이 검사
    const reviewMessage = $("#txtReview").val();
    if (getByteLength(reviewMessage) < 20) {
        alert("리뷰 내용은 최소 20바이트 이상이어야 합니다.");
        return;
    }
    
    $('#reviewForm').submit();
	    alert("후기를 성공적으로 등록했습니다.");
});

// 리뷰 삭제 버튼 클릭 이벤트
$(document).on('click', '.deleteReview', function(e) {
    e.preventDefault();
    var reviewId = $(this).data('review-id');
    
    if (confirm('정말 이 후기를 삭제하시겠습니까?')) {
        // AJAX 요청을 통해 리뷰를 삭제
        $.ajax({
            url: '/performance/deleteReview',
            type: 'POST',
            data: { reviewSeq: reviewId },
            success: function(response) {
                alert('후기가 성공적으로 삭제되었습니다.');
                location.reload(); // 삭제 후 페이지 리로드
            },
            error: function() {
                alert('후기 삭제에 실패했습니다.');
            }
        });
    }
});