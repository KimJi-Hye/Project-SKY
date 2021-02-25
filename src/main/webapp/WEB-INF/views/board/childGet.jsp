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
					<label>원아성별</label> <input class="form-control" name='cgender'
						value='<c:out value="${board.cgender}"/>'>
				</div>

				<div class="form-group">
					<label>아동 생년 월일</label><input type="hidden">
					<fmt:parseDate var="cbirth" value="${board.cbirth}"
						pattern="yyyy-MM-dd" />
					<input class="form-control" name='cbirth' type='date'
						value='<fmt:formatDate pattern="yyyy-MM-dd"
						value="${cbirth}" />'>
				</div>
				
				<div class="form-group">
					<label>입학일</label><input type="hidden">
					<fmt:parseDate var="enter" value="${board.enter}"
						pattern="yyyy-MM-dd" />
					<input class="form-control" name='enter' type='date'
						value='<fmt:formatDate pattern="yyyy-MM-dd"
						value="${enter}" />'>
				</div>
				
				<div class="form-group">
					<label>졸업일</label><input type="hidden">
					<fmt:parseDate var="graduation" value="${board.graduation}"
						pattern="yyyy-MM-dd" />
					<input class="form-control" name='graduation' type='date'
						value='<fmt:formatDate pattern="yyyy-MM-dd"
						value="${graduation}" />'>
				</div>
				
				<button data-oper='childModify' class="btn btn-default">수정</button>
				<button data-oper='childList' class="btn btn-info">돌아가기</button>
				<button data-oper='childRemove' class="btn btn-default">탈퇴하기</button>
				
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
	
	$("button[data-oper='childModify']").on("click", function(e) {
		
		operForm.attr("action", "/board/childModify").submit();
	});
	
	$("button[data-oper='childList']").on("click", function(e) {
		
		operForm.find("#cunicode").remove();
		operForm.attr("action", "/board/childList").attr("method","get")
		var pageNumTag = $("input[name='pageNum']").clone();
		var pageamountTag = $("input[name='amount']").clone();
		var keywordTag = $("input[name='keyword']").clone();
		var typeTag = $("input[name='type']").clone();
		
		operForm.empty();
		operForm.append(pageNumTag);
		operForm.append(pageamountTag);
		operForm.append(keywordTag);
		operForm.append(typeTag);
		
		operForm.submit();
		
	});
	
	$("button[data-oper='childRemove']").on("click", function(e){
		
		operForm.attr("action", "/board/childRemove").submit();
		
	});
});
</script>
<%@include file="../includes/footer.jsp"%>