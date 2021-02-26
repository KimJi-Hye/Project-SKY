<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Class Register Page</h1>
</body>
</html>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Register Page</div>
			
			<div class="panel-body">
			
			<form id="operForm" action="/board/classRegister" method="post">
				<div class="form-group">
				 <label>반 이름</label> 
				 <input class="form-control" name='className' required>
				</div>
				
				<div class="form-group">
				<label>연령</label>
				<input class="form-control" name='classAge' required>
				</div>
				
				
				<div class="form-group">
				<label>정원</label> 
				<input class="form-control" name='classTotal' required>
				</div>
				
				<button type="submit">등록</button>
				<button data-oper='classList' class="btn btn-info">목록</button>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			</form>
			
			
			
			</div>

		</div>

	</div>

</div>
		
<script type="text/javascript">
	$(document).ready(function (e){
		
		var operForm = $("#operForm");
		$("button[data-oper='classList']").on(
				"click",
				function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classList").attr(
							"method", "get").submit();
				});
	});
</script>


<%@include file="../includes/footer.jsp"%>

