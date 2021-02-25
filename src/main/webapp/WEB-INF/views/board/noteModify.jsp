<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">



<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>알림장</h3>
	</div>

	<div class="form-group">


		<form id="operForm" action="/board/noteModify" method="post">

			<ul>
				<li><label>No</label> <input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly"></li>
				<li><label>반 이름</label> <input type="text"
					class="input_tx input_tx2" name='classname'
					value='<c:out value="${board.classname}"/>' readonly="readonly"></li>
				<li><label>원아 이름</label> <input type="text"
					class="input_tx input_tx2" name='cname'
					value='<c:out value="${board.cname}"/>' readonly="readonly"></li>
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>'></li>
				<li><label>내용</label> <input type="text"
					class="input_tx input_tx2 input_tx3" name='content'
					value='<c:out value="${board.content}"/>'></li>
				<li><label>작성자</label> <input type="text"
					class="input_tx input_tx2" name='writer'
					value='<c:out value="${board.writer}"/>' readonly="readonly"></li>
			</ul>

			<div class="form-button">
				<button data-oper='noteModify' class="btn_mod">수정</button>
				<button data-oper='noteList' class="btn_list">목록</button>
				<button data-oper='noteRemove' class="btn_del">삭제</button>
			</div>



			<input type="hidden" id="bno" name="bno" value="${board.bno}">
			<input type='hidden' name='pageNum'
				value='<c:out value="${cri.pageNum}"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>


		</form>


	</div>
	<!--  end panel-body -->

</div>
<!--  end panel-body -->
<script type="text/javascript">

$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	
	$("button[data-oper='noteModify']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteModify").attr("result", "success").submit();
	});

	$("button[data-oper='noteList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteList").attr("method", "get").submit();
	});

	$("button[data-oper='noteRemove']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteRemove").attr("result", "success").submit();
	});	
	

});

</script>

<%@include file="../includes/footer.jsp"%>