/**
 * 
 */
var swiper = new Swiper(".mySwiper", {
      slidesPerView: 4,
      spaceBetween: 30,
      loop: true,
	  autoplay: {
		delay: 3000,
		disableOnInteraction: false
	},
      navigation: {
			nextEl: '.swiper-button-next.m2-kvs',
			prevEl: '.swiper-button-prev.m2-kvs',
		},

    });