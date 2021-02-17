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
	<h1>Class List Page</h1>
</body>
</html>


				

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class List Page
			<button id='regBtn' type="button" class="btn btn-xs pull-right">등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>반이름</th>
							<th>연령</th>
							<th>정원</th>
						</tr>
					</thead>

					<c:forEach items="${classList}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a href='/board/classGet?className=<c:out value="${board.className}"/>'>
							<c:out value="${board.className}" /></a></td>
							<td><c:out value="${board.classAge}" /></td>
							<td><c:out value="${board.classTotal}" /></td>
						</tr>
					</c:forEach>

				</table>


			</div>
<!-- 			/.panel-body -->
		</div>
<!-- 		/.panel -->
	</div>
<!-- 	/.col-lg-6 -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {

	$('#regBtn').click(function() {

		$(location).attr('href','classRegister');

	});
});
</script>

<%@include file="../includes/footer.jsp"%>