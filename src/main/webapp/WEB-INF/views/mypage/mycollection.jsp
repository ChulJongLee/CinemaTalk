<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mycollection.css">
</head>
<body>

	<div id="subtitle">
		<h1><strong>나의 컬렉션</strong></h1>
	</div>

	<div id="mycollection">
		<div id="collection-wrap">
			<c:forEach var="item" items="${collectionlist}">
				<div class="collectionlist">
					<div class="poster"><img src="${item.poster}" alt="${item.movieNm}포스터" width="213px" height="300px"></div>
					<div class="moviename">${item.movieNm}</div>
					<div class="rank"><img src="/resources/img/star1.png" alt="별" width="15px"> ${item.rank}</div>
				</div>
			</c:forEach>
		</div>

<%-- 		<div id="paging">
			<c:if test="${page.prev}">
				<a href="/mypage/mycollection?currPage=${page.startBlock-1}">이전</a>
			</c:if>
			<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
				<c:if test="${index == page.currPage}">
					<c:out value="${index}" />
				</c:if>
				<c:if test="${index != page.currPage}">
					<a href="/mypage/mycollection?currPage=${index}"><c:out value="${index}" /></a>
				</c:if>
			</c:forEach>
			<c:if test="${page.next}">
				<a href="/mypage/mycollection?currPage=${page.endBlock+1}">다음</a>
			</c:if>
		</div> --%>
		
		<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="/mypage/myreview?currPage=${page.startBlock-1}">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="/mypage/myreview?currPage=${page.startBlock-1}">&laquo;</a>
			    </li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
				<c:if test="${index==page.currPage}">
					<li class="page-item active" aria-current="page">
			      		<a class="page-link"><c:out value="${index}"/></a>
			    	</li>				
				</c:if>
				<c:if test="${index!=page.currPage }">
					<li class="page-item" aria-current="page">
				      <a class="page-link" href="/mypage/myreview?currPage=${index}"><c:out value="${index}"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="/mypage/myreview?currPage=${page.endBlock+1}">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="/mypage/myreview?currPage=${page.endBlock+1}">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
		</nav>
	</div>

</body>
</html>