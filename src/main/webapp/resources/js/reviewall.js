/**
 * 
 */
$('.deletebtn').click(function(){	
	let movieCd = $('#moviecd').val();
	console.log("무비코드무비코드무비코드무비코드무비코드무비코드무비코드무비코드"+movieCd);
	let no=$(this).attr('value');
	location.href="/moviedetail/"+movieCd+"/reviewdelete/"+no;
});