<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_list.css">

<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>온라인접수조회</h3>
</div>

<!-- 게시판 목록  -->
<div class="boardList">
	<table>
		<thead>
			<tr>
				<th class="th_ano">접수번호</th>
				<th class="th_pname">학부모이름</th>
				<th class="th_apptype">접수유형</th>
				<th class="th_appstate">접수상태</th>
				<th class="th_adddate">접수일</th>
			</tr>
		</thead>

		<c:forEach items="${applyList}" var="board">
			<tr>
				<td><c:out value="${board.ano}" /></td>
				<td><a class='move' href=<c:out value="${board.ano}"/>'> <c:out
							value="${board.pname}" /></a></td>
				<td><c:out value="${board.apptype}" /></td>
				<td><c:out value="${board.appstate}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.adddate}" /></td>
			</tr>
		</c:forEach>
	</table>

	<!-- <검색창> -->
	<div class='bo_search'>
		<div class="col-lg-12">

			<form id='searchForm' action="/board/applyList" method='get'>
				<div class="bo_searchBox">
					<select name="type">
						<option value="N"
							<c:out value="${pageMaker.cri.type eq 'N'?' selected':''}"/>>학부모이름</option>
					</select> 
					<input type='text' name='keyword' placeholder="검색어를 입력해주세요" value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

					<button type="button">
						<span class="material-icons" > search </span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- <검색창 END> -->

	<!-- Pagination -->
	<div class='bo_pages'>
		<ul class="pg_wrap">
			<span class="pg"> <c:if test="${pageMaker.prev}">
					<li class="paginate_button pg_page pg_start"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if> <c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button pg_page ${pageMaker.cri.pageNum == num ? "
						activepg_current":""} "><a href="${num}">${num}</a></li>
				</c:forEach> <c:if test="${pageMaker.next}">
					<li class="paginate_button pg_page pg_end"><a
						href="${pageMaker.endPage +1}">Next</a></li>
				</c:if>
			</span>
		</ul>
	</div>
	<!-- end Pagination -->

	<form id='actionForm' action="/board/applyList" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type'
			value='<c:out value="${pageMaker.cri.type}"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>

</div>
<!-- 			/.panel-body -->

<script type="text/javascript">
$(document).ready(function() {

	$('#regBtn').click(function() {

		$(location).attr('href','applyRegister');

	});
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='ano' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/applyGet");
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