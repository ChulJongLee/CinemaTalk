<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/searchresult.css">
</head>
<body>
	<div id="boardWrap">
		<p class="resultCount">검색 결과 : ${keyword } (${fn:length(list) }) </p>
		<c:forEach var="item" items="${list}">
			<div onclick="location.href='moviedetail/${item.movieCd }'">
				
				<div class="movieList">
					<c:if test="${item.poster==''}"><img src="/resources/img/poster_noimg.png" alt="포스터" class="poster"></c:if>
	            	<c:if test="${item.poster!=''}"><img src="${item.poster}" alt="포스터" class="poster"></c:if>
	       
					<div>
						<p class="movieNm">${item.movieNm}</p>
						<p class="movieInfo">${item.watchGradeNm }세 이상 관람가</p>
						<p class="movieInfo">${item.genreNm }
							<c:if test="${item.repNationNm!='' && item.genreNm!='' }"> | </c:if>
							${item.repNationNm }
							<c:if test="${item.showTm!='' }"> | </c:if>
							${item.showTm}
							<c:if test="${item.showTm!='' }">분</c:if>
							<c:if test="${item.openDt!=null }"> | </c:if>
							${item.openDt}</p>
						<%-- <p>감독 :
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
						</p> --%>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
	
	</div>	
</body>
</html>