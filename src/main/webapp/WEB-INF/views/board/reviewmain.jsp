<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link rel="stylesheet" href="/resources/css/reviewmain.css">
 
</head>
<body>

	<!-- 영화정보 & 카테고리 -->
	<%-- <%@ include file="movieinfotop.jsp" %> --%>
	<input type="hidden" value="${detail.movieCd }" id="moviecd">
    <!-- ******** 베스트 리뷰 ******** -->
    <section id="bestsection">
<!--    <h3><a href="reviewall" id="bestreviewbtn">베스트 리뷰</a></h3>  -->
        <h1 id="bestreviewbtn">베스트 리뷰</h1>
        <div class="bestreview">
       		<c:if test="${bestreviewlist==null }">
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${bestreviewlist!=null }">
         	<ul id="contentslist">
         		<c:forEach var="list" items="${bestreviewlist }">
					<li id="contents">
						<div id="id">${list.userid }</div>
						<div id="date">${list.writedate }</div>
						
						
						<div class="content">${list.contents }</div>
						
						
						<%-- <div id="like"><button id="likebtn"> <i class="fas fa-thumbs-up"> ${list.like }</i></button></div>
						<div id="dislike"><button id="dislikebtn"> <i class="fas fa-thumbs-down"> ${list.dislike }</i></button></div>
						<div id="report"><button id="reportbtn"> <i class="fas fa-flag"> 신고</i></button></div>	 --%>
						<div id="like">
								<button class="likebtn" value="${list.contentno }">
									<div>
										<i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i>
									</div>
									<div>
										${list.like }
									</div>
								</button>				
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.contentno }">
									<div>
										<i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i>
									</div>
									<div>
										${list.dislike }
									</div>
								</button>
							</div>
							<div id="report">
								<button class="reportbtn" value="${list.contentno }">
									<i class="fas fa-flag" id="reportbtn2"></i>
									신고
								</button>
							</div>				
					</li>
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
    </section>

    <!-- ******** 일반 리뷰 ******** -->
    <section id="generalsection">
        <!-- <h3><a href="reviewall" id="generalreviewbtn">일반 리뷰</a></h3> -->
        <h1 id="generalreviewbtn">일반 리뷰</h1>
        <div class="generalreview">
       		<c:if test="${generalreviewlist==null }">              		
         		자료가 없습니다.
         	</c:if>
         	
         	<c:if test="${generalreviewlist!=null }">
         	<ul id="contentslist">
         		<c:forEach var="list" items="${generalreviewlist }">
						<li id="contents">				
							<div id="id">${list.userid }, ${list.contentno }</div>
							<div id="date">${list.writedate }</div>
									
														
							<div class="content">${list.contents }</div>
							
							
							<c:if test="${sessionScope.user.user_id!=null}">
								<div id="like">									
									<button class="likebtn" value="${list.contentno }">
										<div><i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i></div>
										<div>${list.like }</div>
									</button>		
								</div>
								<div id="dislike">
									<button class="dislikebtn" value="${list.contentno }">
										<div><i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i></div>
										<div>${list.dislike }</div>
									</button>
								</div>
							</c:if>
							
							<c:if test="${sessionScope.user.user_id==null}">						
								<div id="like">									
									<button class="likebtn" value="${list.contentno }" disabled="disabled">
										<div><i class="fas fa-thumbs-up" id="likebtn2">&nbsp</i></div>
										<div>${list.like }</div>
									</button>		
								</div>
								<div id="dislike">
									<button class="dislikebtn" value="${list.contentno }" disabled="disabled">
										<div><i class="fas fa-thumbs-down" id="dislikebtn2">&nbsp</i></div>
										<div>${list.dislike }</div>
									</button>
								</div>
							</c:if>
							
							<div id="report">
								<button class="reportbtn" value="${list.contentno }">
									<i class="fas fa-flag" id="reportbtn2"></i>
									신고
								</button>
							</div>
							
							<c:if test="${sessionScope.user.user_id==list.userid}">
								<div id="contentedit">
									<!-- <div id="modifycheck"><button class="modifycheckbtn"><i class="fas fa-check"></i></button></div>
									<div id="modifyreturn"><button class="modifyreturnbtn"><i class="fas fa-undo"></i></button></div> -->
									
									
<%--  								<div id="modify"><button class="modifybtn" value="${list.contentno }" data-toggle="modal" data-target="#mymodal" data-whatever="t"><i class="fas fa-edit"></i></button></div>  --%>
									<div id="modify">
										<button type="button" class="modifybtn" value="${list.contentno }" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-whatever="t"> 
											<i class="fas fa-edit"></i>
										</button>
									</div>
									<div id="delete"><button class="deletebtn" value="${list.contentno }"><i class="fas fa-times"></i></button></div>						
								</div>
							</c:if>
						</li>		
				</c:forEach>
			</ul>	
         	</c:if>                            
        </div>
        <div id="reviewallbtn">
        	<a href="/moviedetail/${detail.movieCd }/reviewall">모든 리뷰 보기</a>
        </div>
    </section>
    
    
<!--   		<div class="modal" id="mymodal">
		  <div class="modal-dialog" role="document">
			  <div class="modal_content">  -->
<%-- 			    <form action="/moviedetail/${detail.movieCd }/reviewmodify" method="post">    
 --%>			  		
<!--                      <input type="hidden" name="contentno">

				    <label for="modaltext">리뷰 수정</label>
				    <textarea id="modaltext" name="contents" rows="10" cols="80"></textarea>	
				    <button class="modifycheckbtn">수정확인</button>
					<button class="modifyreturnbtn">수정취소</button>							    
			    </form>
			  </div>
		  </div>
		</div>  -->
		
		

		<!-- Modal -->
  		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel" style="color: black;">리뷰 수정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   	 	<input type="hidden" name="contentno">
		    	<label for="modaltext">리뷰 수정</label>
		    	<textarea id="modaltext" name="contents" rows="10" cols="55"></textarea>	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		

	
    <!-- ******** 리뷰 쓰기 ******** -->
    
	    <div id="writereview">
	 	   <form action="/moviedetail/${detail.movieCd }/reviewinsertresult" method="post">
	 	   <div id="writereview2">   	   		   
	 	      <div class="form-check form-switch" id="form-switch">	      	   
		           <label class="form-check-label" for="flexSwitchCheckDefault">스포일러 여부</label>
		           <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">	                      
	      	  </div>
	 	 	  <div class="mb-3">
	 	 	  	  <label for="contentsbox" class="form-label">리뷰등록</label> 			  
				  <textarea class="form-control" id="contentsbox" name="contents" rows="5" cols="100" placeholder="리뷰를 작성해 주세요." required="required"></textarea>
		      	  <input type="hidden" value="${sessionScope.user.user_no}" name="userno">
		      </div>
		  
		   </div>
		   
		   <!-- 리뷰쓰기: 로그인 하지 않으면 사용 불가 -->
		   <c:if test="${sessionScope.user.user_id!=null}">
		      <div class="d-grid gap-2">
		          <button class="btn btn-primary" id="submitbtn" type="submit">리뷰 등록</button>
		      </div>
		   </c:if>
		   <c:if test="${sessionScope.user.user_id==null}">
		      <div class="d-grid gap-2">
		          <button class="btn btn-primary" id="submitbtn" type="submit" disabled="disabled">리뷰 작성은 로그인 후 사용 가능</button>
		      </div>
		   </c:if>
	       </form>	      
		</div>

<script src="/resources/js/reviewmain.js"></script>
</body>
</html>