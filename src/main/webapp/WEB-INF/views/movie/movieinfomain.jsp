<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/movieinfomain.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 영화정보 & 카테고리 -->
	<%@ include file="movieinfotop.jsp" %>
		
	
 <!-- 영화 정보 -->
	<section id="movieinfo">
		<!-- 영화 줄거리 -->
		<div id="moviesummary">
            <h3>줄거리</h3>
			<p>${detail.plotText }</p>		
		</div>

		<!-- 감독, 배우 -->	
		<div id="directorNactor">
			<!-- 감독 -->
			<div id="director">
                <h3>감독</h3>
                <p>데이미언 셔젤</p> 
			</div>
			<!-- 배우 -->
			<div id="actor">
                <h3>배우</h3>
                <p>라이언 고슬링</p><p>엠마 스톤</p><p>존 레전드</p><p>로즈마리 드윗</p><p>소노야 미즈노</p><p>제시카 로테</p><p>칼리 헤르난데스</p><p>톰 에버렛 스콧</p>
			</div>		
		</div>
		
		<!-- 영화 트레일러 -->
		<div id="trailer">
            <h3>트레일러</h3>
            <iframe width="760" height="415" src="https://www.youtube.com/embed/aGZPviLMo7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>		
	</section>
	
	
	<!-- ******** 푸터 ********* -->
	<%-- <%@ include file="footer.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>