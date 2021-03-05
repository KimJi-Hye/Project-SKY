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
		<h3>알림장</h3>
	</div>

	<div class="form-group">

		<form role="form" action="/board/noteRegister" method="post">

			<ul>
				<li><label>반 이름</label> <select name="classname" required>
						<option value="" selected>선택</option>
						<c:forEach items="${mngList}" var="boardMng">
							<option value="${boardMng.className}">${boardMng.className}</option>
						</c:forEach>
				</select></li>


				<li><label>원아 이름</label> <select name="cunicode" required>
						<option value="" selected>선택</option>
				</select></li>

				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' required></li>

				<li><label>내용</label> <textarea class="input_tx input_tx2 input_tx3 textareaBox" 
					name='content' required></textarea></li>

				<li><label>작성자</label> <input type="text"
					class="input_tx input_tx2" name='writer'
					value='<sec:authentication property="principal.username"/>' readonly="readonly"></li>
					
									
	
			</ul>

			<div class="form-button">
				<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
        			<button type="submit" class="btn_reg">등록</button>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
        			<button data-oper='noteList' class="btn_list" onclick="location.href='/board/noteList?bno=<c:out value="${board.bno}"/>'">목록</button>
				</sec:authorize>
			</div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		</form>

	</div>

</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {

							$("select[name='classname']")
									.change(
											function() {
												var name = $("select[name='cunicode']");
												var str = "";

												str += "<option value='' selected>선택</option>";
												str += "<c:forEach items='${cnameList}' var='boardChild'>";
												if ($(this).val() == "${boardChild.classname}") {
													str += "<option value='${boardChild.cunicode}'>${boardChild.cname}(${boardChild.cunicode})</option>";
												}

												str += "</c:forEach>";

												name.html(str);
											});

							var form = $("form");
							
							$("button[data-oper='noteList']").on("click", function(e) {
								form.find("#bno").remove();
								form.attr("action", "/board/noteList").attr("method","get").submit();
							});	
						});
	</script>

	<%@include file="../includes/footer.jsp"%>