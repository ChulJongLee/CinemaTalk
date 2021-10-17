<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/userforumdetail.css">
</head>
<body>

	<section>
		<article>
			<div id="head">
				<h3 id="title">${userforumdetail.content_title }</h3>
				<p id="id"> ${userforumdetail.user_id }</p>
				<p id="date"> ${userforumdetail.content_date }</p>
			</div>
			
			<div id="body">
				<c:if test="${userforumdetail.imageName!=null && userforumdetail.imageName!='' }">
					<img alt="이미지" src="/resources/upload/${userforumdetail.imagePath }">
				</c:if>
				<pre id="content">${userforumdetail.content_content }</pre>
			</div>
			
			<div id="thumb">
				<p id="like"><i class="fas fa-thumbs-up fa-lg"></i> ${userforumdetail.content_like }</p>
				<p id="dislike"><i class="fas fa-thumbs-down fa-lg"></i> ${userforumdetail.content_dislike }</p>
			</div>	
							
							
			<c:if test="${user != null}">
				<div id="edit">
					<input type="button" value="목록" id="list" onClick="location.href='/moviedetail/${movieCd }/userforumlist'">
					<input type="button" value="수정" id="modify" onClick="location.href='/moviedetail/${movieCd}/userforummodify/${userforumdetail.content_no}'">
					<input type="button" value="삭제" id="delete" onClick="location.href='/moviedetail/${movieCd}/userforumdelete/${userforumdetail.content_no }'">
				</div>
			</c:if>
			<div id="reply">
				<i class="fas fa-comment-dots fa-5x"></i>
				댓글 기능을 구현하여 넣으시오.....
			</div>
		
		</article>
	</section>

	
</body>
</html>