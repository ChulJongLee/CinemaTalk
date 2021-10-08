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
 <link rel="stylesheet" href="resources/css/reviewall.css">
</head>
<body>
	
	<!-- ******* 전체 리뷰 ******* -->
	<section>
		<div id="allreview">
		 <c:if test="${allreview==null }">              		
	        	자료가 없습니다.
	     </c:if>
		 <c:if test="${allreview!=null }">
		 	<ul id="contentslist">
				<c:forEach var="list" items="${allreview }">
					<li id="contents">
						<div id="id">${list.userid }id</div>
						<div id="date">${list.writedate }</div>
						<div id="content">${list.contents }</div>
						<div id="like"><i class="fas fa-thumbs-up"> ${list.like }</i></div>
						<div id="dislike"><i class="fas fa-thumbs-down"> ${list.dislike }</i></div>
						<div id="report"><i class="fas fa-flag"> 신고</i></div>					
					</li>		
				</c:forEach>
			</ul>
		 </c:if>
		</div>
		<div id="writebtn">
			<button type="button" class="btn btn-outline-primary">글쓰기</button>
		</div>

	<!-- 	
		<form method="get" action="list">
			<select name="search">
				<option value="userno">닉네임</option>
				<option value="contents">내용</option>
				<option value="like">필요없음</option>
			</select>
			<input type="text" name="searchtxt">
			<input type="submit" value="검색">
		</form>
	
	 -->
	 
	<!-- 페이징  -->
	<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }">&laquo;</a>
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
				      <a class="page-link" href="reviewall?currPage=${index }"><c:out value="${index }"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
	</nav>	

</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>