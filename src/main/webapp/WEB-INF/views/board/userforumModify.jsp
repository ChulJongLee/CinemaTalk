<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/userforummodify.css">
</head>
<body>

<section id="modifyform">
	<form action="/moviedetail/${movieCd }/userforummodifyresult/${userforumdetail.content_no}" method="post" enctype="multipart/form-data"  onsubmit="return writeSubmit();">
	
		<div>
			<label for="content_title"></label>
			<input type="text" id="modify_title" name="content_title" value="${userforumdetail.content_title }" required="required" maxlength="30">
		</div>
		<div class="content_part">
			<c:if test="${userforumdetail.imageName!=null }">
				<img alt="이미지" src="/resources/upload/${userforumdetail.imagePath }" id="modify_img">
			</c:if><br>
			<label for="content_content"></label>
			<textarea id="modify_content" name="content_content">${userforumdetail.content_content }</textarea>		
		</div>
		<div id="photo">
			<input type="file" name="file1">
		</div>
		<div id="submit">
			<input type="submit" value="수정" class="fucntionBtn">
		</div>
		<input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		
	</form>
</section>


</body>
</html>