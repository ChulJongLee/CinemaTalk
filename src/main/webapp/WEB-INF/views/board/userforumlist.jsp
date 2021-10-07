<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" href="resources/css/userforumlist.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- ******** 헤더 ********* -->
	<%-- <%@ include file="header.jsp" %> --%>
	
	<!-- 영화정보 & 카테고리 -->
	<%-- <%@ include file="movieinfotop.jsp" %> --%>
	
	
<%-- 	<section>
		<div>
			<c:if test="${alluserforum==null }">              		
	        	자료가 없습니다.
	     	</c:if>
	     	 <c:if test="${alluserforum!=null }">
			<c:forEach var="list" items="${alluserforum }">
				<table class="allreviewtable">
					<tr><td>${list.content_no }12</td><td>${list.title }</td><td>${list.user_id }</td><td class="reviewdate">${list.writedate }</td><td>${list.like }</td><td>${list.dislike }</td></tr>					
				</table>
			</c:forEach>
		 </c:if>
		
		
		</div>
		<button type="button" class="btn btn-outline-primary">글쓰기</button>
	</section> --%>
	
	<section>
		<div id="userforum">
			<table>
				<thead>
					<tr><th>번호</th><th>제목</th><th>아이디</th><th>작성일</th><th>좋아요</th><th>싫어요</th></tr>
				</thead>
				<tbody>
					<tr><td>12</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>13</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>14</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>15</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>16</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>17</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>18</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>19</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>20</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>21</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>22</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
					<tr><td>23</td><td>[img] 안녕하세요 첫 자유게시판 제목입니다. [7]</td><td>아이디를입력</td><td>2021-09-30</td><td>54</td><td>99</td></tr>
				</tbody>
			</table>		
		</div>
		<div id="writebtn">
			<button type="button" class="btn btn-outline-primary">글쓰기</button>
		</div>
	</section>
	
	
	
	
	
<!-- 페이징  -->
<nav aria-label="...">
	<ul class="pagination">	
	
		<!-- 이전 버튼 -->		  
		<c:if test="${page.prev == false}">		
			<li class="page-item disabled">
		      <a class="page-link" href="famouslinelist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.prev == true}">		
			<li class="page-item">
		      <a class="page-link" href="famouslinelist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">&laquo;</a>
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
			      <a class="page-link" href="famouslinelist?currPage=${index }&search=${search}&searchtxt=${searchtxt}"><c:out value="${index }"/></a>
			    </li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:if test="${page.next == false}">
			<li class="page-item disabled">
		      <a class="page-link" href="famouslinelist?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>
		<c:if test="${page.next == true}">
			<li class="page-item">
		      <a class="page-link" href="famouslinelist?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">&raquo;</a>
		    </li>
		</c:if>		
  	</ul>
</nav>	


	<!-- ******** 푸터 ********* -->
	<%-- <%@ include file="footer.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>