/**
 * 
 */
/**
 * 
 */

// 좋아요 버튼
$('.likebtn').click(function() {
	
	var params = { contentno : $(this).attr('value') }
	console.log("params: "+params);
	
	$.ajax({
		type : "POST",
		url : "/like",
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
$('.dislikebtn').click(function() {

	var params2 = { contentno : $(this).attr('value') }
	console.log("params12: "+params2);
	
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


//삭제버튼
$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	console.log("무비코드무비코드무비코드무비코드무비코드무비코드무비코드무비코드"+movieCd);
	let no=$(this).attr('value');
	location.href="/mypage/reviewdelete/"+no;
});


$(document).ready(function(){
	$('#staticBackdrop').on('shown.bs.modal', function(e){
	
		  var recip=$(e.relatedTarget);
		  console.log("recip:"+recip);
		  
		  var r=$(recip).parent().parent().siblings('.content').text();
		  console.log("r:"+r);
		  
		  var no = $(recip).parent().parent().siblings('.contentnodistinct').attr('value');
		  console.log("contentno:"+no);
		  		  
		 let m=$(this);
		  m.find('#modaltext').val(r);
		  m.find('.contentval').val(no);
	});
});


$(document).ready(function(){
	$('#staticBackdrop1').on('shown.bs.modal', function(e){
		
		  var recip=$(e.relatedTarget);
		  console.log("recip:"+recip);
 
		  var no = $(recip).parent().siblings('.contentnodistinct').attr('value');
		  console.log("contentno:"+no);
  
		 let m=$(this);
		  m.find('.contentval').val(no);
	});
});	