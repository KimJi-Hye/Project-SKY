<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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
					class="input_tx input_tx2" name='title' required></li>
				<li>
					<label>내용</label> 
					<textarea name="content" class="textareaBox" required></textarea>
				</li>
			</ul>

			<div class="form-button">
				<button data-oper='noticeList' class="btn_list">목록</button>
				<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
					<button type="submit" class="btn_mod">등록</button>
					<button type="reset" class="btn_reset">리셋</button>
				</sec:authorize>
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