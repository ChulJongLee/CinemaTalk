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