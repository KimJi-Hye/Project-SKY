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
							<th>#접수번호</th>
							<th>학부모이름</th>
							<th>접수유형</th>
							<th>접수상태</th>
							<th>접수일</th>
						</tr>
					</thead>

					<c:forEach items="${applyList}" var="board">
						<tr>
							<td><c:out value="${board.ano}" /></td>
							<td><a href='/board/applyGet?ano=<c:out value="${board.ano}"/>'>
							<c:out value="${board.pname}" /></a></td>
							<td><c:out value="${board.apptype}" /></td>
							<td><c:out value="${board.appstate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.adddate}" /></td>
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

		$(location).attr('href','applyRegister.php');

	});
});
</script>


<%-- <%@include file="../includes/footer.jsp"%> --%>
















