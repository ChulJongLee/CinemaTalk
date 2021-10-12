<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/reviewmain.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- 영화정보 & 카테고리 -->
	<%-- <%@ include file="movieinfotop.jsp" %> --%>

    <!-- ******** 베스트 리뷰 ******** -->
    <section id="bestsection">
<!--    <h3><a href="reviewall" id="bestreviewbtn">베스트 리뷰</a></h3>  -->
        <h3 id="bestreviewbtn">베스트 리뷰</h3>
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
						<div id="content">${list.contents }</div>
						<div id="like"><button id="likebtn"> <i class="fas fa-thumbs-up"> ${list.like }</i></button></div>
						<div id="dislike"><button id="dislikebtn"> <i class="fas fa-thumbs-down"> ${list.dislike }</i></button></div>
						<div id="report"><button id="reportbtn"> <i class="fas fa-flag"> 신고</i></button></div>					
					</li>				
				</c:forEach>
			</ul>
         	</c:if>                            
        </div>
    </section>

    <!-- ******** 일반 리뷰 ******** -->
    <section id="generalsection">
        <!-- <h3><a href="reviewall" id="generalreviewbtn">일반 리뷰</a></h3> -->
        <h3 id="generalreviewbtn">일반 리뷰</h3>
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
							
							
							<div id="content"><pre>${list.contents }</pre></div>
							
							
							<div id="like">
								<button class="likebtn" value="${list.contentno }">
									<div class="likebtn2">
										<i class="fas fa-thumbs-up"></i>
									</div>
									<div>
										${list.like }
									</div>
								</button>				
							</div>
							<div id="dislike">
								<button class="dislikebtn" value="${list.contentno }">
									<i class="fas fa-thumbs-down">${list.dislike }</i>
								</button>
							</div>
							<div id="report">
								<button class="reportbtn" value="${list.contentno }">
									<i class="fas fa-flag"> 신고</i>
								</button>
							</div>
							<div id="contentedit">
								<div id="modifycheck"><button class="modifycheckbtn"><i class="fas fa-check fa-lg"></i></button></div>
								<div id="modifyreturn"><button class="modifyreturnbtn"><i class="fas fa-undo fa-lg"></i></button></div>
								<div id="modify"><button class="modifybtn" value="${list.contentno }"><i class="fas fa-edit fa-lg"></i></button></div>
								<div id="delete"><button class="deletebtn" value="${list.contentno }"><i class="fas fa-times fa-lg"></i></button></div>						
							</div>
						</li>		
				</c:forEach>
			</ul>	
         	</c:if>                            
        </div>
        <div id="reviewallbtn">
        	<a href="reviewall">모든 리뷰 보기</a>
        </div>
    </section>
     
	
    <!-- ******** 리뷰 쓰기 ******** -->
    <div id="writereview">
 	   <form action="reviewinsertresult" method="post">
 	   <div id="writereview2">   	   		   
 	      <div class="form-check form-switch" id="form-switch">	      	   
	           <label class="form-check-label" for="flexSwitchCheckDefault">스포일러 여부</label>
	           <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">	                      
      	  </div>
 	 	  <div class="mb-3">
 	 	  	  <label for="contentsbox" class="form-label">리뷰등록</label> 			  
			  <textarea class="form-control" id="contentsbox" name="contents" rows="5" cols="100" placeholder="리뷰를 작성해 주세요." required="required"></textarea>
	      </div>
	   </div>	
	      <div class="d-grid gap-2">
	          <button class="btn btn-primary" type="submit">리뷰 등록</button>
	      </div>
       </form>	      
	</div>

<script src="/resources/js/reviewmain.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>