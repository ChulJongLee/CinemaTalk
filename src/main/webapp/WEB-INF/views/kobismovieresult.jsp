<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/searchlist.css">
</head>
<body>
	<div id="boardWrap">
		<h1>영화리스트</h1>
		
		<c:forEach var="item" items="${list}">
			<div onclick="location.href='moviedetail/${item.movieCd }'">
				<div class="poster">
				<img alt="포스터" src="${item.poster}">
				</div>
				<div class="movieInfo">
					<h1>${item.movieNm}</h1>
					<p>${item.movieCd }</p>
					<p>${item.watchGradeNm }</p>
					<p>${item.repGenreNm } | ${item.repNationNm } | ${item.showTm}분 | ${item.openDt}</p>
					<p>감독 :
					<c:forEach var="item2" items="${item.directors }">
							${item2.peopleNm }
					</c:forEach>
					</p>
					<p class="d-inline-block text-truncate" style="max-width: 1000px;">배우 : 
					<c:forEach var="item2" items="${item.actors }">
						<c:if test="${item2.peopleNmEn!=''}" >
							${item2.peopleNm } |
						 </c:if>
						 
					</c:forEach>
					</p>
					줄거리 : ${item.plotText } <br>
					키워드 : 
					<c:forEach var="item2" items="${item.keywordlist }">
						${item2 } |
					</c:forEach><br>
				</div>
			</div>
			<hr>
		</c:forEach>
	
	</div>	
</body>
</html>