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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
	
	<h1>마이 페이지</h1>
	<div id="user_info">
		<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
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

					<td><a href="/userinfoedit">회원정보 수정</a></td>
					<td>영화의 신</td>
					<td>5000포인트</td>
					<td>1000시간</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="mycollection">
		<p><a href="/mypage/mycollection">나의 컬렉션</a></p>
		<div>
		<c:forEach var="item" items="${movielist}">
		<div class="collectionlist">
		<ul>
			<li><img src="${item.poster}" alt="${item.movieNm}포스터"></li>
			<li>${item.movieNm}</li>
			<li>${item.rank}</li>
		</ul>
		</div>
		</c:forEach>
		</div>
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
		<div id="statistics_table">
			별점분포표 테이블 넣는곳
		</div>
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
			<div>
				<ul>
					<li></li>
					<li>많이 준 별점</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="word_cloud">
		<p>영화 선호 태그</p>
		해시태크로 워드클라우드 만든거 넣는곳
	</div>
	
	<div id="fav_actor">
		<p>선호 배우</p>
		<div>
			<c:forEach var="item" items="${personinfolist}">
				<div>
					<ul>
						<li><img src="${item.person_pic}" alt="${item.peopleNm}사진"></li>
						<li>${item.peopleNm}, ${item.peopleCd}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_director">
		<p>선호 감독</p>
		<div>
			<c:forEach var="item" items="${ddd}">
				<div>
					<ul>
						<li><img src="${item.person_pic}" alt="${item.peopleNm}사진"></li>
						<li>${item.peopleNm}, ${item.peopleCd}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_genre">
		<p>영화 선호 장르</p>
		<div>
			<c:forEach var="item" items="${ddd}">
				<div>
					<ul>
						<li>${item.genre}</li>
						<li>${item.cnt}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="fav_nations">
		<p>영화 선호 국가</p>
		<div>
			<c:forEach var="item" items="${ddd}">
				<div>
					<ul>
						<li>${item.genre}</li>
						<li>${item.cnt}편</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>