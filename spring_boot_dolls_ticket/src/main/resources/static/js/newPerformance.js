/**
 * 
 */
$(document).ready(function() {
    $('#searchZipBtn').on('click', function() {
        searchAddress('performanceZipcode', 'performanceAddress', 'performanceDetailaddress');
    });
    
    // 이미지 파일 선택 시 미리 보기 및 삭제 버튼 표시
    $('#performancePoster').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#posterPreview').attr('src', e.target.result).show();
                $('#deletePosterBtn').show();
            };
            reader.readAsDataURL(file);
        }
    });
	$('#performanceInfoImg').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#infoPreview').attr('src', e.target.result).show();
                $('#deleteInfoBtn').show();
            };
            reader.readAsDataURL(file);
        }
    });
	// 삭제 버튼 클릭 시 미리 보기와 삭제 버튼 숨기기
	$('#deletePosterBtn').on('click', function() {
	    const posterInput = $('#performancePoster');
	    
	    if (posterInput.val()) {
	        posterInput.val(''); // 파일 입력 초기화
	        $('#posterPreview').hide(); // 미리 보기 숨기기
	        $(this).hide(); // 삭제 버튼 숨기기
	    }
	});
	
	$('#deleteInfoBtn').on('click', function() {
	    const infoInput = $('#performanceInfoImg');
	    
	    if (infoInput.val()) {
	        infoInput.val(''); // 파일 입력 초기화
	        $('#infoPreview').hide(); // 미리 보기 숨기기
	        $(this).hide(); // 삭제 버튼 숨기기
	    }
	});
    $('#newPerformanceForm').on('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);
        
        console.log('Performance Poster:', formData.get('performancePoster')); // 파일 확인
		console.log('Performance Info Image:', formData.get('performanceInfoImg'));
		
		// FormData에 포함된 내용을 확인
	    for (let [key, value] of formData.entries()) {
	        console.log(key, value);
	    }

        $.ajax({
            url: "/admin/insertPerformance",
            type: 'POST',
            enctype: "multipart/form-data", 
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                alert('공연 정보가 등록되었습니다.');
                window.location.href = "/admin/performanceList";
            },
            error: function(xhr, status, error) {
                alert('업로드 실패: ' + xhr.responseText);
            }
        });
    });
});