<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/myreview.css">
</head>
<body>

	<div id="subtitle">
		<h1><strong>나의 리뷰</strong></h1>
	</div>


	<div id="myreview">
		
		 <c:if test="${reviewlist==null}">              		
	        	자료가 없습니다.
	     </c:if>
		 	<ul id="contentslist">
				<c:forEach var="list" items="${reviewlist}">
					<li id="contents"><input type="hidden" value="${list.contentno}" class="contentnodistinct">
					<div id="id">${list.title}</div>
					<div id="contentedit">
						<div id="modify">
							<button type="button" class="modifybtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-whatever="t">
								<i class="fas fa-edit"></i>
							</button>
						</div>
						<div id="delete">
							<button class="deletebtn" value="${list.contentno}">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div id="date">${list.writedate}</div>

					<div class="content">${list.contents}</div>

					<div id="like">
						<button class="likebtn" value="${list.contentno}" disabled>
							<div>
								<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
							</div>
							<div>${list.like}</div>
						</button>
					</div>
					<div id="dislike">
						<button class="dislikebtn" value="${list.contentno}" disabled>
							<div>
								<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
							</div>
							<div>${list.dislike}</div>
						</button>
					</div> 
					</li>		
				
						<!-- 리뷰 수정 Modal -->
  		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">리뷰 수정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/mypage/reviewmodify/{movieCd}" method="post">
		      <div class="modal-body">	         
 		   	 	<input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		   	 	<input type="hidden" name="contentno"  class="contentval">   	 	
		    	<label for="modaltext">리뷰</label>
		    	<textarea id="modaltext" name="contents" rows="10" cols="50"></textarea>			    	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">수정하기</button>		        
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
		
		
		<!-- 리뷰 신고 Modal -->
  		<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">신고하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/mypage/reviewreport/{movieCd}" method="post">
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
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">신고하기</button>		        
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
				</c:forEach>
			</ul>
			

		<div id="pag">
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
	</div>


<script src="/resources/js/myreview.js"></script>
</body>
</html>