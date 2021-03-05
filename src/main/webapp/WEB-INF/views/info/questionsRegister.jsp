<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>Q & A</h3>
	</div>

	<div class="form-group">

		<form id='operForm' action="/info/questionsRegister" method="post">
			<ul>
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title' required></li>
				<li><label>내용</label>
					<textarea name='content' class="textareaBox" required></textarea></li>
				<li><label>작성자</label> 
				<input type="text"
					class="input_tx input_tx2" name='writer' maxlength="7" required></li>	
				<li><label>비밀번호</label> <input type="password"
					class="input_tx input_tx2" name='pw' required></li>									
			</ul>

			<div class="form-button">
				<button type="submit" class="btn_reg">등록</button>
				<button data-oper='questionsList' class="btn_list">목록</button>
			</div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		</form>

	</div>

</div>

<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='questionsList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/info/questionsList").attr("method","get").submit();
	});	

});
</script>

<%@include file="../includes/footer.jsp"%>