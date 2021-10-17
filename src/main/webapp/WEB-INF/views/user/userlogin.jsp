<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/userlogin.css">
</head>
<body> 

	<div id="subtitle"><h1><strong>로그인</strong></h1></div>
	
	<div id="loginform">
		<form action="/logincheck" method="post" name="FormLogin" id="FormLogin">
			<ul>
				<li>
					<div class="first label"><label for="user_id"><b>아이디</b></label></div>
					<div class="first input"><input type="text" name="user_id" id="user_id" value="${user.user_id}" placeholder="아이디를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요'"></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd"><b>패스워드</b></label></div> 
					<div class="input"><input type="password" name="user_pwd" id="user_pwd" maxLength="20" placeholder="비밀번호를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요'"></div>
				</li>
				<li>
					<div class="loginbtn"><input type="button" class="button" value="로그인" onclick="CheckForm()"></div> 
				</li>
			</ul>
		</form>
	</div>
	
<!-- 	<div class="container">
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/logincheck">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" name="user_id" maxlength="20" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="user_pwd" maxlength="20" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
	</div> -->
	
<script>
    function CheckForm() {
      var id = document.getElementById('user_id').value;
      var pwd = document.getElementById('user_pwd').value;
      
      if(id.length < 1) {
          alert('아이디를 입력하세요.');
          return false;
      }
      
      if(pwd.length < 1) {
          alert('비밀번호를 입력하세요.');
          return false;
      }
      
  	  document.FormLogin.submit();
    }
 </script>	
</body>
</html>