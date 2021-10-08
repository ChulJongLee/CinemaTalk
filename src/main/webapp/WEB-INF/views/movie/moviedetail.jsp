<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/cssco/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/moviedetail.css">
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <!-- ******** 영화 정보 ********* -->
    <div id="movieview">
        <div id="movieinfotop">
            <ul id="movieinfotop2">
            	
                <%-- <c:if test="${detail.movieNmEn!=''}"> : ${detail.movieNmEn} </c:if> --%>
                <li><span id="movieNm">${detail.movieNm}   </span><span>평점 </span><span>인원</span></li>
                <li><span>${detail.openDt} </span><span>${detail.watchGradeNm}세 </span><span>${detail.showTm }분</span></li>
                <li><span>장르 : 
                				<c:forEach var="item" items="${detail.genres }">
									${item.genreNm } 
								</c:forEach></span></li>
                <li><span>출연진 : 
								<c:forEach var="item" items="${detail.actors }" end="4">
									<c:if test="${item.peopleNmEn!=''}" >
										${item.peopleNm }
									 </c:if>
								</c:forEach></span></li>
                <!-- <li><span><button type="button" class="btn btn-primary btn-sm">감상링크</button> <button type="button" class="btn btn-secondary btn-sm">관심목록+</button></span></li> -->
                
            </ul>
            <div class="starRating">
 				<input type="hidden" id="rate" name="rate" />
	 						  <span class="starR1 on"></span>
							  <span class="starR2"></span>
							  <span class="starR1"></span>
							  <span class="starR2"></span>
							  <span class="starR1"></span>
							  <span class="starR2"></span>
							  <span class="starR1"></span>
							  <span class="starR2"></span>
							  <span class="starR1"></span>
							  <span class="starR2"></span>
       		 </div>
        </div>
        <div id="movieimg">
            <img src="${detail.poster}" alt="포스터" width="200px">
        </div>
    </div>
	<input type="hidden" value="${detail.movieCd }" id="movieCd">
            	
	<!-- 아코디언 -->
	<div class="accordion accordion-flush" id="accordionFlushExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	        영화정보
	      </button>
	    </h2>
	    <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><%@ include file="movieinfo.jsp" %></div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	        리뷰
	      </button>
	    </h2>
	    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><%@ include file="/WEB-INF/views/board/reviewmain.jsp" %></div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	        참여게시판
	      </button>
	    </h2>
	    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><%@ include file="/WEB-INF/views/board/bestscenemain.jsp" %></div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingFour">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
	        자유게시판
	      </button>
	    </h2>
	    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><%@ include file="/WEB-INF/views/board/userforumlist.jsp" %></div>
	    </div>
	  </div>
	</div>
    <div id="endPoint"></div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="/resources/js/moviedetail.js"></script>
</body>
</html>