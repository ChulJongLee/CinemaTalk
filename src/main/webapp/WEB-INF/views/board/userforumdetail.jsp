<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/userforumdetail.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>