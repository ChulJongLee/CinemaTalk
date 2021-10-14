<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/myreview.css">
</head>
<body>

	<div id="subtitle">
		<h1><strong>나의 리뷰</strong></h1>
	</div>


	<div id="myreview">
		<div id="review-wrap">
			<c:forEach var="item" items="${reviewlist}">
				<div class="reviewlist">
					<div class="moviename">
						<b>${item.title}</b>
					</div>
					<div class="content">${item.contents}</div>
				</div>
			</c:forEach>
		</div>
			
		<%-- <div id="paging">
			<c:if test="${page.prev}">
				<a href="/mypage/myreview?currPage=${page.startBlock-1}">이전</a>
			</c:if>
			<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
				<c:if test="${index == page.currPage}">
					<c:out value="${index}" />
				</c:if>
				<c:if test="${index != page.currPage}">
					<a href="/mypage/myreview?currPage=${index}"><c:out value="${index}" /></a>
				</c:if>
			</c:forEach>
			<c:if test="${page.next}">
				<a href="/mypage/myreview?currPage=${page.endBlock+1}">다음</a>
			</c:if>
		</div> --%>

		<nav aria-label="..." id="paging">
			<ul class="pagination">

				<!-- 이전 버튼 -->
				<c:if test="${page.prev == false}">
					<li class="page-item disabled"><a class="page-link" href="/mypage/myreview?currPage=${page.startBlock-1}">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${page.prev == true}">
					<li class="page-item"><a class="page-link" href="/mypage/myreview?currPage=${page.startBlock-1}">&laquo;</a>
					</li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach var="index" begin="${page.startBlock}"
					end="${page.endBlock}">
					<c:if test="${index==page.currPage}">
						<li class="page-item active" aria-current="page"><a class="page-link"><c:out value="${index}" /></a></li>
					</c:if>
					<c:if test="${index!=page.currPage }">
						<li class="page-item" aria-current="page"><a class="page-link" href="/mypage/myreview?currPage=${index}"><c:out
									value="${index}" /></a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${page.next == false}">
					<li class="page-item disabled"><a class="page-link" href="/mypage/myreview?currPage=${page.endBlock+1}">&raquo;</a></li>
				</c:if>
				<c:if test="${page.next == true}">
					<li class="page-item"><a class="page-link" href="/mypage/myreview?currPage=${page.endBlock+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</nav>

	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>		
</body>
</html>