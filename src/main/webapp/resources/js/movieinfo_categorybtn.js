/**
 * 
 */


 // 메뉴 버튼 누르면
let menubtn = document.getElementsByClassName('category'); // menubtn에 배열로 저장.

	for(let i=0; i<menubtn.length; i++){
		
		menubtn[i].onclick=function(){		
			
			if(this.id == 'info'){ 					// 영화 정보 게시판
				location.href="movieinfomain";
				
			}else if(this.id == 'review_board'){ 	// 리뷰 게시판
				location.href="reviewmain";
				
			}else if(this.id == 'best_board'){		// 참여 게시판
				location.href="bestscenemain";
				
			}else{
				location.href="userforumlist";		// 자유 게시판
			}
		}
	}