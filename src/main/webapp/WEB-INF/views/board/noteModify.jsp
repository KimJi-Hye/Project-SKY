<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>



<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Note Modify Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
       

     <form id="operForm" action="/board/noteModify" method="post">
 
 		 <div class="form-group">
	         <label>Bno</label>
	         ${board.bno }
          </div>
 
          <div class="form-group">
            <label>반이름</label> 
            ${board.classname }
          </div>

          <div class="form-group">
            <label>원아이름</label> 
            ${board.cunicode }
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
			<label>작성일</label> 
			${board.regdate }
		</div>
          
           
				<div class="btn_box">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_list">목록</button>
					<button type="button" class="btn_del">삭제</button>
				</div>
		  
				
		 <input type="hidden" id="bno" name="bno" value="${board.bno}">
	  


	</form>
	

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script type="text/javascript">

$(document).ready(function() {
	
	var operForm = $("#operForm");
	$(".btn_mod").click(function() {
		operForm.submit();
	});
	$(".btn_list").click(function() {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteList").attr("method","get");
		operForm.submit();
	});
	$(".btn_del").click(function() {
		operForm.attr("action", "/board/noteRemove");
		operForm.submit();
	});
});

</script>

<%@include file="../includes/footer.jsp"%>