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
					<div class="first label"><label for="user_id"><b>아이디</b></label></div>
					<div class="first input"><input type="text" name="user_id" value="${user.user_id}" readonly></div>
				</li>
				<li>
					<div class="label"><label for="user_nickname"><b>닉네임</b></label></div> 
					<div class="input"><input type="text" name="user_nickname" value="${user.user_nickname}" readonly></div>
				</li>
				<li>
					<div class="label"><label for="user_email"><b>이메일</b></label></div>  
					<div class="input"><input type="text" name="user_email" value="${user.user_email}" readonly></div> 
				</li>
				<li>
					<div class="label"><label for="user_bdate"><b>생년월일</b></label></div>  
					<div class="input"><input type="text" name="user_bdate" value="${user.user_bdate}" readonly></div> 
				</li>
				<li>
					<input type="hidden" name="user_no" value="${user.user_no}">
					<div class="btn"><button type="button" id="usermodify"><b>회원 정보 수정</b></button></div> 
					<div class="btn"><button type="button" id="userdel"><b>회원 탈퇴</b></button></div> 
				</li>
			</ul>
		</form>
	</div>

</body>
</html>