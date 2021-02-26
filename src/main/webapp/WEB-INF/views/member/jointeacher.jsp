<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/mem_header.jsp"%>
<div class="memberBox signup2">

	<div class="cardBox join_contents join_contents2">

		<div class="join_title">
			<h2>회원가입</h2>
			<p>STEP 02. 정보 입력</p>
		</div>
		<div class="join_con">
			<form role="form" action="/member/jointeacher" method="post">
				<div class="join_form">
					<h3>교직원 정보 입력</h3>
					<ul>
						<li>
							<label for="userId">아이디</label>
							<input type="text" name="userId" id="userId" class="input_tx" required>
						</li>
						<li>
							<label for="userPw">비밀번호</label>
							<input type=password name="userPw" id="userPw" class="input_tx" required>
						</li>
						<li>
							<label for="pwCheck">비밀번호 확인</label>
							<input type="password" name="pwCheck" id="pwCheck" class="input_tx" required>
						</li>
                        <li class="pwLogBox">
                        	<span class="b_box">
                        	</span><span id="pwLog"></span>
                        </li>
						<li>
							<label for="userName">이름</label>
							<input type="text" name="userName" id="userName" class="input_tx" required>
						</li>
						<li>
							<label for="userBirth">생년월일</label>
							<input type="date" name="userBirth" class="input_tx">
						</li>
						<li>
							<label for="userPhone">연락처</label>
							<input type="text" name="userPhone" id="userPhone" class="input_tx" required>
						</li>
						<li>
							<label for="userAddr">주소</label>
							<input type="text" name="userAddr" id="userAddr" class="input_tx" required>
						</li>
						<li>
							<label for="userEmail">이메일</label>
							<input type="text" name="userEmail" id="userEmail" class="input_tx" required>
						</li>
					</ul>
				</div>
				<div class="join_form join_class">
					<h3>반 정보 입력 (선택)</h3>
					<ul>
						<li>
							<label for="classname">담당 반</label> 
							<select name="classname" id="classname">
								<option value="" selected>선택</option>
								<c:forEach items="${mngList}" var="boardMng">
									<option value="${boardMng.className}">${boardMng.className}</option>
								</c:forEach>
							</select>
						</li>
					</ul>
				</div>
				<div class="join_btn">
					<a href="/member/join" class="a_btn">뒤로가기</a> 
					<input type="submit" class="btn_reg" value="회원가입"> 
					<input type="reset" class="btn_reset" value="초기화">
				</div>

				<input type="hidden" name="atGrade" value="Z"> 
				<input type="hidden" name="userType" value="T">
				
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>

	</div>
</div>

<div id="popup">
	<div class="popup_bg">
		<div class="popup_box">
			<p class="popup_m"></p>
			<button type="button" class="popup_close">확인</button>
		</div>
	</div>
</div>


<script src="/resources/js/join.js"></script>
<script>
   	$(document).ready(function(){
   		
   		// no type
   		var result = '<c:out value="${result}" />';
   		if(result == ''){
   			//location.href="/member/joinType";
   		}
   		
   		// popup
   		popupOff();
   		$(".popup_close").click(function(){
   			popup_m.text("");
   			popupOff();
   		});
   		
   	});
</script>

<%@ include file="../includes/mem_footer.jsp"%>