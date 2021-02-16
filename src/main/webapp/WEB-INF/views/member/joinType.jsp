<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div>
	<form role="form" action="/member/joinType" method="post">
		<div>
			<h3>유형 선택</h3>
			<input type="radio" name="joinPage" value="teacher" id="typeT"> 
			<label for="typeT">교직원</label> 
			<input type="radio" name="joinPage"	value="parents" id="typeP"> 
			<label for="typeP">학부모</label>
			<button type="submit" class="join_next">다음단계 ></button>
		</div>
	</form>
</div>

<script>
   	$(document).ready(function(){
   		
   		// 유형 선택
   		var formObj = $("form");
   		$(".join_next").click(function(e){
   			var joinType = $("input[name='joinPage']:checked").val();
   			e.preventDefault();
   			if(joinType == undefined){
   				alert("유형을 선택하세요");
   				return;
   			}
   			formObj.submit();
   		});
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>