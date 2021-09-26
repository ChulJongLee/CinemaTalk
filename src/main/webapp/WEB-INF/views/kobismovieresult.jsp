<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>영화리스트</h1>
	<c:forEach var="item" items="${list}">
		<a href="moviedetail/${item.movieCd }">
			<img alt="포스터" src="${item.poster}"><br>
			영화명(국문) : ${item.movieNm}<br>
			<%-- 영화명(영문) : ${item.movieNmEn}<br>
			제작연도 : ${item.prdtYear}<br>
			개봉일 : ${item.openDt}<br>
			영화유형 : ${item.typeNm}<br>
			대표 제작 국가 : ${item.repNationNm }<br>
			대표 장르명 : ${item.repGenreNm }<br> --%>
			
			<c:forEach var="item2" items="${item.directors }">
					감독명 : ${item2.peopleNm }
			</c:forEach>
		</a><br>
			<hr>
	</c:forEach>

	
</body>
</html>