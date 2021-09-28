<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/review_board.css">
</head>
<body>

	<%@ include file="header.jsp" %>

    <!-- 영화 정보 -->
    <div id="movieview">
        <div id="movieinfo">
            <ul id="movieinfo2">
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
    </div>

    <!-- 카테고리 -->
    <nav>
        <input type="button" value="기본정보" id="info" class="category">
        <input type="button" value="리뷰" id="review_board" class="category">
        <input type="button" value="참여게시판" id="best_worst_board" class="category">
        <input type="button" value="자유게시판" id="general_forum" class="category">
    </nav>

    <!-- 베스트 리뷰 -->
    <section id="bestsection">
        <a href="#"><h3>베스트 리뷰</h3></a>
        <div id="bestreview">
            <ul id="bestreview2">
                <li>
                    아이디, 날짜, 내용, 좋아요, 싫어요, 신고 => 2개씩, 3개도 될듯?
                </li>
            </ul>
        </div>
    </section>

    <!-- 일반 리뷰 -->
    <section id="generalsection">
        <a href="#"><h3>일반 리뷰</h3></a>
        <div id="generalreview">
            <ul id="generalreview2">
                <li>
                   	 아이디, 날짜, 내용, 좋아요, 싫어요, 신고
                </li>
            </ul>
        </div>
    </section>

    <!-- 리뷰 쓰기 -->
    <div id="writereview">
        <div class="mb-3">

            <label for="exampleFormControlTextarea1" class="form-label">리뷰 쓰기</label>

            <div class="form-check form-switch" id="form-switch">
                <label class="form-check-label" for="flexSwitchCheckDefault">스포일러 여부</label>
                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">            
            </div>

            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="width: 800px; margin-bottom: 5px;"></textarea>
            <div class="d-grid gap-2">
                <button class="btn btn-primary" type="button">리뷰 등록</button>
            </div>
        </div>
    </div>
    
	<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>