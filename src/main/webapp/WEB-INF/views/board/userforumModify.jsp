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
		<div id="submitBtn">
			<input type="submit" value="수정" class="submitBtn">
		</div>
		<div id="modify_title">
			<label for="content_title">제목</label>
			<input type="text" class="modify_title" name="content_title" value="${userforumdetail.content_title }" required="required" maxlength="30">
		</div>
		<div id="modify_content">
			
			<label for="content_content">내용</label>
			<textarea class="modify_content" name="content_content">${userforumdetail.content_content }</textarea>		
		</div>
		<div id="photo">
			<input type="file" name="file1">
		</div>
		<c:if test="${userforumdetail.imageName!=null }">
				<img alt="이미지" src="/resources/upload/${userforumdetail.imagePath }" id="modify_img">
		</c:if>
		<input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		
	</form>
</section>


</body>
</html>