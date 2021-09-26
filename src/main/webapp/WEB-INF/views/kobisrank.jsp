<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</head>
<body>
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/resources/image/black.jpg" class="d-block w-100" alt="검은배경1">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>First slide label</h5>
	        <p>Some representative placeholder content for the first slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/image/black.jpg" class="d-block w-100" alt="검은배경2">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Second slide label</h5>
	        <p>Some representative placeholder content for the second slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/image/black.jpg" class="d-block w-100" alt="검은배경3">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>

	<div class="row">
		<p>영화순위</p>
	
		<c:forEach var="item" items="${list}">
			<div>
				<a href="moviedetail/${item.movieCd }">
						<div style="background-color: yellow; width: 150px; height: 200px"></div>
						<!-- <img alt="포스터" src="imsi" width="150px" height="200px"> -->
						<%-- 해당일자의 박스오피스 순위 : ${item.rank}<br>
						영화의 개봉일 : ${item.openDt}<br>
						누적관객수 : ${item.audiAcc}<br>
						해당일의 관객수 : ${item.audiCnt}<br> --%>
						<div class="col-2 text-truncate">${item.movieNm}<br></div>
				</a>
			</div>
		</c:forEach>
	</div>
	
	 <script src="js/rank.js"></script> 
	
</body>
</html>