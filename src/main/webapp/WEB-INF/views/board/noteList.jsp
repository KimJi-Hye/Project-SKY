<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
			<button data-oper='submit' class="btn btn-info" onclick="location.href='/board/classNoteRegister'">알림장 등록</button>
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

					<c:forEach items="${noteList}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><c:out value="${board.className}" /></td>
							<td><c:out value="${board.cname}" /></td>
							<td><a href='/board/noteGet?bno=<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}" /></a></td>
							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
						</tr>
					</c:forEach>

				</table>

<!-- <!-- 				Modal -->
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

					</div>
	
				</div>-->


			</div>

		</div>

	</div>

</div>


<!-- <script>
$("#regBtn").on("click", function() {
	self.location ="/board/classRegister";
});
 $(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	
	function checkModal(result) {
		if(result === '') {
			return;
		}
		if(parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}

});
</script> -->

