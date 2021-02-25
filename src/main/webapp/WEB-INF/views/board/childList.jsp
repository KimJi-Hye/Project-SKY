<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class List Page
			<button id='regBtn' type="button" class="btn btn-xs pull-right">접수</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>고유번호</th>
							<th>원아이름</th>
							<th>성별</th>
							<th>반이름</th>
							<th>생년월일</th>
							<th>학부모이름</th>
							<th>입학일</th>
							<th>졸업일</th>
						</tr>
					</thead>

					<c:forEach items="${childList}" var="board">
						<tr>
							<td><c:out value="${board.cunicode}" /></td>
							<td><a class='move' href=<c:out value="${board.cunicode}"/>'>
							<c:out value="${board.cname}" /></a></td>
							<td><c:out value="${board.cgender}" /></td>
							<td><c:out value="${board.classname}" /></td>
							<td><c:out value="${board.cbirth}" /></td>
							<td><c:out value="${board.username}" /></td>
							<td><c:out value="${board.enter}" /></td>
							<td><c:out value="${board.graduation}" /></td>
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.adddate}" /></td> --%>
						</tr>
					</c:forEach>
				</table>
				
				<!-- <화면에서 검색 조건 처리> -->

				<form id='searchForm' action="/board/childList" method='get'>
					<select name='type'>								
						<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="N"
						<c:out value="${pageMaker.cri.type eq 'N'?' selected':''}"/>>학부모 이름</option>
					</select>
					 
					<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
					
					<button class='btn btn-default'>Search</button>				   
				</form>
				
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

				<form id='actionForm' action="/board/childList" method='get'>
					<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>

			</div>
<!-- 			/.panel-body -->
		</div>
<!-- 		/.panel -->
	</div>
<!-- 	/.col-lg-6 -->
</div>

<script type="text/javascript">
$(document).ready(function() {

	$('#regBtn').click(function() {

		$(location).attr('href','childRegister');
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
		actionForm.append("<input type='hidden' name='cunicode' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/childGet");
		actionForm.submit();
	});
	
    $("#searchForm button").on("click", function(e) {

		if (!searchForm.find("option:selected").val()) {
			
		   alert("검색종류를 선택하세요");
		   return false;
		   
		}
		
		if (!searchForm.find("input[name='keyword']").val()) {
			
		   alert("키워드를 입력하세요");
		   return false;
		   
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
});
</script>


<%@include file="../includes/footer.jsp"%>