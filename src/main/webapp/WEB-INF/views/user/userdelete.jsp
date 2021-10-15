<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result >= 0}">
			<script>
				alert('회원 탈퇴 완료');
				location.href = "/";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('회원 탈퇴 실패');
				location.href = "/mypage";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>