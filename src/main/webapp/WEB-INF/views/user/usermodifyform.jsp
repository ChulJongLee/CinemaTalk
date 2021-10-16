<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/usermodifyform.css">
<body>
		
	<div id="subtitle"><h1><strong>회원 정보 수정</strong></h1></div>
					
	<div id="user_info">
		<form action="/modifyprofileresult" method="post" name="submitform" id="submitform">
			<ul>
				<li>
					<div class="first label"><label for="user_id"><b>아이디</b></label></div>
					<div class="first input"><input type="text" name="user_id" value="${user.user_id}" readonly></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd"><b>패스워드</b></label></div> 
					<div class="input"><input type="password" name="user_pwd" id="user_pwd" maxLength="20" placeholder="비밀번호를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요'"></div>
				</li>
				<li>
					<div class="label"><label for="user_pwd2"><b>패스워드 확인</b></label></div> 
					<div class="input"><input type="password" name="user_pwd2" id="user_pwd2" maxLength="20" placeholder="비밀번호를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요'"></div>
				</li>
				<li>
					<div class="label"><label for="user_nickname"><b>닉네임</b></label></div> 
					<div class="input"><input type="text" name="user_nickname" id="user_nickname" value="${user.user_nickname}"></div>
				</li>
				<li>
					<div class="label"><label for="user_email"><b>이메일</b></label></div>  
					<div class="input"><input type="text" name="user_email" value="${user.user_email}" readonly></div> 
				</li>
				<li>
					<div class="label"><label for="user_bdate"><b>생년월일</b></label></div>  
					<div class="input"><input type="date" name="user_bdate" id="user_bdate" value="${user.user_bdate}" style="width:200px"></div> 
				</li>
				<li>
					<input type="hidden" name="user_no" value="${user.user_no}">
					<div class="modifybtn"><input type="button" class="button" value="수정" onclick="CheckForm()"></div> 
					<div class="modifybtn"><input type="reset" class="button" value="취소"></div> 
				</li>
			</ul>
		</form>
	</div>
	
<script>
    function CheckForm() {
      var pwd1 = document.getElementById('user_pwd').value;
      var pwd2 = document.getElementById('user_pwd2').value;
      var nickname = document.getElementById('user_nickname').value;
      var bdate = document.getElementById('user_bdate').value;
      
      if(pwd1.length < 6) {
          alert('비밀번호는 6글자 이상이어야 합니다.');
          return false;
      }
      
      if(pwd1.length > 20) {
          alert('비밀번호는 20글자 이하이어야 합니다.');
          return false;
      }
      
      if(pwd1 != pwd2) {
        alert('비밀번호가 일치 하지 않습니다.');
        return false;
      }

      if(nickname.length < 1){
    	  alert('닉네임을 입력하세요.');
          return false;
      }
      
      if(bdate.length != 10){
    	  alert('생년월일을 형식에 맞게 입력하세요.')
    	  return false;
      }

  	  document.submitform.submit();
    }
 </script>
</body>
</html>