<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
	    	<h2>권한 관리 - 등록</h2>
    	</div>
    	<div class="admin_contents">
    	
	    	<form action="/author/register" method="post">
	    		<div class="reg_box_con">
                	<div class="reg_box">
			    		<ul>
			    			<li>
			    				<p>권한등급 </p>
			    				<input type="text" name="auth" required>
			    			</li>
			    			<li>
			    				<p>권한명 </p>
			    				<input type="text" name="atname" required>
			    			</li>
			    			<li>
			    				<p>반이름</p> 
				    			<select name="classname">
				    				<option value="">선택</option>
				    				<c:forEach items="${mngList}" var="list">
				    				<option value="${list.className}">${list.className}</option>
				    				</c:forEach>
				    			</select>
			    			</li>
			    		</ul>
			    	</div>
	    		</div>

				<div class="btn_box">
	    		<button type="submit" class="btn_reg">등록</button>
	    		<button type="button" class="btn_list">리스트</button>
	    		</div>
	    		
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
	    	</form>
	    	
	    </div>
    </section>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_list").click(function(){
			self.location = "/author/list";
		});
	});
</script>

<%@ include file="../includes/admin_footer.jsp"%>