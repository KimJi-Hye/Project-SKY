<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원가입</h2>
    	
    	<form role="form" action="/member/joinparents" method="post">
	    	<div>
		    	<div>
		    		<h3>학부모 정보 입력</h3>
			   		<ul>
			   			<li>아이디<input type="text" name="userId" id="userId" required></li>
			   			<li>비밀번호<input type=password name="userPw" id="userPw" required></li>
			   			<li>비밀번호 확인<input type="password" name="pwCheck" id="pwCheck" required><span id="pwLog"></span></li>
			   			<li>이름<input type="text" name="userName" id="userName" value="" required></li>
			   			<li>연락처<input type="text" name="userPhone" id="userPhone" required></li>
			   			<li>주소<input type="text" name="userAddr" id="userAddr" required></li>
			   			<li>이메일<input type="text" name="userEmail" id="userEmail" required></li>
			   		</ul>
			   		<h3>원아 정보 확인</h3>
			   		<ul>
			   			<li>아이디<input type="text" name="userId" id="userId" required></li>
			   			<li>비밀번호<input type=password name="userPw" id="userPw" required></li>
			   			<li>비밀번호 확인<input type="password" name="pwCheck" id="pwCheck" required><span id="pwLog"></span></li>
			   			<li>이름<input type="text" name="userName" id="userName" required></li>
			   			<li>연락처<input type="text" name="userPhone" id="userPhone" required></li>
			   			<li>주소<input type="text" name="userAddr" id="userAddr" required></li>
			   			<li>이메일<input type="text" name="userEmail" id="userEmail" required></li>
			   			<li>원아 정보 상이 시 회원가입 후 원으로 연락 바랍니다^^</li>
			   		</ul>
		    	</div>
	    	</div>
	    	<div>
	    		<a href="/member/joinType">뒤로가기</a>
	    		<input type="reset" value="초기화">
	    		<input type="submit" value="회원가입">
	    	</div>
	    	
    	</form>
    	
    </div>

<script>
   	$(document).ready(function(){
   		
   		// no type
   		var result = '<c:out value="${result}" />';
   		if(result == ''){
   			location.href="/member/joinType";
   		}
   		var apply = '<c:out value="${apply}" />';
   		alert(apply);
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>