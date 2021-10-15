/**
 * 
 */


// 좋아요 버튼
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



// 싫어요
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


// 삭제버튼
$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	console.log("무비코드무비코드무비코드무비코드무비코드무비코드무비코드무비코드"+movieCd);
	let no=$(this).attr('value');
	location.href="/moviedetail/"+movieCd+"/reviewdelete/"+no;
});


//수정하기
//$(document).ready(function(){

//	  $('.modifybtn').on('click', function(){
//	      $('#mymodal').modal('show');
//	      
//	      modal({backdrop: 'static', keyboard: false}).
//	  });
	  
//	  $('#mymodal').on('shown.bs.modal', function(e){
//		  
//		  console.log('hello');
//		  
//		  var recip=$(e.relatedTarget);
//		  let r=$(recip).parent().parent().siblings('.content').text();
//		  console.log(r);
//		  
//		  
//		 let m=$(this);
//		  m.find('#modaltext').val(r);
//		 
//	  });
//	 
//});

$(document).ready(function(){
	$('#staticBackdrop').on('shown.bs.modal', function(e){
	
		  var recip=$(e.relatedTarget);
		  console.log("recip:"+recip);
		  
		  var r=$(recip).parent().parent().siblings('.content').text();
		  console.log("r:"+r);
		  
		  var no = $(recip).parent().parent().siblings('.contentnodistinct').attr('value');
		  console.log("contentno:"+no);
		  // 변수 순서도 중요하다. 아니 근데 var는 호이스팅이 되는거 아닌가?
		  
		  
		 let m=$(this);
		  m.find('#modaltext').val(r);
		  m.find('#contentval').val(no);
	});
});
	
	  
//	  $(".modifycheckbtn").click(function(){
//	    $(".modal").fadeOut();
//	  });
//	  

