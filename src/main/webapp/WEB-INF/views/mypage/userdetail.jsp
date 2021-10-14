<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$().ready(function(){
	
	$('#userdel').click(function(){
		
		location.href="/mypage/deleteuser";
	});
	$('#usermodify').click(function(){
		
		location.href="/mypage/modifyprofileform";
	});
})
</script>
<link rel="stylesheet" href="/resources/css/userdetail.css">
</head>
<body>

	<div id="subtitle"><h1><strong>회원 정보</strong></h1></div>
	
	<div id="user_info">
		<form>
			<ul>
				<li>
					<label for="user_id">아이디</label> <input type="text" name="user_id" value="${user.user_id}" readonly>
				</li>
				<li>
					<label for="user_pwd">패스워드</label> <input type="password" name="user_pwd" maxLength="20" value="${user.user_pwd}" readonly>
				</li>
				<li>
					<label for="user_nickname">닉네임</label> <input type="text" name="user_nickname" value="${user.user_nickname}" readonly>
				</li>
				<li>
					<label for="user_email">이메일</label> <input type="text" name="user_email" value="${user.user_email}" readonly>
				</li>
				<li>
					<label for="user_bdate">생년월일</label> <input type="text" name="user_bdate" value="${user.user_bdate}" readonly>
				</li>
				<li>
					<input type="hidden" name="user_no" value="${user.user_no}">
					<button type="button" id="usermodify">회원 정보 수정</button>
					<button type="button" id="userdel">회원 탈퇴</button></li>
				</ul>
		</form>
	</div>

</body>
</html>