<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>공지사항</h3>
	</div>
	<div class="form-group">

		<form id='operForm' action="/board/noticeGet" method="post">
			<ul>
				<li><label>No</label> <input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly" required></li>
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' required></li>
				<li><label>내용</label> 
					<textarea name="content" class="textareaBox" required><c:out value="${board.content}"/></textarea>
				</li>
			</ul>

			<div class="form-button">
				<button data-oper='noticeList' class="btn_list">목록</button>
				<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
					<button data-oper='noticeModify' class="btn_mod">수정</button>
					<button data-oper='noticeRemove' class="btn_del">삭제</button>
				</sec:authorize>
				
			</div>

			<input type="hidden" name='pageNum'
				value='<c:out value="${cri.pageNum}"/>'> <input
				type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
		
		</form>

	</div>
</div>
<!-- /.panel-body -->
<!-- <script type="text/javascript">

$(document).ready(function() {

 	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
		e.preventDefault();
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/board/applyRemove");
	      
	    } else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/board/applyList").attr("method","get");
	      formObj.empty();
	      
		} else if(operation === 'applyModify'){
		  formObj.attr("action", "/board/applyModify").attr("method","post");
		  formObj.empty();
		
		}
	    
	    formObj.submit();
	  });

});
</script> -->
<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	

	$("button[data-oper='noticeModify']").on("click", function(e) {
		e.preventDefault();		
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noticeModify").attr("result", "success").submit();
	});
	
	$("button[data-oper='noticeList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noticeList").attr("method","get").submit();
	});
	
	$("button[data-oper='noticeRemove']").on("click", function(e){
		operForm.attr("action", "/board/noticeRemove").submit();
	});
});
</script>
<%@include file="../includes/footer.jsp"%>