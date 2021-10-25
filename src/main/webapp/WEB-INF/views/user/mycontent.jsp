<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/userforumlist.css">
<link rel="stylesheet" href="/resources/css/mycontent.css">
</head>
<body>
	<div id="subtitle">
		<h1><strong>나의 게시글</strong></h1>
	</div>
	
	<section>

		<div id="userforumwrap">
			<ul id="userforumboard">
				<c:forEach var="list" items="${userforumList}">
					<input type="hidden" value="${list.content_no}"
						class="contentnodistinct">
					<div id="listhead">
						<div id="number">${list.movieNm}</div>
						<div id="writedate">${list.content_date}</div>
						<div id="user_id">${list.user_nickname}</div>
					</div>
					<hr id="under_title" style="margin: 5px 0;">
					<li id="userforumlist">
						<div id="img_section">
							<c:if test="${list.imageName!=null && list.imageName!=''}">
								<img alt="이미지" src="/resources/upload/${list.imagePath}"
									class="forum_list_img"
									onClick="location.href='/moviedetail/${list.movieCd}/userforumdetail/${list.content_no}'">
							</c:if>
							<c:if test="${list.imageName==null}">
								<img alt="이미지" src="/resources/img/forum_noimg_blk.png"
									class="forum_list_img"
									onClick="location.href='/moviedetail/${list.movieCd}/userforumdetail/${list.content_no}'">
							</c:if>
						</div>
						<div id="titleNcontent"
							onClick="location.href='/moviedetail/${list.movieCd}/userforumdetail/${list.content_no}'">
							<div id="title">${list.content_title}</div>
							<div id="content">${list.content_content}</div>
						</div>
						<div id="functionBtns">
							<div class="fucntionBtn">
								<button class="forum_likebtn" value="${list.content_no}" disabled>
									<div>
										<i class="fas fa-thumbs-up" id="forum_likebtn2">&nbsp</i>${list.content_like}
									</div>
								</button>
							</div>
							<div class="fucntionBtn">
								<button class="forum_dislikebtn" value="${list.content_no}" disabled>
									<div>
										<i class="fas fa-thumbs-down" id="forum_dislikebtn2">&nbsp</i>${list.content_hate}
									</div>
								</button>
							</div>
<!-- 							<div class="fucntionBtn">
									<button type="button" class="forum_reportbtn"
										data-bs-toggle="modal" data-bs-target="#staticBackdrop2"
										data-bs-whatever="t">
										<i class="fas fa-flag" id="forum_reportbtn2"></i> 신고
									</button>
							</div> -->
						</div>
					</li>
					<hr id="under_title" style="margin: 5px 0;">
					
						<!-- 리뷰 신고 Modal -->
					<div class="modal fade" id="staticBackdrop3"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel"
										style="color: black;">신고하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form action="/moviedetail/${list.movieCd}/forumreport"
									method="post">
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
										<button type="button" class="btn btn-secondary btn-sm"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">신고하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</c:forEach>
			</ul>
		</div>


		<!-- 페이징  -->
		<nav aria-label="..." id="paging">
			<ul class="pagination">

				<!-- 이전 버튼 -->
				<c:if test="${page.prev == false}">
					<li class="page-item disabled"><a class="page-link"
						href="/mypage/mycontent?currPage=${page.startBlock-1}">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${page.prev == true}">
					<li class="page-item"><a class="page-link"
						href="/mypage/mycontent?currPage=${page.startBlock-1}">&laquo;</a>
					</li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach var="index" begin="${page.startBlock}"
					end="${page.endBlock }">
					<c:if test="${index==page.currPage}">
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="#"><c:out value="${index}" /></a></li>
					</c:if>
					<c:if test="${index!=page.currPage}">
						<li class="page-item" aria-current="page"><a
							class="page-link"
							href="/mypage/mycontent?currPage=${index}"><c:out
									value="${index }" /></a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${page.next == false}">
					<li class="page-item disabled"><a class="page-link"
						href="/mypage/mycontent?currPage=${page.endBlock+1}">&raquo;</a>
					</li>
				</c:if>
				<c:if test="${page.next == true}">
					<li class="page-item"><a class="page-link"
						href="/mypage/mycontent?currPage=${page.endBlock+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>

	</section>

<script src="/resources/js/userforumlist.js"></script>
</body>
</html>