<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mypagemain.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="../header.jsp" %>
	
	
	<h1>마이 페이지</h1>
	<div id="user_info">
		<table>
			<thead>
				<tr>
					<th></th>
					<th>${userdto.user_id}</th>
					<th>${userdto.user_grade_no}</th>
					<th>${user_no}</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">프로필 사진</td>
					<td>이름</td>
					<td>등급이미지</td>
					<td>포인트이미지</td>
					<td>영화시청시간</td>
				</tr>
				<tr>

					<td><a href="/mypage/modifyprofile">회원정보 수정</a></td>
					<td>영화의 신</td>
					<td>${userdto.user_point}포인트</td>
					<td>${user.user_id}시간</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="swiper mycollection">
		<p class="swiper-title"><a href="/mypage/mycollection">나의 컬렉션</a></p>
		<div class="swiper-wrapper">
		<c:forEach var="item" items="${movielist}">
		<div class="swiper-slide" onclick="location.href='moviedetail/${item.movieCd}'">
			<img src="${item.poster}" alt="${item.movieNm}포스터"><br>
			<span class="col-10 text-truncate">${item.movieNm}</span>
			<div class="rank">${item.rank}</div>
		</div>
		</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	
	<div id="myreview">
		<p><a href="/mypage/myreview">나의 리뷰</a></p>
		<div>
		<c:forEach var="item" items="${reviewlist}">
		<div class="reviewlist">
		<ul>
			<li>${item.title}</li>
			<li>${item.contents}</li>
		</ul>
		</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="rate_statistics">
		<p>별점 분포</p>
		<c:forEach var="item" items="${ratelist}"> 
			${item.rate} / ${item.user_no}개<br>
		</c:forEach>
		<canvas id="myChart" width="900" height="300"></canvas>
		<div id="rate">
			<div>
				<ul>
					<li>${ratedto.rate}</li>
					<li>별점 평균</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>${ratedto.user_no}</li>
					<li>별점 개수</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="fav_actor">
		<p>선호 배우</p>
		<div>
			<c:forEach var="item" items="${actorinfolist}">
				<div>
					<ul>
						<li><a href="/personinfo/${item.peopleCd}"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></a></li>
						<li>${item.peopleNm}, ${item.peopleNmEn}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_director">
		<p>선호 감독</p>
		<div>
			<c:forEach var="item" items="${directorinfolist}">
				<div>
					<ul>
						<li><a href="/personinfo/${item.peopleCd}"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></a></li>
						<li>${item.peopleNm}, ${item.peopleNmEn}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_genre">
		<p>영화 선호 장르</p>
		<div>
			<c:forEach var="item" items="${genrelist}">
				<div>
					<ul>
						<li>${item.genreNm}</li>
						<li>${item.rank}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_nations">
		<p>영화 선호 국가</p>
		<div>
			<c:forEach var="item" items="${nationlist}">
				<div>
					<ul>
						<li>${item.repNationNm}</li>
						<li>${item.rank}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="../footer.jsp" %>

<script>
            var context = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(context, {
            	type: 'bar',
        		data: {
        			labels: ['0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0'],
        			datasets: [{
        				label: '나의 평점 통계',
        				fill: true,
        				data: [${arr[0]}, ${arr[1]}, ${arr[2]}, ${arr[3]}, ${arr[4]}, ${arr[5]}, ${arr[6]}, ${arr[7]}, ${arr[8]}, ${arr[9]}],
        				backgroundColor: [
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)',
        					'rgba(255, 206, 86, 0.2)'
        				],
        				borderColor: [
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)',
        					'rgba(255, 206, 86, 1)'

        				],
        				borderWidth: 1
        			}]
        		},
        		options: {
        			responsive: true,
        			scales: {
        				yAxes: [{
        					ticks: {
        						beginAtZero: true
        					}
        				}]
        			},
        		}
        	});
        </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>