/**
 * 
 */


// 좋아요 싫어요 토탈 
$(".contentnodistinct").each( function likeNhateresult() {
		
    	var contentno = $(this).attr('value');
    	let y= this;
    	
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: $(y).attr('value')
	        }
		    , dataType:"text"
	        , success: function (likeresult) {
	        	
	        	$(y).siblings('#like').find('.likeresult').html(likeresult);	       	
	        },
		});
		
		$.ajax({
	        type: "POST",
			url: "/dislikeresult",
	        data: {
	        	content_no: $(y).attr('value')
	        }
		    , dataType:"text"
	        , success: function (dislikeresult) {

	        	$(y).siblings('#dislike').find('.dislikeresult').html(dislikeresult);	
     	
	        },
		});
		
	});


// 좋아요 버튼
$(function(){
	
	$('.likebtn').click(function(event){
		 
		var recip=$(event.currentTarget);
		var content_no = $(recip).attr('value');
		let th=this;
   
		    $.ajax({
		          type : "POST",            // HTTP method type(GET, POST) 형식이다.
		          url : "/like",      // 컨트롤러에서 대기중인 URL 주소이다.
		          data : { content_no : $(recip).attr('value') },            // Json 형식의 데이터이다.
		          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		              // 응답코드 > 0000
		              alert(res.result);
		              likeresult(content_no, th);    
		          },
		          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		          }
		      });
		  
		});

	function likeresult(content_no, loc) {
				
		var contentno=content_no;
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (likeresult) {
	        	$(loc).children('.likeresult').text(likeresult);
	        	
	        },
		});
	};
	
});


// 싫어요 버튼
$(function(){
	
	$('.dislikebtn').click(function(event){
		 
		var recip=$(event.currentTarget);
		var content_no = $(recip).attr('value');
		let th=this;
   
		    $.ajax({
		          type : "POST",            // HTTP method type(GET, POST) 형식이다.
		          url : "/dislike",      // 컨트롤러에서 대기중인 URL 주소이다.
		          data : { content_no : $(recip).attr('value') },            // Json 형식의 데이터이다.
		          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		              // 응답코드 > 0000
		              alert(res.result);
		              dislikeresult(content_no, th);
		          },
		          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		          }
		      });		  
		});

	function dislikeresult(content_no, loc) {
				
		var contentno=content_no;
		$.ajax({
	        type: "POST",
			url: "/dislikeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (dislikeresult) {
	        	$(loc).children('.dislikeresult').text(dislikeresult);	        	
	        },
		});
	};
	
});





//삭제버튼 js
$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	let no=$(this).attr('value');
	location.href="/moviedetail/"+movieCd+"/reviewdelete/"+no;
});


//수정하기 js
$(document).ready(function(){
	$('#staticBackdrop').on('shown.bs.modal', function(e){
	
		  var recip=$(e.relatedTarget);	  		  
		  var r=$(recip).parent().parent().siblings('.content').text();		  
		  var r2=$(recip).parent().parent().siblings('.content3').text();		  
		  var no = $(recip).parent().parent().siblings('.contentnodistinct').attr('value');
		  
		  
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
		  var no = $(recip).parent().siblings('.contentnodistinct').attr('value');
  
		 let m=$(this);
		  m.find('.contentval').val(no);
	});
});	


//스포일러
$(document).ready(function(){
	$('.spoilerbtn').click(function(event){
		
		var recip=$(event.currentTarget);			
		var no = $(recip).parent().siblings('.spoilercontent').attr('value');
		
		$(recip).parent('.content2').attr("style", "display:none");
		$(this).hide();
		$(recip).parent().siblings('.content3').removeAttr('style');
		$(recip).parent().siblings('.content3').text(no);
		
	});
});	
