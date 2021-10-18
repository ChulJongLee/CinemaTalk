<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/personinfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<!-- maintop -->
	<div id="personinfotop">
		<div id="personpic">
			<img src="${dto.person_pic}" alt="${dto.peopleNm}사진" width="200px">
		</div>
		
		<div id="personinfo">
			<ul>
				<li>
					<span class="pinfo pname">${dto.peopleNm} ${dto.peopleNmEn}</span>
				</li>
				<li>
					<span class="pinfo">${dto.nationality}</span>
				</li>
				<li>
					<span class="pinfo">${dto.person_bdate}</span>
				</li>
			</ul>
		</div>
	</div>
	
	<hr style="width:85%;height:2px;border:none;align:center;"> 
	<!-- mainbottom -->
	<div id="personinfobottom">
	
		<!-- personfilmo -->
		<div id="personfilmo">
			<div class="subtitle2"><h5><strong>인물 필모그래피</strong></h5></div>
			<c:forEach var="item" items="${list}">
				<div class="posterandname">	
				<ul>
					<li><a href="/moviedetail/${item.movieCd}"><img src="${item.poster}" alt="${item.movieNm}포스터" id="poster" width="115px"></a></li>
					<li><span class="col-12" id="moviename">${item.movieNm}</span></li>
				</ul>
				</div>
			</c:forEach>
			
				<div id="pag">
				<nav aria-label="..." id="paging">
					<ul class="pagination">

						<!-- 이전 버튼 -->
						<c:if test="${page.prev==false}">
							<li class="page-item disabled"><a class="page-link" href="/personinfo/${dto.peopleCd}?currPage=${page.startBlock-1}">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${page.prev==true}">
							<li class="page-item"><a class="page-link" href="/personinfo/${dto.peopleCd}?currPage=${page.startBlock-1}">&laquo;</a>
							</li>
						</c:if>

						<!-- 페이지 번호 -->
						<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
							<c:if test="${index==page.currPage}">
								<li class="page-item active" aria-current="page"><a class="page-link"><c:out value="${index}" /></a></li>
							</c:if>
							<c:if test="${index!=page.currPage }">
								<li class="page-item" aria-current="page"><a class="page-link" href="/personinfo/${dto.peopleCd}?currPage=${index}"><c:out value="${index}" /></a></li>
							</c:if>
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${page.next == false}">
							<li class="page-item disabled"><a class="page-link" href="/personinfo/${dto.peopleCd}?currPage=${page.endBlock+1}">&raquo;</a>
							</li>
						</c:if>
						<c:if test="${page.next == true}">
							<li class="page-item"><a class="page-link" href="/personinfo/${dto.peopleCd}?currPage=${page.endBlock+1}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
				</div>
		</div>
		
		<!-- related person -->
		<div id="relatedperson">
			<div class="subtitle2"><h5><strong>연관 배우</strong></h5></div>
			<c:forEach var="item" items="${list2}" begin="0" end="14">		
					<div class="pictureandname">
						<ul>
							<li><a href="/personinfo/${item.peopleCd}"><img src="${item.person_pic}" alt="${item.peopleNm}사진" width="113px"></a></li>
							<li><span>${item.peopleNm}</span></li>
						</ul>
					</div>			
			</c:forEach>
		</div>
		
	</div>

</body>
</html>