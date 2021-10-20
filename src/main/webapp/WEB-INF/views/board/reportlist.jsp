<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/reportlist.css">
</head>
<body>
	
	<section id="repotrwrap">
		<table>
			<thead>
				<tr>
					<th>신고번호</th><th>게시글(댓글)번호</th><th>신고 사유</th><th>신고 유저</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${reportList }">
					<tr>
						<td class="reportno">${list.reportno }</td>
						<c:if test="${list.reply !=0}"><td class="contentno">${list.reply }</td></c:if>
						<c:if test="${list.contentno !=0}"><td class="contentno">${list.contentno }</td></c:if>
						<td>${list.reportreason }</td>
						<td class="reportsize">${list.reportsize }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	

	</section>
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
	

</body>
</html>