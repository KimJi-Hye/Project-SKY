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
		
		<div class="parents_box">
			원아 고유번호 조회
			<input type="text" name="cunicode">
			<button type="submit" class="join_next_p">다음단계 ></button>
		</div>
	</form>
</div>

<script>
   	$(document).ready(function(){
   		
   		// 유형 선택
   		var formObj = $("form");
   		var p_box = $(".parents_box");
   		p_box.hide();
   		$(".join_next").click(function(e){
   			var joinType = $("input[name='joinPage']:checked").val();
   			e.preventDefault();
   			if(joinType == undefined){
   				alert("유형을 선택하세요");
   				return;
   			}
   			if(joinType == "parents"){
   				p_box.show();
   			} else {
	   			formObj.submit();   				
   			}
   		});
   		
   		$(".join_next_p").click(function(e){
   			e.preventDefault();
   			var textbox = $("input[name='cunicode']");
   			if(textbox.val() == ""){
   				alert("고유번호를 입력하세요.");
   				textbox.focus();
   				return
   			}
   			formObj.attr("action", "/member/joinparents");
   			formObj.submit();
   		});
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>