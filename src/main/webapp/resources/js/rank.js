/**
 * 
 */

// 일반 swiper 설정 예시
const slide = new Swiper('#test-slide', {
  slidesPerView : 'auto',
  spaceBetween : 6, 
})

// 변수에 담아서 활용 예시
var slideSetting = {
  slidesPerView : 'auto',
  spaceBetween : 6,
  loop : false,
  navigation: {   // 버튼 사용자 지정
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	}
}
const slide = new Swiper('#test-slide', slideSetting)