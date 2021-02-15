<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
					<label>접수번호</label> <input class="form-control" name='ano'
						value='<c:out value="${board.ano}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>학부모이름</label> <input class="form-control" name='pname'
						value='<c:out value="${board.pname}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>관계</label> <input class="form-control" name='relation'
						value='<c:out value="${board.relation}"/>'>
				</div>

				<div class="form-group">
					<label>학부모생년월일</label> <input class="form-control" name='pbirth'
						value='<c:out value="${board.pbirth}"/>'>
				</div>

				<div class="form-group">
					<label>주소</label> <input class="form-control" name='addr'
						value='<c:out value="${board.addr}"/>'>
				</div>

				<div class="form-group">
					<label>연락처</label> <input class="form-control" name='phone'
						value='<c:out value="${board.phone}"/>'>
				</div> 

				<div class="form-group">
					<label>아동이름</label> <input class="form-control" name='cname'
						value='<c:out value="${board.cname}"/>'>
				</div>

				<div class="form-group">
					<label>아동성별</label> <input class="form-control" name='cgender'
						value='<c:out value="${board.'cgender'}"/>'>
				</div>

				<div class="form-group">
					<label>아동생년월일</label> <input class="form-control" name='cbirth'
						value='<c:out value="${board.'cbirth'}"/>'>
				</div>

				<div class="form-group">
					<label>접수유형</label> <input class="form-control" name='apptype'
						value='<c:out value="${board.apptype}"/>'>
				</div>

				<div class="form-group">
					<label>접수상태</label> <input class="form-control" name='appstate'
						value='<c:out value="${board.appstate}"/>'>
				</div>

				<div class="form-group">
					<label>아동고유번호</label> <input class="form-control" name='cunicode'
						value='<c:out value="${board.'cunicode'}"/>'>
				</div>

				<div class="form-group">
					<label>소속반</label> <input class="form-control" name='cclass'
						value='<c:out value="${board.cclass}"/>'>
				</div>

				<div class="form-group">
					<label>입학일</label> <input class="form-control" name='enter'
						value='<c:out value="${board.enter}"/>'>
				</div>

				<div class="form-group">
					<label>졸업일</label> <input class="form-control" name='graduation'
						value='<c:out value="${board.graduation}"/>'>
				</div>

				<button data-oper='modify' class="btn btn-default">Modify</button>
				<button data-oper='list' class="btn btn-info">List</button>

				<form id='operForm' action="/board/applyModify" method="get">
					<input type='hidden' id='ano' name='ano'
						value='<c:out value="${board.ano}"/>'>
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
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/board/applymodify").submit();
	});
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#ano").remove();
		operForm.attr("action", "/board/applyList")
		operForm.submit();
	});
});
</script>

