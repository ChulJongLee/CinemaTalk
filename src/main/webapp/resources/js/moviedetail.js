/**
 * 
 */
$('#myTabs a').click(function(e) {
 e.preventDefault()
 $(this).tab('show')
})

$('.starRating span').hover(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	});

$('.starRating span').click(function(){
	 var index = $(this).index();
	  $("#starPoint").val(index + 1);
	  /*var starValue = '별점 : '+ $(this.score).val();*/
	  console.log(index/2);
	 /* $('.starRating p').html(index/2);*/
	 console.log($("#movieCd").val())
	 
	  var params = {
	          rate : index/2
	          , movieCd : $("#movieCd").val()
	          /*, user_no : $("#user_no").val()*/
	    }
	  
	    
	    $.ajax({
	          type : "POST",            // HTTP method type(GET, POST) 형식이다.
	          url : "/movieRate",      // 컨트롤러에서 대기중인 URL 주소이다.
	          data : params,            // Json 형식의 데이터이다.
	          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	              // 응답코드 > 0000
	              alert(res.result);
	          },
	          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	          }
	      });
	});