<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Note Register Page</h1>
</body>
</html>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Note Register Page</div>
			
			<div class="panel-body">
			
			<form id="operForm" action="/board/noteRegister" method="post">
			<div class="form-group">
				<label>반 이름</label> 
				 <select name="className">
   					<option value="" selected>선택</option>
   					<c:forEach items="${mngList}" var="boardMng">
       				<option value="${boardMng.className}">${boardMng.className}</option>
       				</c:forEach>
				 </select>
			</div>
		
	        
			<div class="form-group">
				<label>원아 이름</label> 
				 <select name="cunicode">
   					<option value="" selected>선택</option>
   					
				 </select>
			</div>

	
				<div class="form-group">
				<label>제목</label> 
				<input class="form-control" name='title'>
				</div>
				
				<div class="form-group">
				<label>내용</label> 
				<textarea class="form-control" rows="5" name='content'></textarea>
				</div>
				
				<div class="form-group">
				<label>작성자</label> 
				<input class="form-control" name='writer'>
				</div>
				
				<input type="submit" value="등록">
				<button data-oper='noteList' class="btn btn-info">목록</button>


			</form>
			
			
			
			</div>

		</div>

	</div>

</div>

<script type="text/javascript">
	$(document).ready(function (e){
		
		var operForm = $("#operForm");
		$("button[data-oper='noteList']").on(
				"click",
				function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/noteList").attr(
							"method", "get").submit();
				});	
		
		$("select[name='className']").change(function(){
			var name = $("select[name='cunicode']");
			var str ="";
			
			str +="<option value='' selected>선택</option>";
			str +="<c:forEach items='${cnameList}' var='boardChild'>";
			if($(this).val() == "${boardChild.classname}"){
			str +="<option value='${boardChild.cunicode}'>${boardChild.cname}(${boardChild.cunicode})</option>";
			}
			
			str +="</c:forEach>";
			
			name.html(str);
		});
	});
</script>




<%@include file="../includes/footer.jsp"%>
