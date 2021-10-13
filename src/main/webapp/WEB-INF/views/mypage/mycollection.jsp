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
		<p><a href="/mypage/mycollection">나의 컬렉션</a></p>
		<div>
		<c:forEach var="item" items="${collectionlist}">
		<div class="collectionlist">
		<ul>
			<li><img src="${item.poster}" alt="${item.movieNm}포스터"></li>
			<li>${item.movieNm}</li>
			<li>${item.rank}</li>
		</ul>
		</div>
		</c:forEach>
		</div>
</body>
</html>