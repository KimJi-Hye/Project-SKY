<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	.form-group ul li .radioBox label{
		width: auto; margin-right: 20px;
	}
</style>

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>온라인접수</h3>
	</div>

	<div class="form-group">

				<form role="form" action="/board/applyRegister" method="post">

			<ul>
				<li><label>학부모이름</label> <input type="text"
					class="input_tx input_tx2" name='pname' required></li>
					
				<li><label>관계</label> <input type="text"
					class="input_tx input_tx2" name='relation' required></li>
					
				<li><label>학부모생년월일</label> <input type="date"
					class="input_tx input_tx2" name='pbirth' required></li>
					
				<li><label>주소</label> <input type="text"
					class="input_tx input_tx2" name='addr' required></li>	
									
				<li><label>연락처</label> <input type="text"
					class="input_tx input_tx2" name='phone' required></li>
					
				<li><label>e-mail</label> <input type="text"
					class="input_tx input_tx2" name='useremail' required></li>
					
				<li><label>아동이름</label> <input type="text"
					class="input_tx input_tx2" name='cname' required></li>
					
				<li><label>아동성별</label> <input type="text"
					class="input_tx input_tx2" name='cgender' required></li>	
														
				<li><label>아동생년월일</label> <input type="date"
					class="input_tx input_tx2" name='cbirth' required></li>	
					
				<li><label>접수유형</label> 
					<!-- <input type="text" class="input_tx input_tx2" name='apptype' required> -->
					<div class="radioBox">
						<input type="radio" name="apptype" id="type1" value="우선모집">
						<label for="type1"><span></span> 우선모집(재원생 동생)</label>
						<input type="radio" name="apptype" id="type2" value="일반모집">
						<label for="type2"><span></span> 일반모집</label>
						<input type="radio" name="apptype" id="type3" value="방과후 과정">
						<label for="type3"><span></span> 방과후 과정</label>
					</div>
				</li>	
						
				<li><label>비밀번호</label> <input type="text"
					class="input_tx input_tx2" name='pw' required></li>															
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