<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
	    	<h2>권한 관리 - 수정</h2>
    	</div>
    	<div class="admin_contents">
    	
	    	<form id="operForm" action="/author/modify" method="post">
	    		<div class="reg_box_con">
                	<div class="reg_box">
			    		<ul>
			    			<li>
			    				<p>권한등급</p>
			    				<input type="text" name="auth" value='<c:out value="${auth.auth}" />' readonly>
			    			</li>
			    			<li>
			    				<p>권한명 </p>
			    				<input type="text" name="atname" value='<c:out value="${auth.atname}" />' >
			    			</li>
			    			<li>
			    				<p>반이름</p>
			    				<select name="classname">
					   				<option value="<c:out value="${auth.classname}" />" selected><c:out value="${auth.classname}" /></option>
					   				<c:forEach items="${mngList}" var="boardMng">
					       				<option value="${boardMng.className}">${boardMng.className}</option>
					       			</c:forEach>
								</select>
							</li>
			    		</ul>
			    	</div>
	    		</div>

				<div class="btn_box">
		    		<button type="submit" class="btn_mod">수정</button>
		    		<button type="button" class="btn_del">삭제</button>
		    		<button type="button" class="btn_list">리스트</button>
	    		</div>
	    		
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
	    	</form>
	    	
	    </div>
    </section>

	<script type="text/javascript">
		$(document).ready(function(){
			var operForm = $("#operForm");
			$(".btn_list").click(function(){
				self.location = "/author/list";
			});
			$(".btn_del").click(function(){
				operForm.attr("action", "/author/remove");
				operForm.submit();
			});
		});
	</script>

<%@ include file="../includes/admin_footer.jsp"%>