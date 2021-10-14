<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Swiper demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="/resources/css/main.css">
<style>
@font-face { 
    font-family: 'EliceDigitalBaeum_Bold'; /* 엘리스디지털배움체B */
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Regular.woff') format('woff');

}
body{
	font-family: 'EliceDigitalBaeum_Bold', cursive;
}
</style>
</head>
<body>
	<!-- Swiper -->
	<div class="swiper banner">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img alt="배너1"
					src="https://movie-phinf.pstatic.net/20210820_154/16294355415011sxk1_JPEG/movie_image.jpg?type=m665_443_2">
			</div>
			<div class="swiper-slide">
				<img alt="배너2"
					src="https://movie-phinf.pstatic.net/20210924_2/1632449077013KE9W5_JPEG/movie_image.jpg?type=m665_443_2">
			</div>
			<div class="swiper-slide">
				<img alt="배너3"
					src="https://movie-phinf.pstatic.net/20210705_191/1625462967678XYlyf_JPEG/movie_image.jpg?type=m665_443_2">
			</div>
			<div class="swiper-slide">
				<img alt="배너4"
					src="https://movie-phinf.pstatic.net/20210915_137/1631690627955HnN99_JPEG/movie_image.jpg?type=m665_443_2">
			</div>
			<div class="swiper-slide">
				<img alt="배너5"
					src="https://movie-phinf.pstatic.net/20210930_157/1632994577361mfwoc_JPEG/movie_image.jpg?type=m665_443_2">
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>

	<!-- Swiper -->

	<div class="swiper mySwiper">
		<p class="swiper-title">박스 오피스 순위</p>
		<div class="swiper-wrapper">
			<c:forEach var="item" items="${dailyList}">
				<div class="swiper-slide"
					onclick="location.href='moviedetail/${item.movieCd }'">
					<img alt="포스터" src="${item.poster }"><br> <span
						class="col-10 text-truncate">${item.movieNm}</span>
					<div class="rank">${item.rank }</div>
				</div>

			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<!-- <div class="swiper-pagination"></div> -->
	</div>
	<div class="swiper mySwiper">
		<p class="swiper-title">평점 순위</p>
		<div class="swiper-wrapper">
			<c:forEach var="item" items="${rateList}">
				<div class="swiper-slide"
					onclick="location.href='moviedetail/${item.movieCd }'">
					<img alt="포스터" src="${item.poster }"><br> <span
						class="col-10 text-truncate">${item.movieNm}</span>
					<div class="rank">${item.rank }</div>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<div class="swiper mySwiper">
		<p class="swiper-title">최신 개봉 영화</p>
		<div class="swiper-wrapper">
			<c:forEach var="item" items="${openList}">
				<div class="swiper-slide"
					onclick="location.href='moviedetail/${item.movieCd }'">
					<img alt="포스터" src="${item.poster }"><br> <span
						class="col-10 text-truncate">${item.movieNm}</span>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<div class="swiper mySwiper" id="lastSwiper">
		<p class="swiper-title">랜덤 영화</p>
		<div class="swiper-wrapper">
			<c:forEach var="item" items="${randomList}">
				<div class="swiper-slide"
					onclick="location.href='moviedetail/${item.movieCd }'">
					<img alt="포스터" src="${item.poster }"><br> <span
						class="col-10 text-truncate">${item.movieNm}</span>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>



	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
</html>
