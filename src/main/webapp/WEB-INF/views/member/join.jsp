<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원가입</h2>
    	
    	<form role="form" action="/member/join" method="post">
	    	<div>
	    		<h3>유형 선택</h3>
	    		<input type="radio" name="joinType" value="T" id="typeT">
	    		<label for="typeT">교직원</label>
	    		<input type="radio" name="joinType" value="P" id="typeP">
	    		<label for="typeP">학부모</label>
	    		<button type="button" class="join_next">다음단계 ></button>
	    	</div>
	    	<div>
	    		<c:if test="joinType == 'T'">
			    	<div>
			    		<h3>교직원 정보 입력</h3>
			    		<input type="text" value="">
			    	</div>
			    </c:if>
			    	
			    <c:if test="joinType == 'P'">
			    	<div>
			    		<h3>학부모 정보 입력</h3>
			    		<input type="text" value="">
			    	</div>
			    </c:if>
	    	</div>
	    	
    	</form>
    	
    </div>
    
    <script>
    	$(document).ready(function(){
    		// 유형 선택
    		$(".join_next").click(function(){
    			var joinType = $("input[name='joinType']:checked").val();
    			if(joinType == undefined){
    				alert("유형을 선택하세요");
    				return;
    			}
    			if(joinType == "T"){
    				alert("교직원 선택");
    			} else {
    				alert("학부모 선택");
    			}
    		});
    	});
    </script>

<%@ include file="../includes/footer.jsp"%>