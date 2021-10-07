<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/cssco/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/movieinfotop.css">
 
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
            	

    <!-- ******** 카테고리 ******** -->
    <div class="accordion" id="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		영화정보
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
     	<%@ include file="movieinfomain.jsp" %>   
	 </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       	리뷰
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <%@ include file="/WEB-INF/views/board/reviewmain.jsp" %>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		참여게시판
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<%@ include file="/WEB-INF/views/board/bestscenemain.jsp" %>
      </div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		자유게시판
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<%@ include file="/WEB-INF/views/board/userforumlist.jsp" %>
      </div>
    </div>
  </div>
</div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="/resources/js/movieinfotop.js"></script>
</body>
</html>