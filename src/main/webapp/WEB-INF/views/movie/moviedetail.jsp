<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="/resources/css/moviedetail.css">
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <!-- ******** 영화 정보 ********* -->
    <div id="moviedetail">
        <div id="movieinfotop">
	        <div id="movieimg" class="movieinfotop">
	            <img src="${detail.poster}" alt="포스터" id="poster">
	        </div>
	        
            <ul class="movieinfotop">
                <li class="info"><span id="movieNm">${detail.movieNm}   </span><span>평점 </span><span>인원</span></li>
                <li class="info"><span>${detail.openDt} </span><span>${detail.watchGradeNm}세 </span><span>${detail.showTm }분</span></li>
                <li class="info"><span>장르 : ${detail.genreNm }</span></li>
                <li class="info"><span>출연진 : 
								<c:forEach var="item" items="${personInfo }" end="5" varStatus="status">
									<c:if test="${item.repRoleNm=='배우' }">
										${item.peopleNm }<c:if test="${not status.last }">, </c:if>
									</c:if>
								</c:forEach></span></li>
                <!-- <li><span><button type="button" class="btn btn-primary btn-sm">감상링크</button> <button type="button" class="btn btn-secondary btn-sm">관심목록+</button></span></li> -->
                <li class="info">
	                <div class="starRating movieinfotop">
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
	       		 </li>
            </ul>
            
        </div>
        
    </div>
	<input type="hidden" value="${detail.movieCd }" id="movieCd">
            	
    <div class="container">
		 <div class="col-md-12 main" role="main">
		
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" id="tablelist" role="tablist">
			   <li role="presentation" class="active"><a href="#home2" aria-controls="home2" role="tab" data-toggle="tab">영화정보</a></li>
			   <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">리뷰</a></li>
			   <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">참여게시판</a></li>
			   <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">자유게시판</a></li>
			  </ul>
		
			  <!-- Tab panes -->
			  <div class="tab-content">
			   <div role="tabpanel" class="tab-pane active" id="home2"><%@ include file="movieinfo.jsp" %></div>
			   <div role="tabpanel" class="tab-pane" id="profile"><%@ include file="/WEB-INF/views/board/reviewmain.jsp" %></div>
			   <div role="tabpanel" class="tab-pane" id="messages"><%@ include file="/WEB-INF/views/board/bestscenemain.jsp" %></div>
			   <div role="tabpanel" class="tab-pane" id="settings"><%@ include file="/WEB-INF/views/board/userforumlist.jsp" %></div>
			  
			  </div>
			
			 </div>
			 <div class="col-md-9" role="main">
		 </div>
	</div>
 
    
	<!-- 아코디언 -->
	<%-- <div class="accordion accordion-flush" id="accordionFlushExample">
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
    <div id="endPoint"></div> --%>
    
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
<script src="/resources/js/moviedetail.js"></script>
</body>
</html>