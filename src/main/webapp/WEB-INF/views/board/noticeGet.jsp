<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				
			<form id='operForm' action="/board/noticeGet" method="post">	
				<div class="form-group">
					<label>게시물 번호</label> <input class="form-control" name='bno'
						value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>게시물 제목</label> 
					<input class="form-control" name='title'
						value='<c:out value="${board.title}"/>' >
				</div>

				<div class="form-group">
					<label>내용</label> <input class="form-control" name='content'
						value='<c:out value="${board.content}"/>'>
				</div>
				
				<button data-oper='noticeModify' class="btn btn-default">수정</button>
				<button data-oper='noticeList' class="btn btn-info">돌아가기</button>
				<button data-oper='noticeRemove' class="btn btn-default">탈퇴하기</button>

				<input name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			    <input name='amount' value='<c:out value="${cri.amount}"/>'>
				    
			</form>
				
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
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
		operForm.attr("action", "/board/noticeModify").submit();
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