<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/movieinfotop.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

 <!-- ******** 영화 정보 ********* -->
<!--     <div id="movieview">
        <div id="movieinfotop">
            <ul id="movieinfotop2">
                <li><span>영화제목 </span><span>평점 </span><span>인원</span></li>
                <li><span>개봉일 </span><span>연령 </span><span>상영시간</span></li>
                <li><span>장르: </span></li>
                <li><span>출연진: </span></li>
                <li><span><button type="button" class="btn btn-primary btn-sm">감상링크</button> <button type="button" class="btn btn-secondary btn-sm">관심목록+</button></span></li>
                <li>별별별별</li>
            </ul>
        </div>
        <div id="movieimg">
            <img src="resources/img/movie_poster1.jpg" alt="라라랜드" width="200px">
        </div>
    </div> -->
    
    
        <div id="movieview">
	        <div id="movieinfotop">
	            <ul id="movieinfotop2">
	                <li><span>${detail.movieNm} : ${detail.movieNmEn} </span><span>평점 </span><span>인원</span></li>
	                <li><span>${detail.openDt} </span><span>${detail.watchGradeNm}세 </span><span>${detail.showTm }분</span></li>
	                <li><span>장르명 : 
	                        <c:forEach var="item" items="${detail.genres }">
	                           ${item.genreNm } 
	                        </c:forEach></span></li>
	                <li><span>출연배우 : 
	                        <c:forEach var="item" items="${detail.actors }" end="4">
	                           <c:if test="${item.peopleNmEn!=''}" >
	                              ${item.peopleNm }
	                            </c:if>
	                        </c:forEach></span></li>
	                <li><span><button type="button" class="btn btn-primary btn-sm">감상링크</button> <button type="button" class="btn btn-secondary btn-sm">관심목록+</button></span></li>
	                <li>별별별별</li>
	            </ul>
	        </div>
    	</div>  
    	
		
    <!-- ******** 카테고리 ******** -->
    <nav>
        <input type="button" value="영화정보" id="info" class="category">
        <input type="button" value="리뷰" id="review_board" class="category">
        <input type="button" value="참여게시판" id="best_board" class="category">
        <input type="button" value="자유게시판" id="user_forum" class="category">
    </nav>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="resources/js/movieinfo_categorybtn.js"></script>
</body>
</html>