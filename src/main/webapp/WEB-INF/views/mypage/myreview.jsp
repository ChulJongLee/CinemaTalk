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
</body>
</html>