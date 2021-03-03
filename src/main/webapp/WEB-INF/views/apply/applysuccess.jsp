<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	.successBox{
		text-align: center;
	}
	.successBox .imgBox{
		width: 800px; margin: 0 auto 20px;
	}
	.successBox .imgBox img{
		width: 100%;
	}
	.successBox h4{
		margin-bottom: 50px;
		font-size: 32px;
	}
	.successBox h4 span{
		color: #0A69CC;
	}
	.successBox p{
		margin-bottom: 10px;
		font-size: 21px;
		line-height: 28px; 
	}
	.form-button {
		margin: 60px 0;
	}
</style>

<div id="wrapper">
	<div class="boardTitle">
		<h3>온라인 접수 완료</h3>
	</div>
	<div class="form-group">
		
		<div class="successBox">
			<div class="imgBox">
				<img src="/resources/img/apply.jpg" alt="접수완료">
			</div>
			<h4>접수번호 <span id="ano"><c:out value="${as.ano}"/></span> 번으로 접수가 완료되었습니다!</h4>
			<p>입력하신 이메일 ( <span id="useremail"><c:out value="${as.useremail}"/></span> )로 접수번호가 발송되었습니다.</p>
			<p>기타 문의 사항은 원으로 연락부탁드립니다.</p>
		</div>
 	
	   	<div class="form-button">
			<button id="main" class="btn btn-default btn_mod">메인으로</button>
			<button id="read" class="btn btn-info btn_list">접수조회</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	
	var email = $("#useremail").text(); //입력한 이메일
	var ano = $("#ano").text(); // 인증번호 입력란

	$.ajax({

		type : "GET",
		url : "sendMail2?email=" + email + "&ano=" + ano,
		success : function(data) {

			console.log("data : " + data);

		}

	});
	
	$("#main").on("click", function() {

		self.location = "../";

	});
	
	$("#read").on("click", function() {

		self.location = "/apply/applyCheck";

	});
});
</script>

<%@ include file="../includes/footer.jsp"%>