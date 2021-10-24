/**
 * 
 */



//좋아요, 싫어요 로드
$(".contentnodistinct").each( function likeNhateresult() {
    	var contentno = $(this).attr('value');
    	let y= this;
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: $(y).attr('value')
	        }		    	
	    	, success: function (res) {
	        	if(res.likecheck==1){
		    		$(y).siblings('.fucntionBtn').find('.forum_likebtn').prepend('<div class="thumbup"><i class="fas fa-thumbs-up" id="forum_likebtn2">&nbsp</i></div>');
	        	}else{
	        		$(y).siblings('.fucntionBtn').find('.forum_likebtn').prepend('<div class="thumbup"><i class="far fa-thumbs-up" id="forum_likebtn2">&nbsp</i></div>');	        		
	        	}
	        	$(y).siblings('.fucntionBtn').find('.likeresult').html(res.like);
	        	},	
		});
		
		$.ajax({
	        type: "POST",
			url: "/dislikeresult",
	        data: {
	        	content_no: $(y).attr('value')
	        }
			, success: function (res) {
	        	if(res.hatecheck==1){
		    		$(y).siblings('.fucntionBtn').find('.forum_dislikebtn').prepend('<div class="thumbdown"><i class="fas fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i></div>');
	        	}else{
	        		$(y).siblings('.fucntionBtn').find('.forum_dislikebtn').prepend('<div class="thumbdown"><i class="far fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i></div>');	        		
	        	}
	        	$(y).siblings('.fucntionBtn').find('.dislikeresult').html(res.dislike);	
	        },
		});
		
	});


// 좋아요 버튼
$(function(){
	$('.forum_likebtn').click(function(event){
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
		              likeresult(content_no, th, res.likecheck);
		          },
		          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		          }
		      });
		  
		});

	function likeresult(content_no, loc, likecheck) {
		var contentno=content_no;
		var likecheck=likecheck;
		$.ajax({
	        type: "POST",
			url: "/likeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (likeresult) {
	        	$(loc).children('.likeresult').text(likeresult.like);
	        	if(likecheck==1){
		        	$(loc).find('.thumbup').remove();
		    		$(loc).prepend('<div class="thumbup"><i class="fas fa-thumbs-up" id="forum_likebtn2">&nbsp</i></div>');
	        	}else{
	        		$(loc).find('.thumbup').remove();
	        		$(loc).prepend('<div class="thumbup"><i class="far fa-thumbs-up" id="forum_likebtn2">&nbsp</i></div>');	        		
	        	}
	        },
		});
	};
	
});

// 싫어요 버튼
$(function(){
	$('.forum_dislikebtn').click(function(event){
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
	              dislikeresult(content_no, th, res.hatecheck);
	          },
	          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	          }
	      });
		});

	function dislikeresult(content_no, loc, hatecheck) {
		var contentno=content_no;
		var hatecheck=hatecheck;
		$.ajax({
	        type: "POST",
			url: "/dislikeresult",
	        data: {
	        	content_no: contentno
	        },
	        success: function (dislikeresult) {
	        	$(loc).children('.dislikeresult').text(dislikeresult.dislike);
	        	if(hatecheck==1){
		        	$(loc).find('.thumbdown').remove();
		    		$(loc).prepend('<div class="thumbdown"><i class="fas fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i></div>');
	        	}else{
	        		$(loc).find('.thumbdown').remove();
	        		$(loc).prepend('<div class="thumbdown"><i class="far fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i></div>');	        		
	        	}
	        },
		});
	};
});

//신고하기(로그인 안했을때)
$('#reportBtn').click(function() {
	alert("로그인이 필요한 서비스 입니다.");
});
//신고버튼
$(document).ready(function(){
	$('#staticBackdrop3').on('shown.bs.modal', function(e){
		 var recip=$(e.relatedTarget);
		 var no = $(recip).parent().siblings('.contentnodistinct').attr('value');
		 let m=$(this);
		 m.find('.contentval').val(no);
	});
});	
