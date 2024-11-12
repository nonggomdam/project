/**
 * 
 */
$(document).ready(function() {
	// 포스터 미리 보기
    $('#performancePoster').on('change', function(event) {
        previewImage(event, '#posterPreview');
    });

    // 정보 이미지 미리 보기
    $('#performanceInfoImg').on('change', function(event) {
        previewImage(event, '#infoPreview');
    });

    // 이미지 미리 보기 함수
    function previewImage(event, previewElement) {
        const reader = new FileReader();
        reader.onload = function(e) {
            $(previewElement).attr('src', e.target.result).show();
            $(previewElement).siblings('.deleteImageBtn').show();
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    // 이미지 삭제 버튼 이벤트
    $('.deleteImageBtn').on('click', function() {
        const inputFile = $(this).siblings('input[type="file"]');
        const previewImg = $(this).siblings('img');
        inputFile.val('');  // 파일 선택 초기화
        previewImg.attr('src', '').hide();  // 미리 보기 숨기기 및 초기화
        $(this).hide();     // 삭제 버튼 숨기기
    });
    
    $('.resetBtn').on('click', function(event) {
        if (!confirm("정말 취소하겠습니까?")) {
            event.preventDefault();
        }
    });
    $('#updatePerformanceForm').on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출을 막음

        // FormData 객체 생성
        const formData = new FormData(this);
        
        // 기존 값을 확인하여 FormData에 추가
        const performanceDate1 = $('input[name="performanceDate1"]').val();
        const performanceDate2 = $('input[name="performanceDate2"]').val();
        const reservationOpenExpectedDate = $('input[name="reservationOpenExpectedDate"]').val();
        const newPerformanceDate1 = $('#newPerformanceDate1').val();
        const newPerformanceDate2 = $('#newPerformanceDate2').val();
        const newReservationOpenExpectedDate = $('#newReservationOpenExpectedDate').val();
        
        console.log('Performance Poster:', formData.get('performancePoster')); // 파일 확인
		console.log('Performance Info Image:', formData.get('performanceInfoImg'));
		console.log('Performance Date1 : ', formData.get('performanceDate1'));
		
		// 새로 입력된 날짜가 있다면 해당 값을 FormData에 추가
        if (newPerformanceDate1) {
            formData.set('performanceDate1', newPerformanceDate1);
        } else {
            formData.set('performanceDate1', performanceDate1); // 기존 값 유지
        }

        if (newPerformanceDate2) {
            formData.set('performanceDate2', newPerformanceDate2);
        } else {
            formData.set('performanceDate2', performanceDate2); // 기존 값 유지
        }
        
        if (newPerformanceDate2) {
            formData.set('reservationOpenExpectedDate', newReservationOpenExpectedDate);
        } else {
            formData.set('reservationOpenExpectedDate', reservationOpenExpectedDate); // 기존 값 유지
        }
		
		// FormData에 포함된 내용을 확인
	    for (let [key, value] of formData.entries()) {
	        console.log(key, value);
	    }

        // AJAX 요청
        $.ajax({
            url: $(this).attr('action'), // 폼의 action 속성에서 URL 가져오기
            type: 'POST', 
            enctype: "multipart/form-data",
            data: formData, 
            processData: false, 
            contentType: false, 
            success: function(response) {
                alert('공연 정보가 수정되었습니다.');
                window.location.href = "/admin/performanceList";
            },
            error: function(xhr, status, error) {
                // 오류 처리
                alert('수정 중 오류가 발생했습니다: ' + error);
            }
        });
    });
});