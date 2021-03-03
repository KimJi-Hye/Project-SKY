<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
    		<h2>반 관리</h2>
	    </div>
    	<div class="admin_contents">
			
			<form id="operForm" action="/admin/classRegister" method="post">
	    		<div class="reg_box_con">
                	<div class="reg_box">
				    	<ul>
				    		<li>
				    			<p>반 이름</p>
				    			<input type="text" class="form-control" name='className' required>
				    		</li>
				    		<li>
				    			<p>연령</p>
				    			<input type="text" class="form-control" name='classAge' required>
				    		</li>
				    		<li>
				    			<p>정원</p>
				    			<input type="text" class="form-control" name='classTotal' required>
				    		</li>
				    	</ul>
			    	</div>
					
	    		</div>
		    	
		    	<div class="btn_box">
					<button type="submit" class="btn_reg">등록</button>
					<button data-oper='classList' class="btn btn-info btn_list">목록</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			</form>
	    	
	    </div>
    </section>
		
<script type="text/javascript">
	$(document).ready(function (e){
		
		var operForm = $("#operForm");
		$("button[data-oper='classList']").on(
				"click",
				function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/admin/classList").attr(
							"method", "get").submit();
				});
	});
</script>

<%@ include file="../includes/admin_footer.jsp"%>