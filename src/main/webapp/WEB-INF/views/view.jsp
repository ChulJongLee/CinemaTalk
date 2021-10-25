<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cinema Talk</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<link rel="shortcut icon" href="/resources/img/logo.jpg">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
@font-face { 
    font-family: 'EliceDigitalBaeum_Bold'; /* 엘리스디지털배움체B */
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Regular.woff') format('woff');

}
* {
	font-family: 'EliceDigitalBaeum_Bold', cursive;
}
</style>
</head>
<body style="background-color: #212121;">

	<%@ include file="header.jsp" %>
	
	<c:set var="contentpage" value="${param.page }"></c:set> 
	<jsp:include page="${contentpage }"></jsp:include>

	
	<%@ include file="footer.jsp" %>
</body>
</html>