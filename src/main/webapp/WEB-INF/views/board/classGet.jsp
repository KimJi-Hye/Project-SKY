<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

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

				<form id='operForm' action="/board/classGet" method="post">
				
				  <div class="form-group">
	         		 <label>Bno</label>
	         		 <input class="form-control" name='bno'
	                 value='<c:out value="${board.bno }"/>' readonly="readonly">
        		  </div>
				
				
					<div class="form-group">
						<label>반이름</label> <input class="form-control" name='className'
							value='<c:out value="${board.className }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>연령</label> <input class="form-control" name='classAge'
							value='<c:out value="${board.classAge }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>정원</label> <input class="form-control" name='classTotal'
							value='<c:out value="${board.classTotal }"/>' readonly="readonly">
					</div>
					
					
					<div class="form-group">
					<label>담임선생님</label> 
					<select id="inputState" class="form-control" >
   					<option selected>선생님명단</option>
					<c:forEach items="${boardT}" var="testt">
						<c:if test="${testt.classname eq board.className}">
	       			<option value="${testt.userName}">${testt.userName}</option>
						</c:if>
					</c:forEach>
					</select>
					</div>	
					
					
					<div class="form-group">
					<label>소속원아</label> 
					<select id="inputState" class="form-control" >
   					<option selected>원아명단</option>
					<c:forEach items="${cnameList}" var="test">
						<c:if test="${test.classname eq board.className}">
	       			<option value="${test.cname}">${test.cname}(${test.cunicode})</option>
						</c:if>					</c:forEach>

					</select>
					</div>
					


					<button data-oper='classModify' class="btn btn-default">수정</button>
					<button data-oper='classList' class="btn btn-info">목록</button>

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
<script>
	$(document).ready(
			function() {
				var operForm = $("#operForm");
				$("button[data-oper='classModify']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classModify").attr("method", "get").submit();
				});
				$("button[data-oper='classList']").on("click",function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classList").attr("method", "get").submit();
				});
			});
</script>


<%@include file="../includes/footer.jsp"%>
