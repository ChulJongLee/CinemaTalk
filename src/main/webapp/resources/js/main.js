/**
 * 
 */
 var swiper = new Swiper(".banner", {
        slidesPerView: "auto",
        centeredSlides: true,
        spaceBetween: 5,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        loop : true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
        	  delay : 3000,   // 시간 설정
        	  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
        	},
      });

 var swiper = new Swiper(".mySwiper", {
        slidesPerView: 5,
        spaceBetween: 5,
        slidesPerGroup: 5,
        loop: true,
        loopFillGroupWithBlank: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });