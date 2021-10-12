<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/personinfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
	<!-- maintop -->
	<div id="personinfotop">
		<div id="personinfo">
			<ul>
				<li>
					<span>${dto.peopleNm} ${dto.peopleNmEn}</span>
				</li>
				<li>
					<span>${dto.nationality}</span>
				</li>
				<li>
					<span>${dto.person_bdate}</span>
				</li>
			</ul>
		</div>
		<div id="personpic">
			<img src="${dto.person_pic}" alt="${dto.peopleNm}사진" width="200px">
		</div>
	</div>
	
	<!-- mainbottom -->
	<div id="personinfobottom">
	
		<!-- personfilmo -->
		<div id="personfilmo">
			<p>필모그래피</p>
			<c:forEach var="item" items="${list}">
				<div class="posterandname">	
				<ul>
					<li><a href="/moviedetail/${item.movieCd}"><img src="${item.poster}" alt="${item.movieNm}포스터" width="115px"></a></li>
					<li><span class="col-12">${item.movieNm}</span></li>
				</ul>
				</div>
			</c:forEach>
			
			<div>
				
			</div>
		</div>
		
		<!-- related person -->
		<div id="relatedperson">
			<p>관련 인물</p>
			<c:forEach var="item" items="${list2}">		
					<div class="pictureandname">
						<ul>
							<li><a href="/personinfo/${item.peopleCd}"><img src="${item.person_pic}" alt="${item.peopleNm}사진" width="113px"></a></li>
							<li><span>${item.peopleNm}</span></li>
						</ul>
					</div>			
			</c:forEach>
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>