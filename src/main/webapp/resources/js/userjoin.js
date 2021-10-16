/**
 * 
 */
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();

if (dd < 10) {
   dd = '0' + dd;
}

if (mm < 10) {
   mm = '0' + mm;
} 
    
today = yyyy + '-' + mm + '-' + dd;
document.getElementById("user_bdate").setAttribute("max", today);

var id = document.getElementById('user_id').value;
var idcheck = document.getElementById('idDuplication').value;
var pwd1 = document.getElementById('user_pwd').value;
var pwd2 = document.getElementById('user_pwd2').value;
var nickname = document.getElementById('user_nickname').value;
var email = document.getElementById('user_email').value;
var bdate = document.getElementById('user_bdate').value;

function checkForm() {

    if(id.length < 1) {
        alert('아이디를 입력하세요.');
        return false;
    }
    
    if(idcheck != 'Checked') {
        alert('아이디 중복체크를 해주세요.');
        return false;
    }
    
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
    
    if(email.length < 1){
  	  alert('이메일을 입력하세요.');
        return false;
    }
    
    if(bdate.length != 10){
  	  alert('생년월일을 형식에 맞게 입력하세요.')
  	  return false;
    }

	  document.submitform.submit();
  }

function idCheck(){
	window.name = "parentForm";
	window.open("/idcheck", "checkform", "width=500, height=300, resizable=no, scrollbars=no");
}

function inputIdCheck(){
	idcheck = "unChecked";
}