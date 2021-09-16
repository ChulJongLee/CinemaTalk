<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
</head>
<body>
<h1>배우검색 </h1>
<form method="post" action="${pageContext.servletContext.contextPath}/searchactorresult">
<input type="text" id="keyword" name="keyword">
<input type="submit" value="검색">
</form>
</body>
</html>