<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Class Read Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				
			<form id='operForm' action="/board/childGet" method="post">	
				<div class="form-group">
					<label>고유번호</label> <input class="form-control" name='cunicode'
						value='<c:out value="${board.cunicode}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>원아이름</label> 
					<input class="form-control" name='cname'
						value='<c:out value="${board.cname}"/>' >
				</div>

				<div class="form-group">
					<label>반이름</label> <input class="form-control" name='classname'
						value='<c:out value="${board.classname}"/>'>
				</div>

				<div class="form-group">
					<label>원아생년월일</label> <input class="form-control" name='cbirth'
						value='<c:out value="${board.cbirth}"/>'>
				</div>
				
				<button data-oper='childModify' class="btn btn-default">수정</button>
				<button data-oper='childList' class="btn btn-info">돌아가기</button>
				<button data-oper='childRemove' class="btn btn-default">탈퇴하기</button>

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
	
	$("button[data-oper='childModify']").on("click", function(e) {
		operForm.attr("action", "/board/childModify").submit();
	});
	
	$("button[data-oper='childList']").on("click", function(e) {
		operForm.find("#ano").remove();
		operForm.attr("action", "/board/childList").attr("method","get").submit();
	});
	
	$("button[data-oper='childRemove']").on("click", function(e){
		operForm.attr("action", "/board/childRemove").submit();
	});
});
</script>