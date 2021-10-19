/**
 * 
 */


$('#userforuminsert').click(function(){
    location.href="userforuminsert";		
});

// 좋아요 버튼
$('.forum_likebtn').click(function() {
	
	var params = { content_no : $(this).attr('value') }
	
	$.ajax({
		type : "POST",
		url : "/forumlike",
		data : params,
		success : function(res) {
			alert(res.result);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
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
			alert(res.result);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
});

$(document).ready(function(){
	$('#staticBackdrop3').on('shown.bs.modal', function(e){
		 var recip=$(e.relatedTarget);
		 var no = $(recip).parent().siblings('.contentnodistinct').attr('value');
		 let m=$(this);
		 m.find('.contentval').val(no);
	});
});	
