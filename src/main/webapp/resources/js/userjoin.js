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


function checkForm() {

	var id = document.getElementById('user_id').value;
	var idcheck = document.getElementById('idDuplication').value;
	var pwd1 = document.getElementById('user_pwd').value;
	var pwd2 = document.getElementById('user_pwd2').value;
	var nickname = document.getElementById('user_nickname').value;
	var email = document.getElementById('user_email').value;
	var bdate = document.getElementById('user_bdate').value;
	
	var checkNum = /[0-9]/;
	var checkEng = /[a-zA-Z]/;
	var checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
    if(id.length < 1){
        alert('아이디를 입력하세요.');
        return false;
    }
	
	if(id.length < 4) {
        alert('아이디는 4글자 이상이어야 합니다.');
        return false;
    }
    
    if(checkSpc.test(id) || checkKor.test(id)){
    	alert('아이디는 한글이나 특수문자를 포함할 수 없습니다.');
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
    
    if(!checkEmail.test(email)){
        alert('이메일 형식에 맞게 입력하세요.');
        return false;
    }
    
    if(bdate.length != 10){
  	    alert('생년월일을 형식에 맞게 입력하세요.')
  	    return false;
    }

	document.submitform.submit();
}


$(function() {
	$("#idCheck").click(function() {

		var user_id = $("#user_id").val(); 

		$.ajax({
			type : 'POST',
			url : "/idCheck",
			data : "user_id="+user_id,
			success : function(data) {
				if (data.cnt > 0) {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					$("#user_id").focus();

				} else if (user_id.length == 0){
					alert('아이디를 입력하세요.');
					$("#user_id").focus();
					
				} else {
					alert("사용가능한 아이디입니다.");

					$("#idDuplication").attr("value","Checked");
					$("#user_pwd").focus();

				}
			},
			error : function(error) {

				alert("error : " + error);
			}
		});
	});
});


function inputIdCheck() {
	document.getElementById('idDuplication').value = "unChecked";
}