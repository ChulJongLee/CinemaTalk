<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/bestscenemain.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	


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
	         	<ul id="contentslist">
	         		<c:forEach var="list" items="${famouslinelist }">
						<li id="contents">
							<div id="id">${list.userid }아이디자리</div>
							<div id="date">${list.writedate }</div>
							<div id="content">${list.contents }</div>
							<div id="like"><i class="fas fa-thumbs-up"> ${list.like }</i></div>
							<div id="dislike"><i class="fas fa-thumbs-down"> ${list.dislike }</i></div>
							<div id="report"><button> <i class="fas fa-flag"> 신고</i></button></div>				
						</li>		
					</c:forEach>
				</ul>
         	</c:if>                            
        </div>
	</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>