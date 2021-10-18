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
    <section id="bestNworst">
       <div class="forumList">
       		<h3 id="bestforumbtn">베스트 게시글</h3>
        
       		<c:if test="${bestUserforumList==null }">
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${bestUserforumList!=null }">
         	<ul id="forum_contentslist">
         		<c:forEach var="list" items="${bestUserforumList }">
					<li class="forum_contents">
						<div class="title">${list.content_title }</div>
						<div class="user_id">${list.user_id }</div>
						<div class="content_date">${list.content_date }</div>
						<c:if test="${list.imageName!=null && list.imageName!='' }">
							<div class="img_div">
								<img alt="이미지" src="/resources/upload/${list.imagePath }" class="forumImg">
							</div>
						</c:if>
						<div class="forum_content">${list.content_content }</div>
						
						<div id="like">
								<button class="likebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_like }
									</div>
								</button>				
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_dislike }
									</div>
								</button>
							</div>
							<div id="report">
								<button class="reportbtn" value="${list.content_no }">
									<i class="fas fa-flag" id="content_no"></i>
									신고
								</button>
							</div>				
					</li>
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
        <div class="updown"></div>
        <div class="forumList">
            <h3 id="bestforumbtn">워스트 게시글</h3>
        
       		<c:if test="${worstUserforumList==null }">
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${worstUserforumList!=null }">
         	<ul id="forum_contentslist">
         		<c:forEach var="list" items="${worstUserforumList }">
					<li class="forum_contents">
						<div class="title">${list.content_title }</div>
						<div class="user_id">${list.user_id }</div>
						<div class="content_date">${list.content_date }</div>
						<c:if test="${list.imageName!=null && list.imageName!='' }">
							<div class="img_div">
								<img alt="이미지" src="/resources/upload/${list.imagePath }" class="forumImg">
							</div>
						</c:if>
						<div class="forum_content">${list.content_content }</div>
						
						<div id="like">
								<button class="likebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_like }
									</div>
								</button>				
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.content_no }">
									<div>
										<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
									</div>
									<div>
										${list.content_dislike }
									</div>
								</button>
							</div>
							<div id="report">
								<button class="reportbtn" value="${list.content_no }">
									<i class="fas fa-flag" id="content_no"></i>
									신고
								</button>
							</div>				
					</li>
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
    </section>

   	<div id="writebtn">
				<c:if test="${user != null}"><a href="/moviedetail/${movieCd }/userforuminsert" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
				<c:if test="${user == null}"><a href="/login" class="btn btn-outline-primary" id="userforuminsert">글쓰기</a></c:if>
	</div>
    <div id="userforumallbtn">
        <a href="/moviedetail/${movieCd }/userforumlist">모든 게시글 보기</a>
    </div>
    
		

<!-- <script src="/resources/js/userforummain.js"></script> -->
</body>
</html>