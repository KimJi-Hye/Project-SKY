<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



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
     <form role="form" action="/board/classModify" method="post">
 
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
          
          

	      <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
	      <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
		  <button type="button" onclick="location.href='/board/classList'">목록</button>
		  
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
$(document).ready(function() {

	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/board/classRemove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/board/classList").attr("method","get");
	      formObj.empty();
		}
	    
	    formObj.submit();
	  });

});
</script>


