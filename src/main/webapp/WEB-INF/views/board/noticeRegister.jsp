<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">


<div id="wrapper">

	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>공지사항</h3>
	</div>

	<div class="form-group">

		<form role="form" action="/board/noticeRegister" method="post">

			<ul>
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'></li>
				<li><label>내용</label> <input type="text"
					class="input_tx input_tx2 input_tx3" name='content'></li>
			</ul>

			<div class="form-button">
				<button type="submit" class="btn_mod">등록</button>
				<button type="reset" class="btn_reset">리셋</button>
				<button data-oper='noticeList' class="btn_list">목록</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>

	</div>

</div>

<script type="text/javascript">
	$(document).ready(
			function(e) {

				var form = $("form");
				$("button[data-oper='noticeList']").on(
						"click",
						function(e) {
							e.preventDefault();
							form.attr("action", "/board/noticeList").attr(
									"method", "get").submit();
						});
			});
</script>

<%@include file="../includes/footer.jsp"%>