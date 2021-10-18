<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화정보</title>
 <link rel="stylesheet" href="/resources/css/moviedetail.css">
</head>
<body>
 <!-- ******** 영화 정보 ********* -->
    <div id="moviedetail">
        <div id="movieinfotop">
	        <div id="movieimg" class="movieinfotop">
	        	<c:if test="${detail.poster==''}"><img src="/resources/img/poster_noimg.png" alt="포스터" class="poster"></c:if>
	            <c:if test="${detail.poster!=''}"><img src="${detail.poster}" alt="포스터" class="poster"></c:if>
	        </div>
	        
            <ul class="movieinfotop">
                <li class="info"><span id="movieNm">${detail.movieNm}   </span><span><img src="/resources/img/star1.png" alt="별" id="star1">${detail.rate }</span></li>
                <li class="info">
	                <span>${detail.openDt}<c:if test="${detail.openDt!=null && detail.watchGradeNm!='' }"> | </c:if></span>
	                <span>${detail.watchGradeNm}<c:if test="${detail.watchGradeNm!=''}">세 | </c:if></span>
	                <span>${detail.showTm }<c:if test="${detail.showTm!='' }">분</c:if></span>
                </li>
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
	 					<c:forEach var="cnt" begin="1" end="${rate }">
	 						<c:if test="${cnt%2==1 }"><span class="starR1 on"></span></c:if>
	 						<c:if test="${cnt%2==0 }"><span class="starR2 on"></span></c:if>
	 					</c:forEach>
	 					<c:forEach var="cnt"  begin="${rate+1 }" end="10">
	 						<c:if test="${cnt%2==1 }"><span class="starR1"></span></c:if>
	 						<c:if test="${cnt%2==0 }"><span class="starR2"></span></c:if>
	 					</c:forEach>
		 						  
	       		 	</div>
	       		 </li>
            </ul>
            
        </div>
        
   
	<input type="hidden" value="${detail.movieCd }" id="movieCd">
    <hr>        	
    <div class="container">
		 <div class="col-md-12 main" role="main">
		
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" id="tablelist" role="tablist">
			   <li role="presentation" class="active"><a href="#home2" aria-controls="home2" role="tab" data-toggle="tab">영화정보</a></li>
			   <li class="blank_li"></li>
			   <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">리뷰</a></li>
			   <li class="blank_li"></li>
			  <!--  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">참여게시판</a></li>
			   <li class="blank_li"></li> -->
			   <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">자유게시판</a></li>
			  </ul>
		
			  <!-- Tab panes -->
			  <div class="tab-content">
			   <div role="tabpanel" class="tab-pane active" id="home2"><%@ include file="movieinfo.jsp" %></div>
			   <div role="tabpanel" class="tab-pane" id="profile"><%@ include file="/WEB-INF/views/board/reviewmain.jsp" %></div>
			   <%-- <div role="tabpanel" class="tab-pane" id="messages"><%@ include file="/WEB-INF/views/board/bestscenemain.jsp" %></div> --%>
			   <div role="tabpanel" class="tab-pane" id="settings"><%@ include file="/WEB-INF/views/board/userforumMain.jsp" %></div>
			  
			  </div>
			
			 </div>
			 <div class="col-md-9" role="main">
		 </div>
	</div>
  </div>
    <!-- 부트스트랩 버전이 달라서 지우면 안됨 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
	<script src="/resources/js/moviedetail.js"></script>
</body>
</html>