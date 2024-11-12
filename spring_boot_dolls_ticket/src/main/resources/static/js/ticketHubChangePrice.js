$(document).ready(function() {
    // 체크박스에 change 이벤트 적용
    $('.chkbox').change(function() {
        sumAmount(); // 체크박스 상태 변경시 합계 계산
    });
    
    // 합계 계산 함수
    function sumAmount() {
        let sum = 0; // 합계 초기화

        // 체크된 항목들에 대해 가격을 합산
        $('.chkbox:checked').each(function() {
            // 해당 체크박스와 연결된 가격을 찾아서 가져오기
            let priceElement = $(this).closest('.show-item').find('.price');
            let price = priceElement.data('price');
            
            // 숫자로 변환 (콤마가 있으면 제거)
            price = Number(String(price).replace(/,/g, '')); 

            console.log("가져온 가격:", price); // 로그로 가격 확인
            
            sum += price; // 합산
        });

        // 합산 결과를 최종 결제 예정 금액에 표시
        $('.confirm-price').text(sum.toLocaleString() + '원');
    }
});