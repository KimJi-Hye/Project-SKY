<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원가입</h2>
    	
    	<form role="form" action="/member/join" method="post">
	    	<div>
	    		<c:if test="${result eq 'T'}">
			    	<div>
			    		<h3>교직원 정보 입력</h3>
			    		<ul>
			    			<li>아이디<input type="text" name="userId"></li>
			    			<li>비밀번호<input type=password name="userPw"></li>
			    			<li>비밀번호 확인<input type="password" name=""></li>
			    			<li>이름<input type="text" name="userName"></li>
			    			<li>연락처<input type="text" name="userPhone"></li>
			    			<li>주소<input type="text" name="userAddr"></li>
			    			<li>이메일<input type="text" name="userEmail"></li>
			    		</ul>
			    		<input type="hidden" name="atGrade" value="Z">
			    		<input type="hidden" name="userType" value="T">
			    		<input type="hidden" name="className" value="">
			    	</div> 
			    </c:if>
			    	
			    <c:if test="${result eq 'P'}">
			    	
			    	<div>
			    		<h3>학부모 정보 입력</h3>
			    		<input type="text" value="">
			    	</div>
			    </c:if>
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
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>