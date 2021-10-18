<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/userjoin.css">   
</head>

<body>
	<div id="subtitle"><h1><strong>회원 가입</strong></h1></div>

	<div id="userjoinform">
		<form action="/userregister" method="post" name="submitform" id="submitform">
			<ul>
				<li>
					<div class="first label"><label for="user_id"><b>아이디</b></label></div>
					<div class="first input"><input type="text" name="user_id" id="user_id" placeholder="4 ~ 12자의 영문, 숫자 입력" onfocus="this.placeholder=''" onblur="this.placeholder='4~12자의 영문, 숫자 입력'" onkeydown="inputIdCheck()"></div>
					<div class="first"><button type="button" id="idCheck" style="font-weight:bold;">중복 체크</button></div>
					<div class="first"><input type="hidden" name="idDuplication" id="idDuplication" value="unChecked"></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd"><b>비밀번호</b></label></div> 
					<div class="input"><input type="password" name="user_pwd" id="user_pwd" maxLength="20" placeholder="6 ~ 20자 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6 ~ 20자 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd2"><b>비밀번호 확인</b></label></div> 
					<div class="input"><input type="password" name="user_pwd2" id="user_pwd2" maxLength="20" placeholder="6 ~ 20자 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6 ~ 20자 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_nickname"><b>닉네임</b></label></div> 
					<div class="input"><input type="text" name="user_nickname" id="user_nickname" maxLength="20" placeholder="닉네임을 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='닉네임을 입력하세요'"></div>
				</li>
				<li>
					<div class="label"><label for="user_email"><b>이메일</b></label></div> 
					<div class="input"><input type="text" name="user_email" id="user_email" maxLength="20" placeholder="이메일을 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력하세요'"></div>
				</li>
				<li>
					<div class="label"><label for="user_bdate"><b>생년월일</b></label></div> 
					<div class="input"><input type="date" name="user_bdate" id="user_bdate" style="width:200px" min="1900-01-01" max="2021-13-13"></div>
				</li>
				<li>
					<div class="loginbtn"><input type="button" class="button" value="회원 가입" onclick="checkForm()" style="font-weight:bold;"></div> 
				</li>
			</ul>
		</form>
	</div>

<script src="/resources/js/userjoin.js"></script>
</body>
</html>