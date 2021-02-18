<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%-- <%@include file="../includes/header.jsp"%> --%>

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
							<th>게시글번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정날짜</th>
							<th>비밀번호</th>
						</tr>
					</thead>

					<c:forEach items="${questionsList}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a href='/board/questionsGet?bno=<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}" /></a></td>
							<td><c:out value="${board.content}" /></td>
							<td><c:out value="${board.writer}" /></td>
							<td><c:out value="${board.regdate}" /></td>
							<td><c:out value="${board.updatedate}" /></td>
							<td><c:out value="${board.pw}" /></td>
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.adddate}" /></td> --%>
						</tr>
					</c:forEach>
				</table>

<!-- 				Modal -->
<!-- 				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">신규반 등록이 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						/.modal-content
					</div>
					/.modal-dialog
				</div> -->
<!-- 				/.modal -->

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

		$(location).attr('href','applyRegister');

	});
});
</script>


<%-- <%@include file="../includes/footer.jsp"%> --%>
















