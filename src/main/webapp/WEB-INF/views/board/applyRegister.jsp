<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>온라인접수</h3>
	</div>

	<div class="form-group">

				<form role="form" action="/board/applyRegister" method="post">

			<ul>
				<li><label>학부모이름</label> <input type="text"
					class="input_tx input_tx2" name='pname'></li>
					
				<li><label>관계</label> <input type="text"
					class="input_tx input_tx2" name='relation'></li>
					
				<li><label>학부모생년월일</label> <input type="date"
					class="input_tx input_tx2" name='pbirth'></li>
					
				<li><label>주소</label> <input type="text"
					class="input_tx input_tx2" name='addr'></li>	
									
				<li><label>연락처</label> <input type="text"
					class="input_tx input_tx2" name='phone'></li>
					
				<li><label>e-mail</label> <input type="text"
					class="input_tx input_tx2" name='useremail'></li>
					
				<li><label>아동이름</label> <input type="text"
					class="input_tx input_tx2" name='cname'></li>
					
				<li><label>아동성별</label> <input type="text"
					class="input_tx input_tx2" name='cgender'></li>	
														
				<li><label>아동생년월일</label> <input type="date"
					class="input_tx input_tx2" name='cbirth'></li>	
					
				<li><label>접수유형</label> <input type="text"
					class="input_tx input_tx2" name='apptype'></li>	
						
				<li><label>비밀번호</label> <input type="text"
					class="input_tx input_tx2" name='pw'></li>															
			</ul>

			<div class="form-button">
				<button type="submit" class="btn_mod">등록</button>
				<button type="reset" class="btn_reset">리셋</button>
				<button data-oper='applyList' class="btn_list">목록</button>
			</div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
				</form>

			</div>

		</div>
		
<script type="text/javascript">
	$(document).ready(function (e){
		
		var form = $("form");
		$("button[data-oper='applyList']").on(
				"click",
				function(e) {
					e.preventDefault();
					form.attr("action", "/board/applyList").attr(
							"method", "get").submit();
				});
	});
</script>		
		

<%@include file="../includes/footer.jsp"%>