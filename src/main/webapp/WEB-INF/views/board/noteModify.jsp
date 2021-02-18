<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Note Modify Page</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Note Modify Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
       

     <form id="operForm" action="/board/noteUpdate" method="post">
 
 		 <div class="form-group">
	          <label>Bno</label>
	          <input class="form-control" name='bno'
	                 value='<c:out value="${board.bno }"/>' readonly="readonly">
          </div>
 
          <div class="form-group">
            <label>반이름</label> 
            <input class="form-control" name='className'
                   value='<c:out value="${board.className }"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>원아이름</label> 
            <input class="form-control" name='cunicode'
                   value='<c:out value="${board.cunicode }"/>' readonly="readonly">
          </div>

		<div class="form-group">
			<label>제목</label> <input class="form-control" name='title'
				   value='<c:out value="${board.title }"/>'>
		</div>  
          
		<div class="form-group">
			<label>내용</label> <textarea class="form-control" rows="5" name='content'>
			<c:out value="${board.content }"/></textarea>
		</div>
						
		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='writer'
			value='<c:out value="${board.writer }"/>'>
		</div>
				
		<div class="form-group">
			<label>작성일</label> <input class="form-control" name='regdate'
			value='<c:out value="${board.regdate }"/>' readonly="readonly">
		</div>
          
           
          <button data-oper='noteModify' class="btn btn-default">수정</button>
		  <button data-oper='noteList' class="btn btn-info">목록</button>
		  <button data-oper='noteRemove' class="btn btn-danger">삭제</button>
		  
		  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>

	</form>
	

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script>
	$(document).ready(
			function() {

				var operForm = $("#operForm");

				$("button[data-oper='noteModify']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/noteModify").attr("result", "success").submit();
				});

				$("button[data-oper='noteList']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/noteList").attr("method", "get").submit();
				});

				$("button[data-oper='noteRemove']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/noteRemove").attr("result", "success").submit();
				});

			});
</script>


<%@include file="../includes/footer.jsp"%>