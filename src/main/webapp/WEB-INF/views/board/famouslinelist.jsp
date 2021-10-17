<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/famouslinelist.css">
</head>
<body>	

	 
	
	
	<!-- ******* 전체 명대사 ******* -->
	<section id="ufsection">
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
	
</body>
</html>