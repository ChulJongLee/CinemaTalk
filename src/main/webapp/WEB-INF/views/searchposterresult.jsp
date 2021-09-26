<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="포스터" src="${poster}"><br>
	
	<c:forEach var="item" items="${list}">
		영화명(국문) : ${item.title}<br>
		영화명(영문) : ${item.titleEng}<br>
		상영시간 : ${item.runtime }<br>
		키워드 : ${item.keywords }<br>
		<%-- 줄거리 : ${item.plots.plot.plotText } --%>
		
		
		<c:forEach var="item2" items="${item.plots.plot}">
			줄거리 : ${item2.plotText }
		</c:forEach>
				<hr>
	</c:forEach>
	
	
</body>
</html>