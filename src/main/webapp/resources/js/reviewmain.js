/**
 * 
 */

$('.likebtn').click(function() {

	var params = {
			contentno : $(this).attr('value')
	}
//	console.log(params);
	
	$.ajax({
		type : "POST",
		url : "/like",
		data : params,
		success : function(res) {
//			alert(res.result);
//			$('#contentslist').load("reviewmain #contentslist");
//			$('.likebtn').attr('value').load("/reviewmain .likebtn");
//			$('#like').load(location.href+"#like");
			location.reload();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});