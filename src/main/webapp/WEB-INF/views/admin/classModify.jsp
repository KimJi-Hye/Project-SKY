<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
    		<h2>반 관리</h2>
	    </div>
    	<div class="admin_contents">
    	
    		<form id="operForm" action="/admin/classUpdate" method="post">
	    		<div class="reg_box_con">
                	<div class="reg_box">
				    	<ul>
				    		<li>
				    			<p>Bno</p>
				    			<input type="text" class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
				    		</li>
 
				    		<li>
				    			<p>반이름</p>
				    			<input type="text" class="form-control" name='className' value='<c:out value="${board.className }"/>'>
				    		</li>

				    		<li>
				    			<p>연령</p>
				    			<input type="text" class="form-control" name='classAge' value='<c:out value="${board.classAge }"/>'>
				    		</li>

				    		<li>
				    			<p>정원</p>
				    			<input type="text" class="form-control" name='classTotal' value='<c:out value="${board.classTotal }"/>'>
				    		</li>
				    	</ul>
			    	</div>
					
	    		</div>
		    	
		    	<div class="btn_box">
		        	<button data-oper='classModify' class="btn btn-default btn_reg">수정</button>
					<button data-oper='classList' class="btn btn-info btn_list">목록</button>
					<button data-oper='classRemove' class="btn btn-danger btn_del">삭제</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  
			</form>
	    	
	    </div>
    </section>

	<script>
		$(document).ready(
			function() {

				var operForm = $("#operForm");

				$("button[data-oper='classModify']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/admin/classModify").attr("result", "success").submit();
				});

				$("button[data-oper='classList']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/admin/classList").attr("method", "get").submit();
				});

				$("button[data-oper='classRemove']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/admin/classRemove").attr("result", "success").submit();
				});

			});
	</script>

<%@ include file="../includes/admin_footer.jsp"%>