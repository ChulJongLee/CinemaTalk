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
				<h3 id="title">${userforumdetail.title }</h3>
				<p id="id"> ${userforumdetail.userid }</p>
				<p id="date"> ${userforumdetail.writedate }</p>
			</div>
			
			<div id="body">
				<pre id="content">${userforumdetail.contents }</pre>
			</div>
			
			<div id="thumb">
				<p id="like"><i class="fas fa-thumbs-up fa-lg"></i> ${userforumdetail.like }</p>
				<p id="dislike"><i class="fas fa-thumbs-down fa-lg"></i> ${userforumdetail.dislike }</p>
			</div>	
			
			<div id="edit">
				<input type="button" value="수정" id="modify">
				<input type="button" value="삭제" id="delete">
			</div>
			
			<div id="reply">
				<i class="fas fa-comment-dots fa-5x"></i>
				댓글 기능을 구현하여 넣으시오.....
			</div>
		
		</article>
	</section>

	
</body>
</html>