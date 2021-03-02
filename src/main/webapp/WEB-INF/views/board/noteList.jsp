<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_list.css">

<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>알림장</h3>
</div>

<!-- 게시판 목록  -->
<div class="boardList">
	<table>
		<thead>
			<tr>
				<th class="th_bno">No</th>
				<th class="th_classname">반이름</th>
				<th class="th_cname">원아이름</th>
				<th class="th_title">제목</th>
				<th class="th_writer">작성자</th>
				<th class="th_regdate">작성일</th>
			</tr>
		</thead>

		<tbody>

			<c:if test="${empty noteList}">
				<tr>
					<td colspan="6">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${noteList}" var="boardNote">
				<tr>
					<td><a class='move' href='<c:out value="${boardNote.bno}" />'>
							<c:out value="${boardNote.bno}" />
					</a></td>
					<td><a class='move' href='<c:out value="${boardNote.bno}" />'>
							<c:out value="${boardNote.classname}" />
					</a></td>
					<td><a class='move' href='<c:out value="${boardNote.bno}" />'>
							<c:out value="${boardNote.cname}" />
					</a></td>
					<%-- <td><a href='/board/noteGet?bno=<c:out value="${boardNote.bno}" />'> --%>
					<td><a class='move' href='<c:out value="${boardNote.bno}"/>'>
							<c:out value="${boardNote.title}" />
					</a></td>
					<td><a class='move' href='<c:out value="${boardNote.bno}" />'>
							<c:out value="${boardNote.writer}" />					
					</a></td>
					<td><a class='move' href='<c:out value="${boardNote.bno}" />'><fmt:formatDate pattern="yyyy-MM-dd"
							value="${boardNote.regdate}" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 글쓰기 -->
	<div class="bo_register">
		<a href="noteRegister" class="pg_regi">
			<span class="material-icons"> create </span>글쓰기</a>
	</div>

				<!-- Pagination -->
				<div class='bo_pages'>

					<ul class="pg_wrap">
                	    <span class="pg">					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button pg_page pg_start"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button pg_page ${pageMaker.cri.pageNum == num ? "active pg_current":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button pg_page pg_end"><a
								href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
                	    </span>						
					</ul>
					<ul class="no_wrap">
						
					</ul>
				</div>
				<!-- end Pagination -->


				
				<!-- <검색창> -->
				<div class='bo_search'>
				 <div class="col-lg-12">
				 
				 <form id='searchForm' action="/board/noteList" method='get'>
                    <div class="bo_searchBox">
				  <select name="type">								
				    <option value="N"
				    <c:out value="${pageMaker.cri.type eq 'N'?' selected':''}"/>>반이름</option>
				    <option value="C"
				    <c:out value="${pageMaker.cri.type eq 'C'?' selected':''}"/>>원아이름</option>
				   </select>
				   
				  <input type='text' name='keyword' placeholder="검색어를 입력해주세요" value='<c:out value="${pageMaker.cri.keyword}"/>' />
				  <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
				  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
				 
                 <button type="button"><span class="material-icons">
                            search
                 </span></button> 			   
				 </div>
				 </form>
				</div>
				</div>
				<!-- <검색창 END> -->				
				   
				   

				
				<form id='actionForm' action="/board/noteList" method='get'>
				 <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				 <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
				 <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
				 <input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>
				
			</div>




<script type="text/javascript">
	$(document).ready(function() {

		$("#regBtn").on("click", function() {

			self.location = "/board/noteRegister";

		})
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/noteGet");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");

	    $("#searchForm button").on(
	          "click",
	          function(e) {


	             if (!searchForm.find(
	                   "input[name='keyword']").val()) {
	                alert("키워드를 입력하세요");
	                return false;
	             }

	             searchForm.find("input[name='pageNum']")
	                   .val("1");
	             e.preventDefault();

	             searchForm.submit();
	          });

	});
</script>

<%@include file="../includes/footer.jsp"%>