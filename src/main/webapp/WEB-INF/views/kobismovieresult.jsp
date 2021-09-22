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
	<c:forEach var="item" items="${list}">
			영화코드 : ${item.movieCd}<br>
			영화명(국문) : ${item.movieNm}<br>
			영화명(영문) : ${item.movieNmEn}<br>
			제작연도 : ${item.prdtYear}<br>
			개봉일 : ${item.openDt}<br>
			영화유형 : ${item.typeNm}<br>
			대표 제작 국가 : ${item.repNationNm }<br>
			대표 장르명 : ${item.repGenreNm }<br>
			<hr>
	</c:forEach>
	<hr>
	<hr>
			<h1>영화디테일</h1>
				<c:forEach var="item" items="${dto}">
					<img src="${item.image}">
				</c:forEach>
			
			영화코드 : ${detail.movieCd}<br>
			영화명(국문) : ${detail.movieNm}<br>
			영화명(영문) : ${detail.movieNmEn}<br>
			제작연도 : ${detail.prdtYear}<br>
			개봉일 : ${detail.openDt}<br>
			영화유형 : ${detail.typeNm}<br>
			
			<c:forEach var="item" items="${detail.nations }">
				제작국가 : ${item.nationNm}<br>
			</c:forEach>
			<c:forEach var="item" items="${detail.genres }">
				장르명 : ${item.genreNm }<br>
			</c:forEach>
			<c:forEach var="item" items="${detail.directors }">
				영화감독명(국문) : ${item.peopleNm }<br>
				영화감독명(영문) : ${item.peopleNmEn }<br>
			</c:forEach>
			
				<c:forEach var="item" items="${detail.actors }">
					<c:if test="${item.peopleNmEn!=''}" >
						배우명(국문) : ${item.peopleNm }<br>
					 	배우명(영문) : ${item.peopleNmEn }<br>
				 	</c:if>
			 	</c:forEach>
		 	
			<c:forEach var="item" items="${detail.audits }">
			 	관람등급 명칭 :  ${item.watchGradeNm }<br>
			</c:forEach>
			 
		 	<hr>
	
</body>
</html>