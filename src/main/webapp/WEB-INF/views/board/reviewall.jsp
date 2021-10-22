<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/reviewall.css">
</head>
<body>
	<input type="hidden" value="${movieCd }" id="moviecd">
	<!-- ******* 전체 리뷰 ******* -->
	<section>
		<div id="allreview">
		<c:if test="${fn:length(allreview) == 0}">
               <h5>자료가 없습니다.</h5>
            </c:if>
            
            <c:if test="${fn:length(allreview) != 0}">
		 	<ul id="contentslist">
				<c:forEach var="list" items="${allreview }">
					<li id="contents">				
							<input type="hidden" value="${list.contentno }" class="contentnodistinct">
							<div id="id">${list.userid }${list.contentno }</div>
							<c:if test="${sessionScope.user.user_id==list.userid}">
								<div id="contentedit">						
									<div id="modify">
										<button type="button" class="modifybtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-whatever="t"> 
											<i class="fas fa-edit"></i>
										</button>
									</div>
									<div id="delete"><button class="deletebtn" value="${list.contentno }"><i class="fas fa-times"></i></button></div>						
								</div>
							</c:if>
							<div id="date">${list.writedate }</div>
							
									
						<!-- 스포일러 체크X -->		
						<c:if test="${list.spoiler==0 }">							
							<div class="content">${list.contents }</div>
						</c:if>
						<!-- 스포일러 체크O -->
						<c:if test="${list.spoiler==1 }">
							<input type="hidden" value="${list.contents }" class="spoilercontent">
							<div class="content2"><button type="button" class="spoilerbtn">스포일러 포함</button></div>
							<div class="content3" style="display:none"></div>
						</c:if>
							<div id="like">															
								<button class="likebtn" value="${list.contentno }">
									<div><i class="far fa-thumbs-up" id="likebtn2">&nbsp</i></div>
									<div class="likeresult"></div>
								</button>																			
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.contentno }">
									<div><i class="far fa-thumbs-down" id="dislikebtn2">&nbsp</i></div>
									<div class="dislikeresult"></div>
								</button>
							</div>
						<c:if test="${sessionScope.user.user_id!=null}">
							<div id="report">
								<button type="button" class="reportbtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" data-bs-whatever="t">
									<i class="fas fa-flag" id="reportbtn2"></i>
									신고
								</button>
							</div>
						</c:if>
							<c:if test="${sessionScope.user.user_id==null}">
								<div id="report">
									<button class="reportbtn" value="${list.contentno }" disabled="disabled">
										<i class="fas fa-flag" id="reportbtn2"></i>
										신고
									</button>
								</div>
							</c:if>
						</li>			
				</c:forEach>
			</ul>
			</c:if> 
		</div>



		<!-- 리뷰 수정 Modal -->
  		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">리뷰 수정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/moviedetail/${movieCd}/reviewmodify" method="post">
		      <div class="modal-body">	         
 		   	 	<input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		   	 	<input type="hidden" name="contentno"  class="contentval">   	 	
		    	<label for="modaltext">리뷰</label>
		    	<textarea id="modaltext" name="contents" rows="10" cols="50"></textarea>			    	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
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
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
 		      <form action="/moviedetail/${movieCd}/reviewreport" method="post">
		      <div class="modal-body">	         
		   	 	<input type="hidden" name="contentno" class="contentval">   	 	
		   	 	
		    	<input type="radio" name="reportreason" id="f1" value="ad">
	            <label for="f1" style="color: black">광고 및 도배</label><br>
	            <input type="radio" name="reportreason" id="f2" value="curse">
	            <label for="f2" style="color: black">욕설</label><br>
	            <input type="radio" name="reportreason" id="f3" value="spoiler">
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



	 
	<!-- 페이징  -->
	<nav aria-label="..." id="paging">
		<ul class="pagination">	
		
			<!-- 이전 버튼 -->		  
			<c:if test="${page.prev == false}">		
				<li class="page-item disabled">
			      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }">&laquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.prev == true}">		
				<li class="page-item">
			      <a class="page-link" href="reviewall?currPage=${page.startBlock-1 }">&laquo;</a>
			    </li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
				<c:if test="${index==page.currPage }">
					<li class="page-item active" aria-current="page">
			      		<a class="page-link" href="#"><c:out value="${index }"/></a>
			    	</li>				
				</c:if>
				<c:if test="${index!=page.currPage }">
					<li class="page-item" aria-current="page">
				      <a class="page-link" href="reviewall?currPage=${index }"><c:out value="${index }"/></a>
				    </li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:if test="${page.next == false}">
				<li class="page-item disabled">
			      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>
			<c:if test="${page.next == true}">
				<li class="page-item">
			      <a class="page-link" href="reviewall?currPage=${page.endBlock+1 }">&raquo;</a>
			    </li>
			</c:if>		
	  	</ul>
	</nav>	

</section>

<script src="/resources/js/reviewall.js"></script>
</body>
</html>