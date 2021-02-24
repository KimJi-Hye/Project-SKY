<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/mem_header.jsp"%>

<div class="memberBox signup1">

	<div class="cardBox join_contents">

		<div class="join_title">
			<h2>회원가입</h2>
			<p>STEP 01. 유형 선택</p>
		</div>
		<div class="join_con">
			<form role="form" action="/member/jointeacher" method="get">
				<div class="radioBox">
					<input type="radio" name="joinPage" value="parents" id="typeP"> 
					<label for="typeP"><span></span> 학부모</label> 
					<input type="radio" name="joinPage" value="teacher" id="typeT"> 
					<label for="typeT"><span></span> 교직원</label>
				</div>

				<div class="parents_box">
					<div class="plus_box"></div>
					<button type="submit" class="join_next">
						다음단계 <span class="material-icons">navigate_next</span>
					</button>
				</div>
			</form>
		</div>
	</div>

</div>

<script>
   	$(document).ready(function(){
   		
   		// 유형 선택
   		var formObj = $("form");
        var p_box = $(".parents_box");
        $("input[name='joinPage'").click(function(){
            if($(this).val() == "parents"){
                p_box.find(".plus_box").html("<input type='text' name='cunicode' class='input_tx' placeholder='원아 고유번호를 입력하세요.'>");
            } else {
                p_box.find(".plus_box").html("");
            }
        });
        
        $(".join_next").click(function(e){
            var joinType = $("input[name='joinPage']:checked").val();
            var textbox = $("input[name='cunicode']");

            e.preventDefault();

            if(joinType == undefined){
                alert("유형을 선택하세요");
                return;
            }
            if(joinType == "parents"){
       			var textbox = $("input[name='cunicode']");
       			
       			// 공백
       			if(textbox.val() == ""){
       				alert("고유번호를 입력하세요.");
       				textbox.focus();
       				return;
       			}
       			
       			<c:forEach items="${type}" var="type">
       				// 등록 고유번호 조회
    	   			if(textbox.val() == "${type.cunicode}"){
    	   				
    	   				// 등록 회원 조회
    	   				<c:forEach items="${usercode}" var="usercode">
    	   					if(textbox.val() == "${usercode.cunicode}"){
    	   						alert("이미 등록되어있는 회원입니다.");
    	   						textbox.val("");
    	   						textbox.focus();
    	   						return false;
    	   					}
    		   	   		</c:forEach>
    	   					
    		   	   		formObj.attr("action", "/member/joinparents");
    		   	   		formObj.submit();
    		   	   		return true;
    	   	   			
    	   			}
    			</c:forEach>
    			
    			alert(textbox.val() + "는 등록되지 않은 고유번호 입니다.");
    			textbox.val("");
    			textbox.focus();
    			return false;
                
            } else {
                formObj.submit();   				
            }
        });
   		
   	});
</script>

<%@ include file="../includes/mem_footer.jsp"%>