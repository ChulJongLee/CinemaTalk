/**
 * 
 */



// 리뷰 좋아요

//$(".contentnodistinct").each( function likeNhateresult() {
//		
//    	var contentno = $(this).attr('value');
//   
//    	console.log("$$$$$$$$$: "+contentno);
//	
//		$.ajax({
//	        type: "POST",
//			url: "/likeresult",
//	        data: {
//	        	content_no: $(this).attr('value')
//	        },
//	        success: function (likeresult) {
//	        	$(".likeresult").html(likeresult);	    
//	        	
//	        },
//		});
//	});
//
////	likeresult();
//
////$(function(){
//	$('.likebtn').click(function(){
//		 
//		var recip=$(event.currentTarget);
//		console.log("recip: "+recip);
//		var content_no = $(recip).attr('value');
//		console.log("content_no: "+content_no);
//		
////		var params = { content_no : $(this).attr('value') }
////		console.log("@@@@@@@@: "+params);
//   
//		    $.ajax({
//		          type : "POST",            // HTTP method type(GET, POST) 형식이다.
//		          url : "/like",      // 컨트롤러에서 대기중인 URL 주소이다.
//		          data : { content_no : $(recip).attr('value') } ,            // Json 형식의 데이터이다.
//		          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
//		              // 응답코드 > 0000
//		              alert(res.result);
//		              
//		              
////		              function likeNhateresult() {
////		          		
////		              	var content_no = $(this).attr('value');
////		             
////		              	console.log("$$$$$$$$$: "+content_no);
////		          	
////		          		$.ajax({
////		          	        type: "POST",
////		          			url: "/likeresult",
////		          	        data: {
////		          	        	content_no: $(this).attr('value')
////		          	        },
////		          	        success: function (likeresult) {
////		          	        	$(".likeresult").html(likeresult);	    
////		          	        	
////		          	        },
////		          		});
////		          	};
//		          	
//		          	
//		          },
//		          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
//		          }
//		      });  
//		});
////});
	


$(".contentnodistinct").each( function likeNhateresult() {
		
    	var contentno = $(this).attr('value');
    	//console.log(this);
    	let y= this;
//    	console.log("$$$$$$$$$: "+contentno);
	
    	 console.log('eeeeee', $(y).attr('value'));
    	
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: $(y).attr('value')
	        }
		    , dataType:"text"
	        , success: function (likeresult) {
	        	//console.log("------------");
	        //	console.log("$$$$$$$$$: "+contentno);
	        	console.log(likeresult);
	        	$(y).siblings('#like').find('.likeresult').html(likeresult);	
//	        	console.log("~~~~: ", y);
	        	
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
	        	//console.log("------------");
	        //	console.log("$$$$$$$$$: "+contentno);
	        	console.log(dislikeresult);
	        	$(y).siblings('#dislike').find('.dislikeresult').html(dislikeresult);	
//	        	console.log("~~~~: ", y);
	        	
	        },
		});
		
	});


// 좋아요 버튼
$(function(){
	
	$('.likebtn').click(function(event){
		 
		var recip=$(event.currentTarget);
		console.log("recip: "+recip);
		var content_no = $(recip).attr('value');
		console.log("########content_no: "+content_no);
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
		console.log("@@@@@@@@@@contentno: "+contentno);
		console.log("********: ", loc);
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (likeresult) {
	        	 console.log("^^^^^^^^: "+likeresult);
	        	$(loc).children('.likeresult').text(likeresult);
	        	
	        },
		});
	};
	
});


// 싫어요 버튼
$(function(){
	
	$('.dislikebtn').click(function(event){
		 
		var recip=$(event.currentTarget);
		console.log("recip: "+recip);
		var content_no = $(recip).attr('value');
		console.log("########content_no: "+content_no);
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
		console.log("@@@@@@@@@@contentno: "+contentno);
		console.log("********: ", loc);
		$.ajax({
	        type: "POST",
			url: "/dislikeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (dislikeresult) {
	        	 console.log("^^^^^^^^: "+dislikeresult);
	        	$(loc).children('.dislikeresult').text(dislikeresult);
	        	
	        },
		});
	};
	
});










	
	


// 리뷰 싫어요 
//$(function(){
//	$('.dislikebtn').click(function(){
//		 
//		var params = { content_no : $(this).attr('value') }
//		console.log(params);
//   
//		    $.ajax({
//		          type : "POST",            // HTTP method type(GET, POST) 형식이다.
//		          url : "/dislike",      // 컨트롤러에서 대기중인 URL 주소이다.
//		          data : params,            // Json 형식의 데이터이다.
//		          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
//		              // 응답코드 > 0000
//		              alert(res.result);
//		              dislikeresult();
//		          },
//		          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
//		          }
//		      });
//		  
//		});
//
//	function dislikeresult() {
//		$.ajax({
//	        type: "POST",
//			url: "/dislikeresult",
//	        data: {
//	        	content_no: $(".contentnodistinct").val()
//	        	
//	        },
//	        success: function (dislikeresult) {
//	        	$(".dislikeresult").html(dislikeresult);
//	        	
//	        },
//		});
//	};
//	dislikeresult();
//});



	
	
	
	










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


// 스포일러
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
	  