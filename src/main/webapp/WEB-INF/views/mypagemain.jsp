<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<p>나의 컬렉션</p>
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
					<td>포스터1</td>
					<td>포스터2</td>
					<td>포스터3</td>
					<td>포스터4</td>
					<td>포스터5</td>
				</tr>
				<tr>
					<td>별점</td>
					<td>별점</td>
					<td>별점</td>
					<td>별점</td>
					<td>별점</td>
				</tr>
				<tr>
					<td>영화명1</td>
					<td>영화명2</td>
					<td>영화명3</td>
					<td>영화명4</td>
					<td>영화명5</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="myreview">
		<p>나의 리뷰</p>
		<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>리뷰1</td>
					<td>리뷰2</td>
					<td>리뷰3</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="rate_statistics">
		<p>별점 분포</p>
		<div id="statistics_table">
			별점분포표 테이블 넣는곳
		</div>
		<table>
			<thead>
				<tr><th></th><th></th><th></th></tr>
			</thead>
			<tbody>
				<tr><td></td><td></td><td></td></tr>
				<tr><td>별점평균</td><td>평가수</td><td>많이 준 평점</td></tr>
			</tbody>
		</table>
	</div>
	<div id="word_cloud">
		<p>영화 선호 태그</p>
		해시태크로 워드클라우드 만든거 넣는곳
	</div>
	<div id="fav_actor">
		<p>선호 배우</p>
		<table>
			<thead>
				<tr><th></th><th></th><th></th><th></th><th></th><th></th></tr>
			</thead>
			<tbody>
				<tr><td>사진1</td><td>배우1</td><td>사진2</td><td>배우2</td><td>사진3</td><td>배우3</td></tr>
			</tbody>
		</table>
	</div>
	<div id="fav_director">
		<p>선호 감독</p>
		<table>
			<thead>
				<tr><th></th><th></th><th></th><th></th><th></th><th></th></tr>
			</thead>
			<tbody>
				<tr><td>사진1</td><td>감독1</td><td>사진2</td><td>감독2</td><td>사진3</td><td>감독3</td></tr>
			</tbody>
		</table>
	</div>
	<div id="fav_genre">
		<p>영화 선호 장르</p>
		<table>
			<thead>
				<tr><th></th><th></th><th></th></tr>
			</thead>
			<tbody>
				<tr><td>장르1</td><td>장르2</td><td>장르3</td></tr>
				<tr><td>1편</td><td>2편</td><td>3편</td></tr>
			</tbody>
		</table>
	</div>
	<div id="fav_nations">
		<p>영화 선호 국가</p>
		<table>
			<thead>
				<tr><th></th><th></th><th></th></tr>
			</thead>
			<tbody>
				<tr><td>국가1</td><td>국가2</td><td>국가3</td></tr>
				<tr><td>1편</td><td>2편</td><td>3편</td></tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>