<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원가입</h2>
    	
    	<form role="form" action="/member/join" method="post">
	    	<div>
			   	<div>
			   		<h3>교직원 정보 입력 (필수)</h3>
			   		<ul>
			   			<li>아이디<input type="text" name="userId" id="userId" required></li>
			   			<li>비밀번호<input type=password name="userPw" id="userPw" required></li>
			   			<li>비밀번호 확인<input type="password" name="pwCheck" id="pwCheck" required><span id="pwLog"></span></li>
			   			<li>이름<input type="text" name="userName" id="userName" required></li>
			   			<li>연락처<input type="text" name="userPhone" id="userPhone" required></li>
			   			<li>주소<input type="text" name="userAddr" id="userAddr" required></li>
			   			<li>이메일<input type="text" name="userEmail" id="userEmail" required></li>
			   		</ul>
			   		<h3>반 정보 입력 (선택)</h3>
			   		<ul>
			   			<li>
			   				담당 반
			   				 <select name="className">
		   						<option value="" selected>선택</option>
		   						<c:forEach items="${mngList}" var="boardMng">
		       						<option value="${boardMng.className}">${boardMng.className}</option>
		       					</c:forEach>
							</select>
			   			</li>
			   		</ul>
			   		<input type="hidden" name="atGrade" value="Z">
			   		<input type="hidden" name="userType" value="T">
			   	</div> 
	    	</div>
	    	<div>
	    		<a href="/member/joinType">뒤로가기</a>
	    		<input type="reset" value="초기화">
	    		<input type="submit" value="회원가입">
	    	</div>
	    	
    	</form>
    	
    </div>
    
    <div id="popup">
    	<p class="popup_m"></p>
    	<button type="button" class="popup_close">확인</button>
    </div>


<script src="/resources/js/join.js"></script>
<script>
   	$(document).ready(function(){
   		
   		// no type
   		var result = '<c:out value="${result}" />';
   		if(result == ''){
   			location.href="/member/joinType";
   		}
   		
   		// popup
   		popupOff();
   		$(".popup_close").click(function(){
   			popup_m.text("");
   			popupOff();
   		});
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>