<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/userforumlist.css">
</head>
<body>
	
	<section>
		<div id="userforumwrap">
			<div id="subtitle">
				<h3>자유게시판</h3>
			</div>
			<div id="writebtn">
				<c:if test="${user != null}"><a href="/moviedetail/${movieCd }/userforuminsert" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
				<c:if test="${user == null}"><a href="/login" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
			</div>
			<c:if test="${fn:length(userforumList) == 0}">
         		<h5>자료가 없습니다.</h5>
         	</c:if>
         	
         	<c:if test="${fn:length(userforumList) != 0}">
				<ul id="userforumboard">
					<c:forEach var="list" items="${userforumList }">
						<div id="listhead">
							<div id="number">${list.content_no }</div>
							<div id="writedate">${list.content_date }</div>
							<div id="user_id">${list.user_nickname }</div>
						</div>
						<hr id="under_title" style="margin: 5px 0;">
						<li id="userforumlist">
							<div id="img_section">
								<c:if test="${list.imageName!=null && list.imageName!='' }">
									<img alt="이미지" src="/resources/upload/${list.imagePath }" class="forum_list_img"
									onClick="location.href='/moviedetail/${movieCd }/userforumdetail/${list.content_no }'">
								</c:if>
								<c:if test="${list.imageName==null }">
									<img alt="이미지" src="/resources/img/forum_noimg.PNG" class="forum_list_img"
									onClick="location.href='/moviedetail/${movieCd }/userforumdetail/${list.content_no }'">
								</c:if>
							</div>
							<div id="titleNcontent" onClick="location.href='/moviedetail/${movieCd }/userforumdetail/${list.content_no }'">
								<div id="title">${list.content_title }</div>
								<div id="content">${list.content_content }</div>
							</div>
							<div id="functionBtns">
								<input type="hidden" value="${list.content_no }" class="contentnodistinct">
							
								<div class="fucntionBtn">
									<button class="forum_likebtn" value="${list.content_no }">
										<div class="likeresult"></div>
									</button>				
								</div>
								<div class="fucntionBtn">
									<button class="forum_dislikebtn" value="${list.content_no }">
										<div class="dislikeresult"></div>
									</button>
								</div>
								<div class="fucntionBtn">
									<c:if test="${sessionScope.user.user_id!=null}">
										<button type="button" class="forum_reportbtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" data-bs-whatever="t">
											<i class="fas fa-flag" id="forum_reportbtn2"></i>
											<div> 신고</div>
										</button>
									</c:if>
									<c:if test="${sessionScope.user.user_id==null}">
									<button type="button" class="forum_reportbtn forum_reportbtnNull" id="reportBtn">
										<i class="fas fa-flag" id="reportbtn2"></i>
										신고
									</button>
									</c:if>
								</div>		
							</div>				
						</li>
						<hr id="under_title" style="margin: 5px 0;">
					</c:forEach>			
				</ul>		
			</c:if>
			<div id="findBar"> <!-- 검색창 -->
			<form method="get" action="/moviedetail/${movieCd }/userforumlist">
				<select id="search" name="search">
					<option value="content_title">제목</option>
					<option value="content_content">내용</option>
					<option value="user_nickname">닉네임</option>
				</select>
				<input type="text" name="searchtxt">
				<input type="submit" value="검색" id="btn1">
			</form>
		</div>	
		</div>
	

	<!-- 페이징  -->
	<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="userforumlist?currPage=${page.startBlock-1 }&search=${search }&searchtxt=${searchtxt }">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="userforumlist?currPage=${page.startBlock-1 }&search=${search }&searchtxt=${searchtxt }">&laquo;</a>
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
				      <a class="page-link" href="userforumlist?currPage=${index }&search=${search }&searchtxt=${searchtxt }"><c:out value="${index }"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="userforumlist?currPage=${page.endBlock+1 }&search=${search }&searchtxt=${searchtxt }">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="userforumlist?currPage=${page.endBlock+1 }&search=${search }&searchtxt=${searchtxt }">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
	</nav>		
	
</section>
<!-- 리뷰 신고 Modal -->
  		<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">신고하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/moviedetail/${movieCd }/forumreport" method="post">
		      <div class="modal-body">	         
		   	 	<input type="hidden" name="contentno" class="contentval">   	 	
		   	 	
		    	<input type="radio" name="reportreason" id="f1" value="ad">
	            <label for="f1" style="color: black">광고 및 도배</label><br>
	            <input type="radio" name="reportreason" id="f2" value="curse">
	            <label for="f2" style="color: black">욕설</label><br>
	            <input type="radio" name="reportreason" id="f3" value="spoiler">
	            <label for="f3" style="color: black">스포일러 노출</label><br>		    	
	            
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal" id="modalbtn">취소</button>
		        <button type="submit" class="btn btn-primary" id="modalbtn2">신고하기</button>		        
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
<script src="/resources/js/userforumlist.js"></script>
</body>
</html>