<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Note List Page</h1>
</body>
</html>


				

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Note List Page
			<button id='regBtn' type="button" class="btn btn-xs pull-right">등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>반이름</th>
 							<th>원아이름</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>

					<c:forEach items="${noteList}" var="boardNote">
						<tr>
							<td><c:out value="${boardNote.bno}" /></td>
							<td><c:out value="${boardNote.className}" /></td>
							<td><c:out value="${boardNote.cname}" /></td>
							<%-- <td><a href='/board/noteGet?bno=<c:out value="${board.bno}"/>'> --%>
							<td><a class='move' href='<c:out value="${boardNote.bno}"/>'>
							<c:out value="${boardNote.title}" /></a></td>
							<td><c:out value="${boardNote.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardNote.regdate}" /></td>
						</tr>
					</c:forEach>

				</table>

				<!-- Pagination -->
				<div class='pull-right'>
				 <ul class="pagination">
				  <c:if test="${pageMaker.prev}">
				   <li class="paginate_button previous">
				   <a href="${pageMaker.startPage -1}">Previous</a>
				   </li>
				   </c:if>
				   
				   <c:forEach var="num" begin="${pageMaker.startPage}"
				    end="${pageMaker.endPage}">
				    <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
				    <a href="${num}">${num}</a>
				    </li>
				    </c:forEach>
				    
				    <c:if test="${pageMaker.next}">
				     <li class="paginate_button next">
				     <a href="${pageMaker.endPage +1}">Next</a>
				     </li>
				     </c:if>
				 </ul>
				</div>
				<!-- end Pagination -->
				
				 <form id='actionForm' action="/board/noteList" method='get'>
				 <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				 <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
				</form>

			</div>

		</div>

	</div>

</div>


<script type="text/javascript">
$(document).ready(function() {
	
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

	$('#regBtn').click(function() {

		$(location).attr('href','noteRegister');

	});
});
</script>

<%@include file="../includes/footer.jsp"%>