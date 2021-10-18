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
			<div id="header_logo">
				<a href="/">CinemaTalk</a>
			</div>
			
			<div>
				<a href="/" class="headerBtn" id="homeBtn">홈</a>
			</div>
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle headerBtn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			  	  카테고리
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			    <li><a class="dropdown-item" href="/genre/drama">드라마</a></li>
			    <li><a class="dropdown-item" href="/genre/comedy">코미디</a></li>
			    <li><a class="dropdown-item" href="/genre/horror">공포(호러)</a></li>
			    <li><a class="dropdown-item" href="/genre/romance">멜로/로멘스</a></li>
			    <li><a class="dropdown-item" href="/genre/thriller">스릴러</a></li>
			  </ul>
			</div>
			
			
			<div>
				<c:if test="${user != null}"><a href="/mypage" class="headerBtn" id="myBtn">MY</a></c:if>
				<c:if test="${user == null}"><a href="/login" class="headerBtn">MY</a></c:if>
			
				
			</div>
			<div id="search">
				<form method="get" action="/searchresult" id="searchBar">
					<input type="text" id="header_keyword" name="keyword" placeholder="  영화명을 입력하세요.">
					<img alt="검색" src="/resources/img/search.png" onclick="document.getElementById('searchBar').submit();" id="header_searchBtn">
				</form>
			</div>
			
			<%-- <c:if test="${user != null}">
				<div id="header_mypage">
					<a href="/mypage"><img src="/resources/img/mypage.png" alt="마이페이지" id="header_mypageimg"></a>
				</div>
			</c:if> --%>
			
			<div id="header_login">
				<c:if test="${user.user_no==1 }"><a href="/report" class="loginbtn">신고</a></c:if>
				<c:if test="${user != null}"><a href="/logout" class="loginbtn">로그아웃</a></c:if>
				<c:if test="${user == null}">
					<a href="/login" class="loginbtn">로그인</a>
					<a href="/userjoin" class="loginbtn">회원가입</a>
				</c:if>
			</div>
		</div>
	</header>


</body>
</html>