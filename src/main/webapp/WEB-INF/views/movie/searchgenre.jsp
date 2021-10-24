<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="/resources/css/searchresult.css">
</head>
<body>
	<div id="boardWrap">
		<p class="resultCount">검색 결과 : ${keyword } <span class="totalCount">(${totalCount })</span> </p>
		<c:forEach var="item" items="${list}">
			<div class="listsection" onclick="location.href='/moviedetail/${item.movieCd }'">
				
				<div class="movieList">
					<c:if test="${item.poster==''}"><img src="/resources/img/poster_noimg.png" alt="포스터" class="poster"></c:if>
	            	<c:if test="${item.poster!=''}"><img src="${item.poster}" alt="포스터" class="poster"></c:if>
	       
					<div>
						<p class="movieNm">${item.movieNm}</p>
						<c:if test="${item.watchGradeNm!=0 }">
							<p class="movieInfo">${item.watchGradeNm }세 이상 관람가</p>
						</c:if>
						<c:if test="${item.watchGradeNm==0 }">
							<p class="movieInfo">전체 관람가</p>
						</c:if>
						<p class="movieInfo">${item.genreNm }
							<c:if test="${item.repNationNm!='' && item.genreNm!='' }"> | </c:if>
							${item.repNationNm }
							<c:if test="${item.showTm!='' }"> | </c:if>
							${item.showTm}
							<c:if test="${item.showTm!='' }">분</c:if>
							<c:if test="${item.openDt!=null }"> | </c:if>
							${item.openDt}</p>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
		
		<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="/genre/${genre }?currPage=${page.startBlock-1}">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="/genre/${genre }?currPage=${page.startBlock-1}">&laquo;</a>
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
				      <a class="page-link" href="/genre/${genre }?currPage=${index}"><c:out value="${index}"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="/genre/${genre }?currPage=${page.endBlock+1}">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="/genre/${genre }?currPage=${page.endBlock+1}">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
		</nav>
	
	</div>	
</body>
</html>