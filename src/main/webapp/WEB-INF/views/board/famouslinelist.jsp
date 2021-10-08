<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/famouslinelist.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>	

	 
	
	
	<!-- ******* 전체 명대사 ******* -->
	<section>
		<div id="allreview">
		 <c:if test="${allfamousline==null }">              		
	        	자료가 없습니다.
	     </c:if>
		 <c:if test="${allfamousline!=null }">
			 <ul id="contentslist">
				<c:forEach var="list" items="${allfamousline }">
					<li id="contents">
						<div id="id">${list.userid }id</div>
						<div id="date">${list.writedate }</div>
						<div id="content">${list.contents }</div>
						<div id="like"><i class="fas fa-thumbs-up"> ${list.like }</i></div>
						<div id="dislike"><i class="fas fa-thumbs-down"> ${list.dislike }</i></div>
						<div id="report"><button> <i class="fas fa-flag"> 신고</i></button></div>						
					</li>		
				</c:forEach>
			</ul>
		 </c:if>
		</div>
	</section>
	
	
	<!-- 페이징  -->
<nav aria-label="...">
	<ul class="pagination">	
	
		<!-- 이전 버튼 -->		  
		<c:if test="${page.prev == false}">		
			<li class="page-item disabled">
		      <a class="page-link" href="famouslinelist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.prev == true}">		
			<li class="page-item">
		      <a class="page-link" href="famouslinelist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
		    </li>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
			<c:if test="${index==page.currPage }">
				<li class="page-item active" aria-current="page">
		      		<a class="page-link" href="#"><c:out value="${index }"/></a>
		    	</li>				
			</c:if>
			<c:if test="${index!=page.currPage }">
				<li class="page-item" aria-current="page">
			      <a class="page-link" href="famouslinelist?currPage=${index }&search=${search}&searchtxt=${searchtxt}"><c:out value="${index }"/></a>
			    </li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:if test="${page.next == false}">
			<li class="page-item disabled">
		      <a class="page-link" href="famouslinelist?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.next == true}">
			<li class="page-item">
		      <a class="page-link" href="famouslinelist?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>		
  	</ul>
</nav>	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>