<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/header.css">
</head>
<body>

	<header>
		<div id="headerwrap">
			<div id="logo">
				<a href="#"> <img src="resources/img/SANAI.png" alt="logo" width="70px"></a>
			</div>
	
			<div id="home">
				<a href="#">홈</a>
			</div>
	
			<div id="category">
				<a href="#">카테고리</a>
			</div>
	
			<div id="search">
				<p>검색</p>
			</div>
	
			<div id="login">
				<c:if test="${user != null}"><a href="/logout">로그아웃</a></c:if>
				<c:if test="${user == null}"><a href="/login">로그인</a></c:if>
			</div>
		</div>
	</header>



</body>
</html>