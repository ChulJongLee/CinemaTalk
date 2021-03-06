<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="433638546150-no026cnkth0e3sgb3makpb1kdrhdb5qd.apps.googleusercontent.com"> 
<!-- Kakao Login Js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Google Login Js --> 
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Naver Login Js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!--카카오 -->
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
	<!-- 구글 -->
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
</head>
<body>
	<div class="container">
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
						<td><input class="form-control" type="text" id="user_id" name="user_id" maxLength="20"></td>
						<td style="width: 110px;"><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td><input class="form-control" type="password" id="user_pwd" name="user_pwd" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
						<td><input class="form-control" type="password" id="user_pwd2" name="user_pwd2" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>닉네임</h5></td>
						<td><input class="form-control" type="text" id="user_nickname" name="user_nickname" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td><input class="form-control" type="email" id="user_email" name="user_email" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>생일</h5></td>
						<td><input class="form-control" type="text" id="user_bdate" name="user_bdate" maxLength="20"></td>
					</tr>
					<tr>
						<td style="text-align: middle" colspan="3"><input class="btn btn-primary pull-right" type="submit" value="회원가입"></td>
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
	
	</div>
</body>
</html>