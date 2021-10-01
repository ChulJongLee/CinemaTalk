<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/reviewall.css">
</head>
<body>
	<!-- 헤더  -->
	<%@ include file="header.jsp" %>
	<!-- 영화정보 & 카테고리 -->
	<%@ include file="movieinfotop.jsp" %>
	
	
	<!-- ******* 전체 리뷰 ******* -->
	<section>
		<div id="allreview">
		 <c:if test="${allreview==null }">              		
	        	자료가 없습니다.
	     </c:if>
		 <c:if test="${allreview!=null }">
			<c:forEach var="list" items="${allreview }">
				<table class="allreviewtable">
					<tr><td colspan="3">${list.userno }</td><td class="reviewdate">${list.writedate }</td></tr>
					<tr><td colspan="4">${list.contents }</td></tr>
					<tr><td>${list.like }</td><td colspan="2">${list.dislike }</td><td class="reviewreport">신고</td></tr>
				</table>
			</c:forEach>
		 </c:if>
		</div>
	</section>
	
	
	<form method="get" action="list">
		<select name="search">
			<option value="userno">닉네임</option>
			<option value="contents">내용</option>
			<option value="like">필요없음</option>
		</select>
		<input type="text" name="searchtxt">
		<input type="submit" value="검색">
	</form>


<!-- 페이징  -->
<nav aria-label="...">
	<ul class="pagination">	
	
		<!-- 이전 버튼 -->		  
		<c:if test="${page.prev == false}">		
			<li class="page-item disabled">
		      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.prev == true}">		
			<li class="page-item">
		      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
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
			      <a class="page-link" href="reviewall?currPage=${index }&search=${search}&searchtxt=${searchtxt}"><c:out value="${index }"/></a>
			    </li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:if test="${page.next == false}">
			<li class="page-item disabled">
		      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.next == true}">
			<li class="page-item">
		      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>		
  	</ul>
</nav>	


	<!-- 푸터  -->
	<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>