<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<div>
		<h1>회원 정보 수정</h1>
		<div id="user_info">
			<form action="/modifyprofileresult" method="post">
				<ul>
					<li>
						<label for="user_id">아이디</label>
						<input type="text" name="user_id" value="${user.user_id}" readonly>
					</li>
					<li>
						<label for="user_pwd">패스워드</label>
						<input type="password" name="user_pwd" maxLength="20" value="${user.user_pwd}">
					</li>
					<li>
						<label for="user_pwd">패스워드 확인</label>
						<input type="password" name="user_pwd2" maxLength="20" value="${user.user_pwd}">
					</li>
					<li>
						<label for="user_nickname">닉네임</label>
						<input type="text" name="user_nickname" value="${user.user_nickname}">
					</li>
					<li>
						<label for="user_email">이메일</label>
						<input type="text" name="user_email" value="${user.user_email}" readonly>
					</li>
					<li>
						<label for="user_bdate">생년월일</label>
						<input type="text" name="user_bdate" value="${user.user_bdate}">
					</li>
					<li>
						<input type="hidden" name="user_no" value="${user.user_no}">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>