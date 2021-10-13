<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/mypagemain.css">
</head>
<body>
	<!-- header -->
	<%@ include file="../header.jsp" %>
	
	
	<div id="mypage"><h1>마이 페이지</h1></div>
	
	<div id="user_info">
		<div class="p-wrapper"><p align="center"><b>나의 정보</b></p></div>
		<div id="userinfolist">
			<div>
				<div>사진</div>
				<div>${userdto.user_id}님</div>
				<div><a href="/mypage/modifyprofile">회원정보 수정</a></div>
			</div>
			<div>
				<div>포인트이미지</div>
				<div>${userdto.user_point}포인트</div>
			</div>
			<div>
				<div>시계이미지</div>
				<div>${watchHour}시간</div>
			</div>
			<div>회원등급 사용하나..?</div>
		</div>
<%-- 		<table>
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
		</table> --%>
	</div>
	
	<div id="myCollection">
		<div class="p-wrapper"><p align="center"><a href="/mypage/mycollection"><b>나의 컬렉션</b></a></p></div>
		<div id="collectionlist-wrapper">
		<c:forEach var="item" items="${movielist}">
			<div class="collectionlist" onclick="location.href='moviedetail/${item.movieCd}'">
				<img alt="포스터" src="${item.poster}" width="213px" height="300px"><br> 
				<div class="moviename">${item.movieNm}</div>
				<div class="rank"><img src="/resources/img/star1.png" alt="별" width="15px"> ${item.rank}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="myReview">
		<div class="p-wrapper"><p align="center"><a href="/mypage/myreview"><b>나의 리뷰</b></a></p></div>
		<div id="reviewlist-wrapper">
		<c:forEach var="item" items="${reviewlist}">
			<div class="reviewlist" onclick="location.href='reviewdetail/${item.contentno}'">
					<div class="movtitle"><b>${item.title}</b></div>
					<div class="revcontent">${item.contents}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="rate_statistics">
		<div class="p-wrapper"><p align="center"><b>별점 분포</b></p></div>
		<div id="canvas-wrapper"><canvas id="myChart" width="900px" height="300px"></canvas></div>
		<div id="rate">
			<div id="rateavg">
					<div><b>${ratedto.rate}</b></div>
					<div>별점 평균</div>
			</div>
			<div id="ratenum">
					<div><b>${ratedto.user_no}</b></div>
					<div>평가 수</div>
			</div>
		</div>
	</div>
	
	<div id="fav_actor">
		<div class="p-wrapper"><p align="center"><b>선호 배우</b></p></div>
		<div id="actor-wrapper">
		<c:forEach var="item" items="${actorinfolist}">
			<div class="actorlist" onclick="location.href='/personinfo/${item.peopleCd}'">
				<div class="personimg"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></div>
				<div class="personname">${item.peopleNm} - ${item.peopleNmEn}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_director">
		<div class="p-wrapper"><p align="center"><b>선호 감독</b></p></div>
		<div id="director-wrapper">
		<c:forEach var="item" items="${directorinfolist}">
			<div class="directorlist" onclick="location.href='/personinfo/${item.peopleCd}'">
				<div class="personimg"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></div>
				<div class="personname">${item.peopleNm} - ${item.peopleNmEn}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_genre">
		<div class="p-wrapper"><p align="center"><b>선호 장르</b></p></div>
		<div id="genre-wrapper">
		<c:forEach var="item" items="${genrelist}">
			<div class="genrelist">
				<div class="gernrename"><b>${item.genreNm}</b></div>
				<div class="genrenum">${item.rank}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_nations">
		<div class="p-wrapper"><p align="center"><b>선호 국가</b></p></div>
		<div id="nation-wrapper">
		<c:forEach var="item" items="${nationlist}">
			<div class="nationlist">
				<div class="nationname"><b>${item.repNationNm}</b></div>
				<div class="nationnum">${item.rank}편</div>
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
        				label: '평가 수',
        				fill: true,
        				data: [${arr[0]}, ${arr[1]}, ${arr[2]}, ${arr[3]}, ${arr[4]}, ${arr[5]}, ${arr[6]}, ${arr[7]}, ${arr[8]}, ${arr[9]}],
        				backgroundColor: 'gold',
        				borderColor: 'rgba(255, 206, 86, 1)',
        				borderWidth: 1
        			}]
        		},
        		options: {
        			legend: {
        				display: false
        			},
        			responsive: true,
        			scales: {
        				xAxes: [{
        					ticks:{
        						fontSize : 20
        					}
        				}],
        				yAxes: [{
        					ticks: {
        						beginAtZero: true,
        						stepSize : 10,
        						fontSize : 10
        					}
        				}]
        			},
        		}
        	});
        </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>