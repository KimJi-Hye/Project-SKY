<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_list.css">

<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>Note List</h3>
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
			<c:forEach items="${noteList}" var="boardNote">
				<tr>
					<td><c:out value="${boardNote.bno}" /></td>
					<td><c:out value="${boardNote.classname}" /></td>
					<td><c:out value="${boardNote.cname}" /></td>
					<%-- <td><a href='/board/noteGet?bno=<c:out value="${boardNote.bno}" />'> --%>
					<td><a class='move' href='<c:out value="${boardNote.bno}"/>'>
							<c:out value="${boardNote.title}" />
					</a></td>
					<td><c:out value="${boardNote.writer}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${boardNote.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 글쓰기 -->
	<div class="bo_register">
		<a href="noteRegister" class="pg_regi">
			<span class="material-icons"> create </span>글쓰기</a>
	</div>

				
				<!-- <화면에서 검색 조건 처리> -->
				<div class='row'>
				 <div class="col-lg-12">
				 
				 <form id='searchForm' action="/board/noteList" method='get'>
				  <select name='type'>								
				   <option value=""
				    <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				    <option value="N"
				    <c:out value="${pageMaker.cri.type eq 'N'?' selected':''}"/>>반이름</option>
				    <option value="C"
				    <c:out value="${pageMaker.cri.type eq 'C'?' selected':''}"/>>원아이름</option>
				   </select>
				   
				  <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
				  <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
				  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
				 
				  <button class='btn btn-default'>Search</button>				   
				 </form>
				 </div>
				</div>
				   
				   
				<!-- Pagination -->
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->
				
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

	             if (!searchForm.find("option:selected")
	                   .val()) {
	                alert("검색종류를 선택하세요");
	                return false;
	             }

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