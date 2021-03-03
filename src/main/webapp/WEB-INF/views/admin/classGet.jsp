<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_get2">
    	<div class="admin_title">
    		<h2>반 관리</h2>
	    </div>
    	<div class="admin_contents">

			<form id='operForm' action="/admin/classGet" method="post">

				<div class="get_box_con">

                	<div class="get_box">
						<ul>
							<li>
								<p>Bno</p>
								<input type="text" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
							</li>
                              
							<li>
								<p>반이름</p>
								<input type="text" name='className' value='<c:out value="${board.className }"/>' readonly="readonly">
							</li>
                                    
							<li>
								<p>연령</p>
								<input type="text" name='classAge' value='<c:out value="${board.classAge }"/>' readonly="readonly">
							</li>
                                        
							<li>
								<p>정원</p>
								<input type="text" name='classTotal' value='<c:out value="${board.classTotal }"/>' readonly="readonly">
							</li>
						</ul>
					</div>
					<div class="get_list">
						<div class="get_t">
                        	<c:forEach items="${boardT}" var="testt">
	                        	<c:if test="${testt.classname eq board.className}">
		                        	<p class="get_dt">담임 선생님</p>
		                        	<p>${testt.userName}</p>
	                        	</c:if>
                        	</c:forEach>
						</div>
						<div class="get_c">
							<p class="get_dt">원아 명단</p> 
							<ul id="inputState" >
								<c:forEach items="${cnameList}" var="test">
									<c:if test="${test.classname eq board.className}">
										<li>${test.cname}(${test.cunicode})</li>
									</c:if>			
								</c:forEach>
							</ul>
						</div>
					</div>
						
				</div>

		    	<div class="btn_box">
					<button data-oper='classModify' class="btn btn-default btn_mod">수정</button>
					<button data-oper='classList' class="btn btn-info btn_list">목록</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			</form>
	    	
	    </div>
    </section>
    
	<script>
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='classModify']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/admin/classModify").attr("method", "get").submit();
			});
			$("button[data-oper='classList']").on("click",function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/admin/classList").attr("method", "get").submit();
			});
		});
	</script>

<%@ include file="../includes/admin_footer.jsp"%>