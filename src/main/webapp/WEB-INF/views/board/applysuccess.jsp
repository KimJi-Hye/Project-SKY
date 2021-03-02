<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<h3>온라인 접수 조회</h3>
	</div>
	<div class="form-group">
	   	<ul>
	   		<li>
				<label>접수번호</label>
	   			<p id="ano"><c:out value="${as.ano}"/></p>
			</li>
	   		<li>
				<label>e메일</label>
	   			<p id="useremail"><c:out value="${as.useremail}"/></p>
			</li>
	   	</ul>
 	
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

		self.location = "board/";

	});
});
</script>

<%@ include file="../includes/footer.jsp"%>