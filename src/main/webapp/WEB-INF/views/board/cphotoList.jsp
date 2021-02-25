<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board List Page
			<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>반이름</th>
							<th>태그</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>

					<c:forEach items="${cphotoList}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><c:out value="${board.className}" /></td>
							<td><c:out value="${board.tag}" /></td>
							<%-- <td><a href='/board/cphotoGet?bno=<c:out value="${board.bno}"/>'> --%>
							<td><a class='move' href='<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}" />
							</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
						</tr>
					</c:forEach>

				</table>

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
				
			   <form id='actionForm' action="/board/cphotoList" method='get'>
				 <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				 <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	$(document).ready(function() {

		$("#regBtn").on("click", function() {

			self.location = "/board/cphotoRegister";

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
			actionForm.attr("action", "/board/cphotoGet");
			actionForm.submit();
		});		
		
	});
</script>
<%@include file="../includes/footer.jsp"%>
