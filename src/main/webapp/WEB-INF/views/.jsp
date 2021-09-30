<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
	<!-- ******** 헤더 ********* -->
	<%@ include file="header.jsp" %>


	 <c:if test="${allreview==null }">              		
        	자료가 없습니다.
     </c:if>
	 <c:if test="${allreview!=null }">
		<c:forEach var="list" items="${allreview }">
			<table class="bestreviewtable">
				<tr><td colspan="3">${list.userno }</td><td class="reviewdate">${list.writedate }</td></tr>
				<tr><td colspan="4">${list.contents }</td></tr>
				<tr><td>${list.like }</td><td colspan="2">${list.dislike }</td><td class="reviewreport">신고</td></tr>
			</table>
		</c:forEach>
	</c:if>




	<!-- ******** 푸터 ********* -->
	<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>