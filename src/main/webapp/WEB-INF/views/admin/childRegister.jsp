<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
    		<h2>원아 관리</h2>
	    </div>
    	<div class="admin_contents">

			<form role="form" action="/admin/childRegister" method="post">

				<div class="reg_box_con">
				
					<div class="reg_box">
				    	<ul>
				
							<li>
								<p>고유번호</p>
				    			<input type="text" name='cunicode' required>
							</li>
								
							<li>
				   				<p>반 이름</p>
			   				 	<select name="classname" required>
			   						<option value="" selected>선택</option>
			   						<c:forEach items="${mngList}" var="boardMng">
			       						<option value="${boardMng.className}">${boardMng.className}</option>
			       					</c:forEach>
								</select>
							</li>
		
							<li>
								<p>이름</p>
				    			<input type="text" name='cname' required>
							</li>
							
							<li>
								<p>성별</p>
				    			<input type="text" name='cgender' required>
							</li>
		
							<li>
								<p>원아생년월일</p>
				    			<input type="date" name='cbirth' required>
							</li>
							
							
							<li>
								<p>입학일</p>
				    			<input type="date" name='enter'>
							</li>
							
							<li>
								<p>졸업일</p>
				    			<input type="date" name='graduation'>
							</li>
						</ul>
			    	</div>
					
	    		</div>
		    	
		    	<div class="btn_box">
					<button type="submit" class="btn btn-default btn_reg">등록</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
		
			</form>
	    	
	    </div>
    </section>

<%@ include file="../includes/admin_footer.jsp"%>