<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/movieinfo.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	
 <!-- 영화 정보 -->
	<section id="movieinfo">
		<!-- 영화 줄거리 -->
		<div id="moviesummary">
            <h3 class="title">줄거리</h3>
            <c:if test="${detail.plotText=='' }">
            	<p>등록된 줄거리가 없습니다.</p>
            </c:if>
			<p>${detail.plotText }</p>	
			<!-- 영화 트레일러 -->
			<div id="trailer">
	            <h3 class="title">트레일러</h3>
	            <iframe src="https://www.youtube.com/embed/aGZPviLMo7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        </div>			
		</div>

		<!-- 감독, 배우 -->	
		<div id="directorNactor">
			<!-- 감독 -->
			<div id="director">
                <h3 class="title">감독</h3>
                 <c:forEach var="item" items="${personInfo }">
                	<c:if test="${item.repRoleNm=='감독' && item.person_pic!='' }">
	                	<div class="imgY" onclick="location.href='/personinfo/${item.peopleCd }'">
	                	<img src="${item.person_pic}" alt="감독" class="person_pic"><br>
						<span class="personNm">${item.peopleNm }</span>
						</div>
					</c:if>
				</c:forEach><br>
                <c:forEach var="item" items="${personInfo }">
                	<c:if test="${item.repRoleNm=='감독' && item.person_pic=='' }">
                		<div class="imgN" onclick="location.href='/personinfo/${item.peopleCd }'">
							<span class="peopleNm">${item.peopleNm }<c:if test="${not status.last }">, </c:if></span>
						</div>
					</c:if>
				</c:forEach>
				
				
			</div>
			<!-- 배우 -->
			<div id="actor">
                <h3 class="title">배우</h3>
                <c:forEach var="item" items="${personInfo }" varStatus="status">
                	<c:if test="${item.repRoleNm=='배우' && item.person_pic!='' }">
                		<div class="imgY" onclick="location.href='/personinfo/${item.peopleCd }'">
							<img alt="배우사진" src="${item.person_pic }" class="person_pic"><br>
							<span class="peopleNm">${item.peopleNm }</span>
						</div>
					</c:if>
				</c:forEach><br>
				 <c:forEach var="item" items="${personInfo }" varStatus="status">
                	<c:if test="${item.repRoleNm=='배우' && item.person_pic=='' }">
                		<div class="imgN" onclick="location.href='/personinfo/${item.peopleCd }'">
							<span class="peopleNm">${item.peopleNm }<c:if test="${not status.last }">, </c:if></span>
						</div>
					</c:if>
				</c:forEach>
			</div>		
		</div>
		
		
	</section>
	
	
	<!-- ******** 푸터 ********* -->
	<%-- <%@ include file="footer.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>