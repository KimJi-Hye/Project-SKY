<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1>ClassNote Get Page</h1>
			</div>

			<div class="panel-body">

					<div class="form-group">
						<label>bno</label> <input class="form-control" name='bno' 
						value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>


					<div class="form-group">
						<label>반 이름</label> <input class="form-control" name='classname' 
						value='<c:out value="${board.classname }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>원아 이름</label> <input class="form-control" name='cname'
						value='<c:out value="${board.cname }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label> <input class="form-control" name='content'
						value='<c:out value="${board.content }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>작성일</label> <input class="form-control" name='regdate'
							value='<c:out value="${board.regdate }"/>' readonly="readonly">
					</div>

				
				<div class="btn_box">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_list">목록</button>
					<button type="button" class="btn_del">삭제</button>
				</div>
				
				<form id="operForm" action="/board/noteModify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno}">
				</form>
	




			</div>
		</div>
	</div>
</div>



<script type="text/javascript">

$(document).ready(function() {
	
	var operForm = $("#operForm");
	$(".btn_mod").click(function() {
		operForm.submit();
	});
	$(".btn_list").click(function() {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteList");
		operForm.submit();
	});
	$(".btn_del").click(function() {
		operForm.attr("action", "/board/noteRemove").attr("method","post");
		operForm.submit();
	});
});

</script>





<%@include file="../includes/footer.jsp"%>