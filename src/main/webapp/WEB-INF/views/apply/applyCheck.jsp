<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	.form-group ul li{
		justify-content: center; 
	}
	.form-group ul li label{
		width: 100px; padding-right: 10px;
	}
	.form-group ul li input{
		width: 240px;
	}
	.btn_box{
		margin: 30px 0;
		display: flex;
		justify-content: center;
	}
	.btn_box button{
		width: 340px; padding: 10px;
		font-size: 18px;
		font-weight: bold;
		transition: .2s;
	}
	.btn_box button:hover{
		background: #0c4f96;
	}
</style>

<div id="wrapper">
	<div class="boardTitle">
    	<h3>온라인 접수 조회</h3>
	</div>
	<div class="form-group">
		<form role="form" action="/apply/applyGetMember" method="get">
			<ul>
				<li>
					<label for="ano">접수번호</label>
					<input type="text" id="ano" name="ano" required>
				</li>
				<li>
					<label for="pw">비밀번호</label>
					<input type="password" id="pw" name="pw" required>
				</li>
			</ul>
			<div class="btn_box">
				<button type="submit" class="btn_reg">조회</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>		
	</div>
</div>

<script>
$(document).ready(function() {
	
	var formObj = $("form");
	
	$("button[type='submit']").click(function(e) {
		
		e.preventDefault();
		var ano = $("#ano").val();
        var pw = $("#pw").val();
        var anoPass;
        
        $.ajax({
        	url:'/apply/anoCheck?ano=' + ano,
       		type:'get',
       		success:function(data){
       			//alert(data);
       			if(data > 0){
   					anoPass = true;
   					return true;
       			} else {
       				alert("접수되지 않은 번호입니다.");
       				$("input[name='ano']").focus();
       				anoPass = false;
       				return false;
       			}
       		}
        }) 
        
        $.ajax({
        	url:'/apply/anoPwCheck?ano=' + ano,
       		type:'get',
       		success:function(data){
       			//alert(data);
       			//alert(pw);
       			if(anoPass == false){
       				alert("접수되지 않은 번호입니다.");
       				$("input[name='ano']").focus();
       				return false;
       			} else {
       		        if(pw == ""){
       					alert("비밀번호를 입력하세요.");
       					$("input[name='pw']").focus();
       					return false;
       				}
       				if(pw != data){
	   					alert("비밀번호가 일치하지 않습니다.");
	   					$("input[name='pw']").focus();
	   					return false;
	   				} else {
	   					$("#pw").remove();
	   					formObj.submit();
	   				}
       			}
       		}
        })
		
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>