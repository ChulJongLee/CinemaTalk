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
			박스오피스 종류 : ${item.movieCd}<br>
			박스오피스 조회 일자 : ${item.movieNm}<br>
			순번 : ${item.movieNmEn}<br>
			해당일자의 박스오피스 순위 : ${item.prdtYear}<br>
			영화의 대표코드 : ${item.openDt}<br>
			영화명(국문) : ${item.typeNm}<br>
			영화의 개봉일 : ${item.repNationNm}<br>
			해당일의 관객수 : ${item.repGenreNm}<br>
			<%-- <c:forEach var="item2" items="${item.directors }">
				감독 : ${item2 }
			</c:forEach>
			누적관객수 : ${item.companys}<br> --%>
			<hr>
	</c:forEach>
</body>
</html>