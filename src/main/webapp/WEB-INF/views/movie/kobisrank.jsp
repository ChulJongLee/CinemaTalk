<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Swiper demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
 
	<link rel="stylesheet" href="/resources/css/kobisrank.css">

  <body>
	  <!-- Swiper -->
    <div class="swiper banner">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img alt="포스터" src="https://movie-phinf.pstatic.net/20210820_154/16294355415011sxk1_JPEG/movie_image.jpg?type=m665_443_2"></div>
        <div class="swiper-slide">Slide 2</div>
        <div class="swiper-slide">Slide 3</div>
        <div class="swiper-slide">Slide 4</div>
        <div class="swiper-slide">Slide 5</div>
        <div class="swiper-slide">Slide 6</div>
        <div class="swiper-slide">Slide 7</div>
        <div class="swiper-slide">Slide 8</div>
        <div class="swiper-slide">Slide 9</div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
	  
    <!-- Swiper -->
   <h3>박스 오피스 순위</h3>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
       <c:forEach var="item" items="${list}">
	     		 <div class="swiper-slide" onclick="location.href='moviedetail/${item.movieCd }'">
		    			<img alt="포스터" src="${item.poster }"><br>
		    			<span class="col-10 text-truncate">${item.movieNm}</span>
		    			<div class="rank">${item.rank }</div>
				</div>
				
			</c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <!-- <div class="swiper-pagination"></div> -->
    </div>
    <h3>평점 순위</h3>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
       <c:forEach var="item" items="${randomList}">
	     		 <div class="swiper-slide" onclick="location.href='moviedetail/${item.movieCd }'">
		    			<img alt="포스터" src="${item.poster }"><br>
		    			<span class="col-10 text-truncate">${item.movieNm}</span>
				</div>
			</c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
    <h3>내가 관심있는 영화</h3>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
       <c:forEach var="item" items="${randomList}">
	     		 <div class="swiper-slide" onclick="location.href='moviedetail/${item.movieCd }'">
		    			<img alt="포스터" src="${item.poster }"><br>
		    			<span class="col-10 text-truncate">${item.movieNm}</span>
				</div>
			</c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
	<h3>랜덤 영화</h3>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
       <c:forEach var="item" items="${randomList}">
	     		 <div class="swiper-slide" onclick="location.href='moviedetail/${item.movieCd }'">
		    			<img alt="포스터" src="${item.poster }"><br>
		    			<span class="col-10 text-truncate">${item.movieNm}</span>
				</div>
			</c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
    
    
    
    
    
    
    
    
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="/resources/js/kobisrank.js"></script>
    
  </body>
</html>
