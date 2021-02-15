<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Note Read Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Note Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class="form-group">
				 <label>bno</label> <input class="form-control" name='bno'
				value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>			

				<div class="form-group">
				 <label>반이름</label> <input class="form-control" name='className'
				value='<c:out value="${board.className }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>원아이름</label> <input class="form-control" name='cname'
				value='<c:out value="${board.cname }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>내용</label> <textarea class="form-control" rows="5" name='content'readonly="readonly">
				<c:out value="${board.content }"/></textarea>
				</div>
						
				<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
				value='<c:out value="${board.writer }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>작성일</label> <input class="form-control" name='regdate'
				value='<c:out value="${board.regdate }"/>' readonly="readonly">
				</div>
				
				<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/classModify?bno=<c:out value="${board.bno }"/>'" }>수정</button>
				<button data-oper='list' class="btn btn-info" onclick="location.href='/board/noteList'">목록</button>
				
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
<script>
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

