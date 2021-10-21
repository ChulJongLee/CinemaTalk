<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/userforummain.css">
 
</head>
<body>
	<input type="hidden" value="${detail.movieCd }" id="moviecd">
	<div id="writebtn">
		<c:if test="${user != null}"><a href="/moviedetail/${movieCd }/userforuminsert" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
		<c:if test="${user == null}"><a href="/login" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
	</div>
    <section id="bestNworst">
       <div class="forumList">
       		<div class="forum_title_section">
	       		<div>
					<i class="fas fa-thumbs-up forum_head_thumbs_up fa-2x"></i>
				</div>
	       		<h3 class="forum_title">Best</h3>
        	</div>
       		<c:if test="${bestUserforumList==null }">
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${bestUserforumList!=null }">
         	<ul id="forum_contentslist">
         		<c:forEach var="list" items="${bestUserforumList }">
					<li class="forum_contents">
						<input type="hidden" value="${list.content_no }" class="contentnodistinct">
						<div class="title" onClick="location.href='/moviedetail/${detail.movieCd }/userforumdetail/${list.content_no }'">${list.content_title }</div>
						<div class="user_id">${list.user_id }</div>
						<div class="content_date">${list.content_date }</div>
						<c:if test="${list.imageName!=null && list.imageName!='' }">
							<div class="img_div">
								<img alt="이미지" src="/resources/upload/${list.imagePath }" class="forumImg" onClick="location.href='/moviedetail/${detail.movieCd }/userforumdetail/${list.content_no }'">
							</div>
						</c:if>
						<div class="forum_content">${list.content_content }</div>
						
						<div id="forum_like">
								<button class="forum_likebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-up" id="forum_likebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_like }
									</div>
								</button>				
							</div>
							<div id="forum_dislike">
								<button class="forum_dislikebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_hate }
									</div>
								</button>
							</div>
							<div id="forum_report">
								<c:if test="${sessionScope.user.user_id!=null}">
									<button type="button" class="forum_reportbtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" data-bs-whatever="t">
										<i class="fas fa-flag" id="forum_reportbtn2"></i>
										신고
									</button>
								</c:if>
								<c:if test="${sessionScope.user.user_id==null}">
									<button class="forum_reportbtn" value="${list.content_no }" disabled="disabled">
										<i class="fas fa-flag" id="reportbtn2"></i>
										신고
									</button>
								</c:if>
							</div>			
					</li>
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
        <div class="updown"></div>
        <div class="forumList">
     	   <div class="forum_title_section">
	       		<div>
					<i class="fas fa-thumbs-down forum_head_thumbs_down fa-2x"></i>
				</div>
	       		 <h3 class="forum_title">Worst</h3>
        	</div>
           
        
       		<c:if test="${worstUserforumList==null }">
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${worstUserforumList!=null }">
         	<ul id="forum_contentslist">
         		<c:forEach var="list" items="${worstUserforumList }">
					<li class="forum_contents">
						<input type="hidden" value="${list.content_no }" class="contentnodistinct">
						<div class="title">${list.content_title }</div>
						<div class="user_id">${list.user_id }</div>
						<div class="content_date">${list.content_date }</div>
						<c:if test="${list.imageName!=null && list.imageName!='' }">
							<div class="img_div">
								<img alt="이미지" src="/resources/upload/${list.imagePath }" class="forumImg"  onClick="location.href='/moviedetail/${detail.movieCd }/userforumdetail/${list.content_no }'">
							</div>
						</c:if>
						<div class="forum_content">${list.content_content }</div>
						
						<div id="forum_like">
							<button class="forum_likebtn" value="${list.content_no }">
								<div>
									<i class="fas fa-thumbs-up" id="forum_likebtn2">&nbsp</i>
								</div>
								<div>
									${list.content_like }
								</div>
							</button>				
						</div>
						<div id="forum_dislike">
							<button class="forum_dislikebtn" value="${list.content_no }">
								<div>
									<i class="fas fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i>
								</div>
								<div>
									${list.content_hate }
								</div>
							</button>
						</div>
						<div id="forum_report">
							<c:if test="${sessionScope.user.user_id!=null}">
									<button type="button" class="forum_reportbtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" data-bs-whatever="t">
										<i class="fas fa-flag" id="forum_reportbtn2"></i>
										신고
									</button>
								</c:if>
								<c:if test="${sessionScope.user.user_id==null}">
									<button class="forum_reportbtn" value="${list.content_no }" disabled="disabled">
										<i class="fas fa-flag" id="reportbtn2"></i>
										신고
									</button>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
    </section>
	<!-- 리뷰 신고 Modal -->
  		<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">신고하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/moviedetail/${detail.movieCd }/forumreport" method="post">
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
		
    <div id="userforumall">
        <a href="/moviedetail/${movieCd }/userforumlist" id="userforumallbtn">모든 게시글 보기</a>
    </div>
    
		

<script src="/resources/js/userforummain.js"></script>
</body>
</html>