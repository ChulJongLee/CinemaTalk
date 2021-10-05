<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/bestscenemain.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- ******** 헤더 ********* -->
	<%-- <%@ include file="header.jsp" %> --%>
	
	<!-- 영화정보 & 카테고리 -->
	<%@ include file="movieinfotop.jsp" %>

	<section>		 
		<div id="bestscene" class="sceneimg">
			<h3><a href="bestscenelist" id="bestscenebtn" class="scenebtn">최고장면</a></h3>
			
			
		
		</div>
		<div id="worstscene" class="sceneimg">
			<h3><a href="bestscenelist" id="worstscenebtn" class="scenebtn">최악장면</a></h3>
			
			
		
		</div>	
	</section>
	<section>
		<h3><a href="famouslinelist" id="famouslinebtn">명대사</a></h3>
		<div class="bestreview">
       		<c:if test="${famouslinelist==null }">              		
         		자료가 없습니다.
         	</c:if>
         	<c:if test="${famouslinelist!=null }">
         		<c:forEach var="list" items="${famouslinelist }">
					<table class="bestreviewtable">
						<tr><td colspan="3" width="30%">${list.userid }아이디자리</td><td id="date">${list.writedate }</td></tr>
						<tr><td id="content" colspan="4">${list.contents }</td></tr>
						<tr><td width="10%">${list.like }</td><td width="10%">${list.dislike }</td><td colspan="2" id="report">신고</td></tr>
					</table>
				</c:forEach>
         	</c:if>                            
        </div>
	</section>


	<!-- ******** 푸터 ********* -->
	<%-- <%@ include file="footer.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>