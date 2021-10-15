<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- <meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="433638546150-no026cnkth0e3sgb3makpb1kdrhdb5qd.apps.googleusercontent.com"> 
Kakao Login Js
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
Google Login Js 
<script src="https://apis.google.com/js/platform.js" async defer></script>
Naver Login Js
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
카카오
<script>
		window.Kakao.init("89b7b4570ff6898a5495c52960979021");
 //카카오 로그인
		  function kakaoLogin() {
			    Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  console.log(response)
			          },
			          fail: function (error) {
			            console.log(error)
			          },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      }
			    })
			  }
			//카카오로그아웃  
			function kakaoLogout() {
			    if (Kakao.Auth.getAccessToken()) {
			      Kakao.API.request({
			        url: '/v1/user/unlink',
			        success: function (response) {
			        	console.log(response)
			        },
			        fail: function (error) {
			          console.log(error)
			        }
			      });
			    }
			  };
	</script>
	구글
	<script>
	//구글 로그인
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
	
	//구글 로그아웃
	  function signOut(){
         gapi.auth2.getAuthInstance().disconnect(); 
      }
    </script>
    <script type="text/javascript">
    	function idcheck(){
    		$.ajax({
    			url:"/cinematalk/idcheck",
    			type:"post",
    			dataType:"json",
    			data:{"user_id":$("#user_id").val()},
    			success:function(data){
    				if(data == 1){
    					alert("중복된 아이디입니다.");
    				}else if(data == 0){
    					$("#idcheck").attr("value","Y");
    					alert("사용가능한 아이디입니다.")
    				}
    			}
    		});
    	}
    </script>
    <script type="text/javascript">
		$(document).ready(function(){

			$("#submit").on("click", function(){
				if($("#user_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				if($("#user_pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pwd").focus();
					return false;
				}
				if($("#user_pwd2").val()==""){
					alert("비밀번호확인을 입력해주세요.");
					$("#user_pwd2").focus();
					return false;
				}
				if($("#user_nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#user_nickname").focus();
					return false;
				}
				if($("#user_email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				if($("#user_bdate").val()==""){
					alert("생일을 입력해주세요.");
					$("#user_bdate").focus();
					return false;
				}
				if($("#idcheck").val()=="Y"){
					alert("회원가입을 축하드립니다.");
					return false;
				}
			});
		})
		function passwordCheckFunction(){
			var user_pwd = $("#user_pwd").val();
			var user_pwd2 = $("#user_pwd2").val();
			if(user_pwd != user_pwd2){
				$("#passwordCheckMessage").html("비밀번호가 서로 일치하지 않습니다.");
			}else{
				$("#passwordCheckMessage").html("");
				}
			}
	</script>
   --> 
<link rel="stylesheet" href="/resources/css/userjoin.css">   
</head>

<body>
	<div id="subtitle"><h1><strong>회원 가입</strong></h1></div>

	<div id="userjoinform">
		<form action="/logincheck" method="post" name="FormLogin" id="FormLogin">
			<ul>
				<li>
					<div class="first label"><label for="user_id"><b>아이디</b></label></div>
					<div class="first input"><input type="text" name="user_id" id="user_id" value="${user.user_id}" placeholder="아이디를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요'"></div>
					<div class="first"><button type="button" id="check">중복 체크</button></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd"><b>패스워드</b></label></div> 
					<div class="input"><input type="password" name="user_pwd" id="user_pwd" maxLength="20" placeholder="6자 이상 20자 미만 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6자 이상 20자 미만 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd2"><b>패스워드 확인</b></label></div> 
					<div class="input"><input type="password" name="user_pwd2" id="user_pwd2" maxLength="20" placeholder="6자 이상 20자 미만 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6자 이상 20자 미만 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_nickname"><b>닉네임</b></label></div> 
					<div class="input"><input type="text" name="user_nickname" id="user_nickname" maxLength="20" placeholder="6자 이상 20자 미만 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6자 이상 20자 미만 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_email"><b>이메일</b></label></div> 
					<div class="input"><input type="text" name="user_email" id="user_email" maxLength="20" placeholder="6자 이상 20자 미만 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6자 이상 20자 미만 입력'"></div>
				</li>
				<li>
					<div class="label"><label for="user_bdate"><b>생년월일</b></label></div> 
					<div class="input"><input type="text" name="user_bdate" id="user_bdate" maxLength="20" placeholder="6자 이상 20자 미만 입력" onfocus="this.placeholder=''" onblur="this.placeholder='6자 이상 20자 미만 입력'"></div>
				</li>
				<li>
					<div class="loginbtn"><input type="button" class="button" value="회원 가입" onclick="CheckForm()"></div> 
				</li>
			</ul>
		</form>
	</div>

<%-- 	<div class="container">
		<form action="./userRegister" method="post">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원 등록 양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="user_id" name="user_id" maxLength="20" placeholder="아이디를 입력하세요"></td>
						<td style="width: 110px;"><button class="btn btn-primary" onclick="idcheck();" type="button" value="N">중복체크</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>패스워드</h5></td>
						<td><input class="form-control" type="password" id="user_pwd" name="user_pwd" onkeyup="passwordCheckFunction();" maxLength="20" placeholder="비밀번호를를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>패스워드 확인</h5></td>
						<td><input class="form-control" type="password" id="user_pwd2" name="user_pwd2" onkeyup="passwordCheckFunction();" maxLength="20" placeholder="동일한 비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>닉네임</h5></td>
						<td><input class="form-control" type="text" id="user_nickname" name="user_nickname" maxLength="20" placeholder="닉네임을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td><input class="form-control" type="email" id="user_email" name="user_email" maxLength="20" placeholder="이메일을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>생년월일</h5></td>
						<td><input class="form-control" type="text" id="user_bdate" name="user_bdate" maxLength="20" placeholder="ex)2000-01-01"></td>
					</tr>
					<tr>
						<td style="text-align: right" colspan="3"><h5 style="color:red;" id="passwordCheckMessage"></h5><input class="btn btn-primary pull-right" id="submit" type="submit" value="회원가입"></td>
					</tr>
					<tr>
					<a href="javascript:kakaoLogin();"><img src="${pageContext.servletContext.contextPath }/resources/dist/img/kakao_login_medium_narrow.png"></a>
					<a href="javascript:kakaoLogout();"><img src="${pageContext.servletContext.contextPath }/resources/dist/img/kakao_login_medium_narrow.png"></a>
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					<div class="g-signin2" data-onsuccess="signOut" data-theme="dark"></div>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div> --%>
</body>
</html>