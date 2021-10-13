/**
 * 
 */

$('.likebtn').click(function() {

	var params = { contentno : $(this).attr('value') }

	$.ajax({
		type : "POST",
		url : "/like",
		data : params,
		success : function(res) {
//			alert(res.result);
//			$('#contentslist').load("reviewmain #contentslist");
//			$('.likebtn').attr('value').load("/reviewmain .likebtn");
//			$('.likebtn').load("/reviewmain .likebtn");
//			$('#like').load(location.href+"#like");
			location.reload(res.result);	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});


$('.dislikebtn').click(function() {

	var params2 = { contentno : $(this).attr('value') }

	$.ajax({
		type : "POST",
		url : "/dislike",
		data : params2,
		success : function(res) {

			location.reload(res.result);	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});



$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	console.log("무비코드무비코드무비코드무비코드무비코드무비코드무비코드무비코드"+movieCd);
	let no=$(this).attr('value');
	location.href="/moviedetail/"+movieCd+"/reviewdelete/"+no;
});


$('.modifybtn').click(function(){
//	$(this).attr('value').remove('#content');
	
	
});


