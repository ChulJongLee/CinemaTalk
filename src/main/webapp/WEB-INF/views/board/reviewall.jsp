<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/reviewall.css">
</head>
<body>
	<input type="hidden" value="${movieCd }" id="moviecd">
	${movieCd }sss
	<!-- ******* 전체 리뷰 ******* -->
	<section>
		<div id="allreview">
		 <c:if test="${allreview==null }">              		
	        	자료가 없습니다.
	     </c:if>
		 <%-- <c:if test="${allreview!=null }"> --%>
		 	<ul id="contentslist">
				<c:forEach var="list" items="${allreview }">
					<li id="contents">
						<div id="id">${list.userid }</div>
						<div id="date">${list.writedate }</div>
						<div id="content">${list.contents }</div>
						<%-- <div id="like"><i class="fas fa-thumbs-up"> ${list.like }</i></div>
						<div id="dislike"><i class="fas fa-thumbs-down"> ${list.dislike }</i></div>
						<div id="report"><i class="fas fa-flag"> 신고</i></div> --%>
						<div id="like">
								<button class="likebtn" value="${list.contentno }">
									<div>
										<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
									</div>
									<div>
										${list.like }
									</div>
								</button>				
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.contentno }">
									<div>
										<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
									</div>
									<div>
										${list.dislike }
									</div>
								</button>
							</div>
							<div id="report">
								<button class="reportbtn" value="${list.contentno }">
									<i class="fas fa-flag" id="reportbtn2"></i>
									신고
								</button>
							</div>
							<div id="contentedit">
								<div id="modifycheck"><button class="modifycheckbtn"><i class="fas fa-check fa-lg"></i></button></div>
								<div id="modifyreturn"><button class="modifyreturnbtn"><i class="fas fa-undo fa-lg"></i></button></div>
								<div id="modify"><button class="modifybtn" value="${list.contentno }"><i class="fas fa-edit fa-lg"></i></button></div>
								<div id="delete"><button class="deletebtn" value="${list.contentno }"><i class="fas fa-times fa-lg"></i></button></div>						
							</div>					
					</li>		
				</c:forEach>
			</ul>
		 <%-- </c:if> --%>
		</div>
<!-- 		<div id="writebtn">
			<button type="button" class="btn btn-outline-primary">글쓰기</button>
		</div> -->

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

<script src="/resources/js/reviewall.js"></script>
</body>
</html>