<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Class Modify Page</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Class Modify Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
       
<!-- 추가 -->
     <form id="operForm" action="/board/classUpdate" method="post">
 
 		 <div class="form-group">
	          <label>Bno</label>
	          <input class="form-control" name='bno'
	                 value='<c:out value="${board.bno }"/>' readonly="readonly">
          </div>
 
          <div class="form-group">
            <label>반이름</label> 
            <input class="form-control" name='className'
                   value='<c:out value="${board.className }"/>'>
          </div>

          <div class="form-group">
            <label>연령</label> 
            <input class="form-control" name='classAge'
                   value='<c:out value="${board.classAge }"/>'>
          </div>

          <div class="form-group">
            <label>정원</label> 
            <input class="form-control" name='classTotal'
                   value='<c:out value="${board.classTotal }"/>'>
          </div>
          
          <button data-oper='classModify' class="btn btn-default">수정</button>
		  <button data-oper='classList' class="btn btn-info">목록</button>
		  <button data-oper='classRemove' class="btn btn-danger">삭제</button>

		  
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

				$("button[data-oper='classModify']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classModify").attr("result", "success").submit();
				});

				$("button[data-oper='classList']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classList").attr("method", "get").submit();
				});

				$("button[data-oper='classRemove']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/classRemove").attr("result", "success").submit();
				});

			});
</script>

<%@include file="../includes/footer.jsp"%>
