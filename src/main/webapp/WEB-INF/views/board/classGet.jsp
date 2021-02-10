<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Class Read Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			

				<div class="form-group">
				 <label>반이름</label> <input class="form-control" name='className'
				value='<c:out value="${board.className }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>연령</label> <input class="form-control" name='classAge'
				value='<c:out value="${board.classAge }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>정원</label> <input class="form-control" name='classTotal'
				value='<c:out value="${board.classTotal }"/>' readonly="readonly">
				</div>
				
				<button data-oper='modify' class="btn btn-default">Modify</button>
				<button data-oper='list' class="btn btn-info">List</button>
				
                <form id='operForm' action="/board/classModify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
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
	var operForm = $("#operForm");
$("button[data-oper='modify']").on("click", function(e){
	operForm.attr("action","/board/modify").submit();
});
$("button[data-oper='list']").on("click", function(e){
	operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
});
});
</script>

