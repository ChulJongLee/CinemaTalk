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

	var params = { contentno : $(this).attr('value') }
	console.log("params12: "+params);
	
	$.ajax({
		type : "POST",
		url : "/dislike",
		data : params,
		success : function(res) {

			location.reload(res.result);	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("로그인이 필요한 서비스 입니다.");
		}
	});
});



// 삭제버튼 js
$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	let no=$(this).attr('value');
	location.href="/moviedetail/"+movieCd+"/reviewdelete/"+no;
});


// 수정하기 js
$(document).ready(function(){
	$('#staticBackdrop').on('shown.bs.modal', function(e){
	
		  var recip=$(e.relatedTarget);	  
		  console.log("recip: "+recip);
		  
		  var r=$(recip).parent().parent().siblings('.content').text();
		  console.log("r: "+r);
		  
		  var r2=$(recip).parent().parent().siblings('.content3').text();
		  console.log("r2: "+r2);
		  
		  var no = $(recip).parent().parent().siblings('.contentnodistinct').attr('value');
		  console.log("no: "+no);

		  
		  let m=$(this);		  
		  if(r==""){
			  m.find('#modaltext').val(r2);
		  }else{
			  m.find('#modaltext').val(r);
		  }
		  
		  m.find('.contentval').val(no);
	});
});

// 신고하기
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


// 스포일러
$(document).ready(function(){
	$('.spoilerbtn').click(function(event){
		
		var recip=$(event.currentTarget);
		console.log("recip:"+recip);		
		
		var no = $(recip).parent().siblings('.spoilercontent').attr('value');
		  console.log("contentno:"+no);
		
		$(recip).parent('.content2').attr("style", "display:none");
		$(this).hide();
		$(recip).parent().siblings('.content3').removeAttr('style');
		$(recip).parent().siblings('.content3').text(no);
		
	});
});	
	  