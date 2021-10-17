<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/userforuminsert.css">
</head>
<body>

<section>
	<form action="userforuminsertresult" method="post" enctype="multipart/form-data"  onsubmit="return writeSubmit();">
	
		<div id="title">
			<label for="content_title">제목</label>
			<input type="text" id="title" name="content_title" placeholder="제목을 입력하세요.(최대 30자)" required="required" maxlength="30">
		</div>
		<div id="content">
			<label for="content_content">내용</label>
			<textarea id="content" name="content_content" placeholder="내용을 입력하세요."></textarea>		
		</div>
		<div id="photo">
			<input type="file" name="file1">
		</div>
		<div id="submit">
			<input type="submit" value="등록">
		</div>
		<input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		
	</form>
</section>


</body>
</html>