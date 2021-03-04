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
						<li class="li_id">
							<label for="userId">아이디</label>
							<input type="text" name="userId" id="userId" class="input_tx" required>
							<button type="button" id="idCheck">중복확인</button>
						</li>
                        <li class="logBox"><span class="b_box"></span><span id="idLog"></span></li>
						<li>
							<label for="userPw">비밀번호</label>
							<input type=password name="userPw" id="userPw" class="input_tx" required>
						</li>
						<li class="logBox"><span class="b_box"></span><span id="pwLog"></span></li>
						<li>
							<label for="pwCheck">비밀번호 확인</label>
							<input type="password" name="pwCheck" id="pwCheck" class="input_tx" required>
						</li>
                        <li class="logBox"><span class="b_box"></span><span id="pwChekLog"></span></li>
						<li>
							<label for="userName">이름</label>
							<input type="text" name="userName" id="userName" class="input_tx" required>
						</li>
						<li class="logBox"><span class="b_box"></span><span id="nameLog"></span></li>
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
						<li class="li_id">
							<label for="userEmail">이메일</label>
							<input type="text" name="userEmail" id="userEmail" class="input_tx" required>
							<button type="button" id="emailCheck">중복확인</button>
						</li>
						<li class="logBox"><span class="b_box"></span><span id="emailLog"></span></li>
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

				<input type="hidden" name="auth" value="ROLE_B"> 
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


<script type="text/javascript">
	
var mail = $("#userEmail");
var mailPass;
$("#emailCheck").click(function(){
   	var emailCheck = mail.val();
   	//alert(emailCheck);
   	if(emailCheck == ""){
		alert("email을 입력하세요");
   		email.focus();
   		return;
   	}
   	$.ajax({
   		url:'/member/emailCheck?userEmail=' + emailCheck,
   		type:'get',
   		contentType: "text/html; charset=utf-8", 
   		dataType: 'text',
   		success:function(data){
   			if(data > 0){
   				mailPass = false;
   				popupOn();
   				popup_m.text("사용할 수 없는 이메일 입니다.");
   				mail.val("");
   				mail.focus();
   				return false;
   			} else {
   				mailPass = true;
   				popupOn();
   				popup_m.text("사용할 수 있는 이메일 입니다.");
   				return true;
   			}
   		}
   	})
});

</script>
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