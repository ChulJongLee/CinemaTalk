<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/header.css">
<style>
@font-face { 
    font-family: 'EliceDigitalBaeum_Bold'; /* 엘리스디지털배움체B */
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'EliceDigitalBaeum_Bold', cursive;
}
</style>
</head>
<body>

	<header>
		<div id="headerwrap">
			<div id="header_logo">
				<a href="/cinematalk">CinemaTalk</a>
			</div>
	
			<div id="search">
				<form method="post" action="/searchresult" id="searchBar">
					<input type="text" id="header_keyword" name="keyword" placeholder="영화명을 입력하세요.">
					<img alt="검색" src="/resources/img/search.png" onclick="document.getElementById('searchBar').submit();" id="header_searchBtn">
				</form>
			</div>
			
			<c:if test="${user != null}">
				<div id="header_mypage">
					<a href="/mypage"><img src="/resources/img/mypage.png" alt="마이페이지" id="header_mypageimg"></a>
				</div>
			</c:if>
			
			<div id="header_login">
				<c:if test="${user != null}"><a href="/logout">로그아웃</a></c:if>
				<c:if test="${user == null}"><a href="/login">로그인</a></c:if>
			</div>
		</div>
	</header>



</body>
</html>