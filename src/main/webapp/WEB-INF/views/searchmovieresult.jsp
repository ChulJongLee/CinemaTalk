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
	<c:forEach var="item" items="${dto}">
			<img src="${item.image}">
			제목 : ${item.title}
			부제 : ${item.subtitle}
			제작연도 : ${item.pubDate}
			감독 : ${item.director}
		<c:forEach var="item2" items="${list}">
			배우 : ${item2}
		</c:forEach>
	</c:forEach>
	

</body>
</html>