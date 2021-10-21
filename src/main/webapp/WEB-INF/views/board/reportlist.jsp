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
		<div class="container">
		    <table class="table table-condensed"  id="myTable">
			    <thead>
			        <tr>
			            <th id="headT1">신고번호</th>
			            <th id="headT2">게시글(댓글)번호</th>
			            <th id="headT3">신고 사유</th>
			            <th id="headT4">신고 횟수</th>
			            <th id="headT"></th>
			        </tr>
			    </thead>
			    <tbody class="panel">
			    	<c:forEach var="list" items="${reportList }" varStatus="status">
				        <tr data-bs-toggle="collapse" data-bs-target="#demo${status.index}" 
				        data-parent="#myTable" class="reportContent">
				           <td class="reportno">${list.reportno }</td>
								<c:if test="${list.reply !=0}"><td class="contentno">${list.reply }</td></c:if>
								<c:if test="${list.contentno !=0}"><td class="contentno">${list.contentno }</td></c:if>
								<td>${list.reportreason }</td>
								<td class="reportsize">${list.reportsize }</td>
				        </tr>
				        <tr id="demo${status.index}" class="collapse">
				        	<td id="blankT"></td>
				            <td colspan="3" class="hiddenRow"><div>${list.content_content }</div> </td>
				            <td id="btnT">		            
				            <input type="button" value="삭제" class="deleteBtn" 
				            onClick="location.href='/moviedetail/${list.movieCd}/userforumdelete/${list.contentno }'">
				            </td>
				        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
	</section>
	<!-- 페이징  -->
	<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="/report?currPage=${page.startBlock-1 }">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="/report?currPage=${page.startBlock-1 }">&laquo;</a>
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
				      <a class="page-link" href="/report?currPage=${index }"><c:out value="${index }"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="/report?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="/report?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
	</nav>		
	

</body>
</html>