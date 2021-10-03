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
	<h1>영화디테일</h1>
				<%-- <c:forEach var="item" items="${dto}">
					<img src="${item.image}">
				</c:forEach><br> --%>
			<img alt="포스터" src="${detail.poster}">
			
			<p>${detail.movieNm} : ${detail.movieNmEn}</p>
			<p>${detail.openDt}  ${detail.watchGradeNm}     ${detail.showTm }</p>
			장르명 : <c:forEach var="item" items="${detail.genres }">
				${item.genreNm } 
			</c:forEach><br>
			출연배우 : 
			<c:forEach var="item" items="${detail.actors }" end="4">
				<c:if test="${item.peopleNmEn!=''}" >
					${item.peopleNm }
				 </c:if>
			</c:forEach>
			
			<p>평점 별 위치</p>
			<hr>
			줄거리
			<div>
				${detail.plotText }
			</div>
			
			<%-- 영화코드 : ${detail.movieCd}<br>
			
			제작연도 : ${detail.prdtYear}<br>
			<br>
			영화유형 : ${detail.typeNm}<br>
			상영시간 : ${detail.showTm }<br>
			<c:forEach var="item" items="${detail.nations }">
				제작국가 : ${item.nationNm}<br>
			</c:forEach>
			
			<c:forEach var="item" items="${detail.directors }">
				영화감독명(국문) : ${item.peopleNm }<br>
				영화감독명(영문) : ${item.peopleNmEn }<br>
			</c:forEach>
			
			<c:forEach var="item" items="${detail.actors }">
				<c:if test="${item.peopleNmEn!=''}" >
					배우명(국문) : ${item.peopleNm }<br>
				 	배우명(영문) : ${item.peopleNmEn }<br>
				 </c:if>
			</c:forEach>
			
			
			키워드 : 
			<c:forEach var="item" items="${detail.keywordlist }">
					${item } |
			</c:forEach><br>
			
				
		 	
			<c:forEach var="item" items="${detail.audits }">
			 	관람등급 명칭 :  ${item.watchGradeNm }<br>
			</c:forEach> --%>
</body>
</html>