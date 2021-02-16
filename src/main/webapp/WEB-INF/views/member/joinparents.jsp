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
		    		<h3>학부모 정보 입력</h3>
		    		<input type="text" value="">
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
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>