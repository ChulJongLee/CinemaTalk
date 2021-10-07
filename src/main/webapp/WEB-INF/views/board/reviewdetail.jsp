<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/reviewdetail.css">
</head>
<body>
	<!-- 영화정보 & 카테고리 -->
	<%-- <%@ include file="movieinfotop.jsp" %> --%>
	
	
	<section>
		<div id="detailwrap">
			<ul>
				<li>
					<div id="id">${revdetail.userid }</div>
					<div id="date">${revdetail.writedate }</div>
					<div id="content">${revdetail.contents }</div>
					<div id="like">${revdetail.like }</div>
					<div id="dislike">${revdetail.dislike }</div>
					<div id="report">신고</div>	
				</li>	
			</ul>	
		</div>
	</section>
	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>