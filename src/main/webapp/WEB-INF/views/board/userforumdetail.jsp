<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/userforumdetail.css">
</head>
<body>

	<section>
		<article>
		
			<div id="head">
				<h3 id="title">${userforumdetail.content_title }</h3>
				<hr id="titleUnderbar">
				<div id="edit">
					<input type="button" value="목록" class="boardBtn" onClick="location.href='/moviedetail/${movieCd }/userforumlist'">
					<c:if test="${user != null}">
						<input type="button" value="수정" class="boardBtn" onClick="location.href='/moviedetail/${movieCd}/userforummodify/${userforumdetail.content_no}'">
						<input type="button" value="삭제" class="boardBtn" onClick="location.href='/moviedetail/${movieCd}/userforumdelete/${userforumdetail.content_no }'">
					</c:if>
				</div>
				<p id="id"> ${userforumdetail.user_id }   ${userforumdetail.content_date }</p>
			</div>
			
			<div id="body">
				<div class="forumImg">
					<c:if test="${userforumdetail.imageName!=null && userforumdetail.imageName!='' }">
						<img alt="이미지" src="/resources/upload/${userforumdetail.imagePath }" class="detail_img">
					</c:if>
				</div>
				<div id="content">${userforumdetail.content_content }</div>
				<div id="fucntionBtn">
					<input type="hidden" value="${userforumdetail.content_no }" class="contentnodistinct">
				
					<div class="fucntionBtn">
						<button class="forum_likebtn" value="${userforumdetail.content_no }">
							<div class="likeresult"></div>
						</button>				
					</div>
					<div class="fucntionBtn">
						<button class="forum_dislikebtn" value="${userforumdetail.content_no }">
							<div class="dislikeresult"></div>
						</button>
					</div>
					<div class="fucntionBtn">
						<c:if test="${sessionScope.user.user_id!=null}">
							<button type="button" class="forum_reportbtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" data-bs-whatever="t">
								<i class="fas fa-flag" id="forum_reportbtn2"></i>
								신고
							</button>
						</c:if>
						<c:if test="${sessionScope.user.user_id==null}">
							<button type="button" class="forum_reportbtn" id="reportBtn">
								<i class="fas fa-flag" id="reportbtn2"></i>
								신고
							</button>
						</c:if>
					</div>		
				</div>		
			</div>
					
			
				
			
			<!-- <div id="reply">
				<i class="fas fa-comment-dots fa-5x"></i>
				댓글 기능을 구현하여 넣으시오.....
			</div> -->
		
		</article>
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
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">신고하기</button>		        
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
	<script src="/resources/js/userforumlist.js"></script>
</body>
</html>