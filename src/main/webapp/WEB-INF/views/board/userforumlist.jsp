<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/userforumlist.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	
	<section>
		<div id="userforumwrap">
			<div id="listhead">
				<div id="headno">번호</div><div id="headtitle">제목</div><div id="headid">아이디</div><div id="headdate">작성일</div><div id="headlike">좋아요</div><div id="headdislike">싫어요</div>
			</div>
			<ul id="userforumboard">
				<c:forEach var="list" items="${alluserforum }">
					<li id="userforumlist">
						<div id="number">${list.contentno }</div>
						<div id="title">${list.title }</div>
						<div id="id">${list.userid }</div>
						<div id="writedate">${list.writedate }</div>
						<div id="like">${list.like }</div>
						<div id="dislike">${list.dislike }</div>					
					</li>
				</c:forEach>			
			</ul>		
		</div>
		<div id="writebtn">
			<button type="button" class="btn btn-outline-primary">글쓰기</button>
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