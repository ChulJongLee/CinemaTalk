<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/userforumlist.css">
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
						<div id="number">${list.content_no }</div>
						
						<div id="title"><a href="userforumdetail/${list.content_no }">${list.content_title }</a></div>
						
						<div id="id">${list.user_id }</div>
						<div id="writedate">${list.content_date }</div>
						<div id="like">${list.content_like }</div>
						<div id="dislike">${list.content_hate }</div>					
					</li>
				</c:forEach>			
			</ul>		
		</div>
		<div id="writebtn">
				<c:if test="${user != null}"><a href="/moviedetail/${movieCd }/userforuminsert" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
				<c:if test="${user == null}"><a href="/login" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
		</div>
		<div id="userforumallbtn">
        	<a href="/moviedetail/${movieCd }/userforumlist">모든 게시글 보기</a>
        </div>

	<!-- 페이징  -->
	<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="userforumlist?currPage=${page.startBlock-1 }">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="userforumlist?currPage=${page.startBlock-1 }">&laquo;</a>
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
				      <a class="page-link" href="userforumlist?currPage=${index }"><c:out value="${index }"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="userforumlist?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="userforumlist?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
	</nav>		
	
</section>

<script src="/resources/js/userforumlist.js"></script>
</body>
</html>