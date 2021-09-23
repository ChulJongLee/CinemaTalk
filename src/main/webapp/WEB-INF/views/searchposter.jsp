<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${pageContext.servletContext.contextPath}/searchposterresult">
	<ul>
		<li><input type="text" name="keyword" id="keyword"></li>
		<li><input type="submit" value="포스터검색"></li>
	</ul>
</form>
</body>
</html>