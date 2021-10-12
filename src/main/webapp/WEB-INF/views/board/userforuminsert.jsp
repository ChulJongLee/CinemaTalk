<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/userforuminsert.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<section>
	<form action="userforuminsertresult" method="post">
	
		<div id="title">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="제목을 입력하세요.(최대 40자)" required="required" maxlength="40">
		</div>
		<div id="content">
			<label for="content">내용</label>
			<textarea id="content" name="content" placeholder="내용을 입력하세요."></textarea>		
		</div>
		<div id="photo">
			<input type="file" name="">
		</div>
		<div id="submit">
			<input type="submit" value="등록">
		</div>
		
	</form>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>