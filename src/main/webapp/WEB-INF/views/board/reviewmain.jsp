<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/reviewmain.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- 영화정보 & 카테고리 -->
	<%@ include file="movieinfotop.jsp" %>

    <!-- ******** 베스트 리뷰 ******** -->
    <section id="bestsection">
        <h3><a href="reviewall" id="bestreviewbtn">베스트 리뷰</a></h3>
        <div class="bestreview">
       		<c:if test="${bestreviewlist==null }">              		
         		자료가 없습니다.
         	</c:if>
         	<c:if test="${bestreviewlist!=null }">
         		<c:forEach var="list" items="${bestreviewlist }">
					<table class="bestreviewtable">
						<tr><td colspan="3" width="30%">${list.userid }</td><td id="date">${list.writedate }</td></tr>
						<tr><td id="content" colspan="4">${list.contents }</td></tr>
						<tr><td width="10%">${list.like }</td><td width="10%">${list.dislike }</td><td colspan="2" id="report">신고</td></tr>
					</table>
				</c:forEach>
         	</c:if>                            
        </div>
    </section>

    <!-- ******** 일반 리뷰 ******** -->
    <section id="generalsection">
        <h3><a href="reviewall" id="generalreviewbtn">일반 리뷰</a></h3>
        <div class="generalreview">
       		<c:if test="${generalreviewlist==null }">              		
         		자료가 없습니다.
         	</c:if>
         	<c:if test="${generalreviewlist!=null }">
         		<c:forEach var="list" items="${generalreviewlist }">
					<table class="bestreviewtable">
						<tr><td colspan="3" width="30%">${list.userid }</td><td id="date">${list.writedate }</td></tr>
						<tr><td id="content" colspan="4">${list.contents }</td></tr>
						<tr><td width="10%">${list.like }</td><td width="10%">${list.dislike }</td><td colspan="2" id="report">신고</td></tr>
					</table>
				</c:forEach>
         	</c:if>                            
        </div>
    </section>

    <!-- ******** 리뷰 쓰기 ******** -->
    <div id="writereview">
        <div class="mb-3">

            <label for="exampleFormControlTextarea1" class="form-label">리뷰 쓰기</label>

            <div class="form-check form-switch" id="form-switch">
                <label class="form-check-label" for="flexSwitchCheckDefault">스포일러 여부</label>
                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">            
            </div>

            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="width: 800px; margin-bottom: 5px;"></textarea>
            <div class="d-grid gap-2">
                <button class="btn btn-primary" type="button">리뷰 등록</button>
            </div>
        </div>
    </div>    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>