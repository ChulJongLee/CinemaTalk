<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mypagemain.css">
</head>
<body>

	<div id="mypage"><h1><strong>마이 페이지</strong></h1></div>
	
	<div id="user_info">
		<div class="p-wrapper"><p align="center"><b>나의 정보</b></p></div>
		<div id="userinfolist">
			<div id="person">
				<div id="personid">${userdto.user_id} 님</div>
				<div id="modifyinfo"><a href="/mypage/userinfo" style="color:gold">회원 정보 보기</a></div>
			</div>
			<div id="hour">
				<div><img src="/resources/img/time.png" width="50px"></div>
				<div>${watchHour}시간 감상</div>
			</div>
		</div>
	</div>
	
	<div id="myCollection">
		<div class="p-wrapper"><p align="center"><a href="/mypage/mycollection"><b>나의 컬렉션</b></a></p></div>
		<div id="collectionlist-wrapper">
		<c:forEach var="item" items="${movielist}">
			<div class="collectionlist" onclick="location.href='/moviedetail/${item.movieCd}'">
				<img src="${item.poster}" alt="${item.movieNm}포스터" width="213px" height="300px"><br> 
				<div class="moviename">${item.movieNm}</div>
				<div class="rank"><img src="/resources/img/star1.png" alt="별" width="15px"> ${item.rank}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="myReview">
		<div class="p-wrapper"><p align="center"><a href="/mypage/myreview"><b>나의 리뷰</b></a></p></div>
		<ul id="reviewlist">
		<c:forEach var="list" items="${reviewlist}">
				<li id="contents"><input type="hidden" value="${list.contentno}" class="contentnodistinct">
					<div id="id">${list.title}</div>
					<div id="contentedit">
						<div id="modify">
							<button type="button" class="modifybtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-whatever="t">
								<i class="fas fa-edit"></i>
							</button>
						</div>
						<div id="delete">
							<button class="deletebtn" value="${list.contentno}">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div id="date">${list.writedate}</div>

					<div class="content">${list.contents}</div>

					<div id="like">
						<button class="likebtn" value="${list.contentno}" disabled>
							<div>
								<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
							</div>
							<div>${list.like}</div>
						</button>
					</div>
					<div id="dislike">
						<button class="dislikebtn" value="${list.contentno}" disabled>
							<div>
								<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
							</div>
							<div>${list.dislike}</div>
						</button>
					</div> 
					
					<!-- 리뷰 수정 Modal -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel" style="color: black;">리뷰 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<form action="/mypage/reviewmodify/{movieCd}" method="post">
									<div class="modal-body">
										<input type="hidden" value="${sessionScope.user.user_no}" name="userno"> <input type="hidden" name="contentno" class="contentval"> <label for="modaltext">리뷰</label>
										<textarea id="modaltext" name="contents" rows="10" cols="50"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary btn-sm"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">수정하기</button>
									</div>
								</form>
							</div>
						</div>
					</div> 
					
					<!-- 리뷰 신고 Modal -->
					<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel" style="color: black;">신고하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form action="/mypage/reviewreport/{movieCd}" method="post">
									<div class="modal-body">
										<input type="hidden" name="contentno" class="contentval">

										<input type="radio" name="reportreason" id="f1" value="ad">
										<label for="f1" style="color: black">광고 및 도배</label><br>
										<input type="radio" name="reportreason" id="f2" value="curse">
										<label for="f2" style="color: black">욕설</label><br> <input
											type="radio" name="reportreason" id="f3" value="spoiler">
										<label for="f3" style="color: black">스포일러 노출</label><br>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">신고하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					
			</c:forEach>
		</ul>
	</div>
	
	<div id="myContents">
		<div class="p-wrapper"><p align="center"><b>나의 게시글</b></p></div>
		<div id="mycontentlist-wrapper"><a href="/mypage/mycontent?user_id=${userdto.user_id}">내가 쓴 게시글 보러 가기</a></div>
	</div>
		
	<div id="rate_statistics">
		<div class="p-wrapper"><p align="center"><b>별점 분포</b></p></div>
		<div id="canvas-wrapper"><canvas id="myChart" width="900px" height="300px"></canvas></div>
		<div id="rate">
			<div id="rateavg">
					<div><b>${ratedto.rate}</b></div>
					<div>별점 평균</div>
			</div>
			<div id="ratenum">
					<div><b>${ratedto.user_no}</b></div>
					<div>평가 수</div>
			</div>
		</div>
	</div>
	
	<div id="fav_actor">
		<div class="p-wrapper"><p align="center"><b>선호 배우</b></p></div>
		<div id="actor-wrapper">
		<c:forEach var="item" items="${actorinfolist}">
			<div class="actorlist" onclick="location.href='/personinfo/${item.peopleCd}'">
				<div class="personimg"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></div>
				<div class="personname">${item.peopleNm} - ${item.peopleNmEn}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_director">
		<div class="p-wrapper"><p align="center"><b>선호 감독</b></p></div>
		<div id="director-wrapper">
		<c:forEach var="item" items="${directorinfolist}">
			<div class="directorlist" onclick="location.href='/personinfo/${item.peopleCd}'">
				<div class="personimg"><img src="${item.person_pic}" alt="${item.peopleNm}사진"></div>
				<div class="personname">${item.peopleNm} - ${item.peopleNmEn}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_genre">
		<div class="p-wrapper"><p align="center"><b>선호 장르</b></p></div>
		<div id="genre-wrapper">
		<c:forEach var="item" items="${genrelist}">
			<div class="genrelist">
				<div class="gernrename"><b>${item.genreNm}</b></div>
				<div class="genrenum">${item.rank}편</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="fav_nations">
		<div class="p-wrapper"><p align="center"><b>선호 국가</b></p></div>
		<div id="nation-wrapper">
		<c:forEach var="item" items="${nationlist}">
			<div class="nationlist">
				<div class="nationname"><b>${item.repNationNm}</b></div>
				<div class="nationnum">${item.rank}편</div>
			</div>
		</c:forEach>
		</div>
	</div>


<script>
    var context = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(context, {
            	type: 'bar',
        		data: {
        			labels: ['0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0'],
        			datasets: [{
        				label: '평가 수',
        				fill: true,
        				data: [${arr[0]}, ${arr[1]}, ${arr[2]}, ${arr[3]}, ${arr[4]}, ${arr[5]}, ${arr[6]}, ${arr[7]}, ${arr[8]}, ${arr[9]}],
        				backgroundColor: 'gold',
        				borderColor: 'rgba(255, 206, 86, 1)',
        				borderWidth: 1
        			}]
        		},
        		options: {
        			legend: {
        				display: false
        			},
        			responsive: true,
        			scales: {
        				xAxes: [{
        					ticks:{
        						fontSize : 20
        					}
        				}],
        				yAxes: [{
        					ticks: {
        						beginAtZero: true,
        						stepSize : 10,
        						fontSize : 10
        					}
        				}]
        			},
        		}
        	});
</script>  
<script src="/resources/js/mypagemain.js"></script>     
</body>
</html>