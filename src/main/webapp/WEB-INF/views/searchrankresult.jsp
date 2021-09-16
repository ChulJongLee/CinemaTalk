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
			해당일자의 박스오피스 순위 : ${item.rank}<br>
			영화의 개봉일 : ${item.openDt}<br>
			누적관객수 : ${item.audiAcc}<br>
			해당일의 관객수 : ${item.audiCnt}<br>
			영화명(국문) : ${item.movieNm}<br>
			<hr>
	</c:forEach>
</body>
</html>