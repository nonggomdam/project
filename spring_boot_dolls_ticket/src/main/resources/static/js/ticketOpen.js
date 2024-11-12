/**
 * 티켓 오픈 타이머 기능
 */
 
 document.addEventListener('DOMContentLoaded', () => {
    
 	const ticketOpenBtn = document.getElementById('ticketOpenBtn');
	const performanceId = document.getElementById('performanceId').value; 
    
 	// 이벤트 상태를 확인하는 함수
     function checkEventStatus() {
        fetch(`/api/check-event?performanceId=${performanceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답에 문제가 있습니다.');
                } 
                return response.json();
            })
            .then(data => {
           		data.targetDate = new Date(data.targetDate);
                console.log('Received data:', data);
                if (data.isOpen) {
                    ticketOpenBtn.disabled = false;
                    ticketOpenBtn.textContent = '예매하기';
                    clearInterval(timer); // 타이머 중지
                    
                    $(document).ready(function() {
				        $('#ticketOpenBtn').on('click', function() {
				            var userConfirmed = confirm(" 좌석예약 페이지로 이동하시겠습니까?");
				            
				            if (userConfirmed) {
				                // 사용자가 "예"를 눌렀을 때 페이지 이동
				                window.location.href = '/performance/dateReservation/${performance.performanceId}'; // 원하는 URL로 변경
				            } else {
				                // 사용자가 "아니오"를 눌렀을 때 별도의 동작을 하지 않음
				                alert("정보를 다시 확인해주세요");
				            }
				        });
				    });
                    
                } else {
                    // 남은 시간 계산
                    const targetDate = new Date(data.targetDate);
                    const now = new Date();
                    console.log(targetDate);
                    console.log(now);
                    const remainingTime = targetDate - now;

                    if (remainingTime <= 30 * 60 * 1000 && remainingTime > 0) { // 남은시간이 30분 이하이면 남은시간 표시
        		   		const minutes = Math.floor((remainingTime / (1000 * 60)) % 60);
         				const seconds = Math.floor((remainingTime / 1000) % 60);
        			    ticketOpenBtn.textContent = `남은시간 ${minutes}분 ${seconds}초`;
                    } else if(remainingTime > 30 * 60 * 1000){
                    	const options = {month: '2-digit', day: '2-digit', hour: 'numeric', minute: '2-digit'};
			            const formattedDate = targetDate.toLocaleString('ko-KR', options).replace(',', '');
			            ticketOpenBtn.textContent = `${formattedDate} 오픈`;
                    } else {
                        ticketOpenBtn.disabled = false;
                        ticketOpenBtn.textContent = '예매하기';
                        clearInterval(timer); // 타이머 중지
                    }
                }
            })
            .catch(error => {
                console.error('이벤트 상태를 확인하는 중 오류 발생:', error);
                ticketOpenBtn.textContent = '이벤트 로딩 오류';
            });
    }

    // 초기 이벤트 상태 확인
    checkEventStatus();

    // 타이머 설정: 매초마다 이벤트 상태 확인
    const timer = setInterval(checkEventStatus, 1000);
    

//------------------------------------------------------------------------------------------------------
	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

	const address = document.getElementById('performanceLocationId').value;

	let mapCenter;
	
	if (address === "SE0000001") {
	    mapCenter = new kakao.maps.LatLng(37.5147044, 127.1275107); // 올림픽공원 올림픽홀 좌표
	} else if (address === "SE0000002") {
	    mapCenter = new kakao.maps.LatLng(37.5107077, 127.0998494); // 샤롯데씨어터 좌표
	} else {
	    mapCenter = new kakao.maps.LatLng(37.5147044, 127.1275107); // 기본 좌표 (원하는 기본 좌표로 설정)
	}
	
	const options = { // 지도를 생성할 때 필요한 기본 옵션
	    center: mapCenter, // 지도의 중심좌표를 조건에 따라 설정
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	};
	
	const map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
	
	// 마커가 표시될 위치를 지도의 중심좌표로 설정
	const markerPosition = mapCenter;
	
	// 마커를 생성합니다
	const marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
//------------------------------------------------------------------------------------------------------
    var reviewLoc = $('.write').offset();
   	$('#goReview').click(function(){
    	$('html, body').animate({scrollTop:reviewLoc.top},0);
        return false;
    });
 });
 
 