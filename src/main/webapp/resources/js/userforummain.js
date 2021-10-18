/**
 * 
 */


// 좋아요 버튼
$('.forum_likebtn').click(function() {
	
	var params = { content_no : $(this).attr('value') }
	
	$.ajax({
		type : "POST",
		url : "/forumlike",
		data : params,
		success : function(res) {
			location.reload();	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});



// 싫어요
$('.forum_dislikebtn').click(function() {

	var params2 = { content_no : $(this).attr('value') }
	
	$.ajax({
		type : "POST",
		url : "/forumdislike",
		data : params2,
		success : function(res) {
			location.reload(res.result);	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});

$(document).ready(function(){
	$('#staticBackdrop2').on('shown.bs.modal', function(e){
		 var recip=$(e.relatedTarget);
		 var no = $(recip).parent().siblings('.contentnodistinct').attr('value');
		 let m=$(this);
		 m.find('.contentval').val(no);
	});
});	
