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
				
				<form id='operForm' action="/board/applyGet" method="post">	
					<div class="form-group">
						<label>접수번호</label> <input class="form-control" name='ano'
							value='<c:out value="${board.ano}"/>' readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>학부모이름</label> 
						<input class="form-control" name='pname'
							value='<c:out value="${board.pname}"/>' readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>관계</label> <input class="form-control" name='relation'
							value='<c:out value="${board.relation}"/>'>
					</div>
	
					<div class="form-group">
						<label>학부모 생년 월일</label><input type="hidden">
						<fmt:parseDate var="pbirth" value="${board.pbirth}"
							pattern="yyyy-MM-dd" />
							
						<input class="form-control" name='pbirth' type='date'
							value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${pbirth}" />'>
					</div>
	
					<div class="form-group">
						<label>주소</label> <input class="form-control" name='addr'
							value='<c:out value="${board.addr}"/>'>
					</div>
	
					<div class="form-group">
						<label>연락처</label> <input class="form-control" name='phone'
							value='<c:out value="${board.phone}"/>'>
					</div> 
					
					<div class="form-group">
						<label>e-mail</label> <input class="form-control" name='useremail'
							value='<c:out value="${board.useremail}"/>'>
					</div> 
	
					<div class="form-group">
						<label>아동이름</label> <input class="form-control" name='cname'
							value='<c:out value="${board.cname}"/>'>
					</div>
	
					<div class="form-group">
						<label>아동성별</label> <input class="form-control" name='cgender'
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
						<label>접수유형</label> <input class="form-control" name='apptype'
							value='<c:out value="${board.apptype}"/>'>
					</div>
	
					<div class="form-group">
						<label>접수상태</label> <input class="form-control" name='appstate'
							value='<c:out value="${board.appstate}"/>'>
					</div>
	
					<div class="form-group">
						<label>아동고유번호</label> <input class="form-control" name='cunicode'
							value='<c:out value="${board.cunicode}"/>' >
					</div>
					
					<div class="form-group">
						<label>소속반</label> <input class="form-control" name='cclass'
							value='<c:out value="${board.cclass}"/>' >
					</div>
					
					<div class="form-group">
						<label>비밀번호</label>
						<input class="form-control" name='pw'>
					</div>
	
					<button data-oper='applyModify' class="btn btn-default">수정</button>
					<button data-oper='applyList' class="btn btn-info">돌아가기</button>
					<button data-oper='applyRemove' class="btn btn-default">접수취소</button>

					<input name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				    <input name='amount' value='<c:out value="${cri.amount}"/>'>
	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
				    
				</form>
				
				<form id='operForm2' action="/board/applyPass" method="post">
				
					<div class="form-group">
						<input class="form-control" name='ano'
							value='<c:out value="${board.ano}"/>' type='hidden'>
					</div>
					
					<div class="form-group">
						<input class="form-control" name='cname'
							value='<c:out value="${board.cname}"/>' type='hidden'>
					</div>
				
					<div class="form-group">
						<input type="hidden">
						<fmt:parseDate var="cbirth" value="${board.cbirth}"
							pattern="yyyy-MM-dd" />
						<input class="form-control" name='cbirth' type='hidden'
							value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${cbirth}" />'>
					</div>
					
					<div class="form-group">
						<input class="form-control" name='cgender'
							value='<c:out value="${board.cgender}"/>' type='hidden'>
					</div>
					
					<h1>관리자 승인용</h1>
					<div class="form-group">
						<label>아동고유번호</label> <input class="form-control" name='cunicode'>
					</div>
					
	   				담당 반
   				 	<select name="cclass">
   						<option value="" selected>선택</option>
   						<c:forEach items="${mngList}" var="boardMng">
       						<option value="${boardMng.className}">${boardMng.className}</option>
       					</c:forEach>
					</select>
					
					<button data-oper='applyPass' class="btn btn-default">최종 승인</button>
	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
	
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

<!-- <script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'applyRemove') {
			
			formObj.attr("action", "/board/applyRemove");
			
		} else if(operation === 'applyModify') {
			formObj.attr("action", "/board/applyModify");
			
		} else if(operation === 'applyList') {
			
			formObj.attr("action", "/board/applyList").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var pageamountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(pageamountTag);
			
		}
		
		formObj.submit();
	});
	
});
</script> -->

<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='applyModify']").on("click", function(e) {
		
		operForm.attr("action", "/board/applyModify").submit();
	});
	
	$("button[data-oper='applyList']").on("click", function(e) {
		
		operForm.find("#ano").remove();
		operForm.attr("action", "/board/applyList").attr("method","get")
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
	
	$("button[data-oper='applyRemove']").on("click", function(e){
		
		operForm.attr("action", "/board/applyRemove").submit();
		
	});
	
	$("button[data-oper='applyPass']").on("click", function(e){
		operForm.attr("action", "/board/applyPass").submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>