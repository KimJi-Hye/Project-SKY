<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
	    	<h2> 회원 관리 - 
		    	<c:if test="${param.userType eq 'T'}">교직원 회원정보 수정</c:if>
		    	<c:if test="${param.userType eq 'P'}">학부모 회원정보 수정</c:if>
	    	</h2>
	    </div>
    	<div class="admin_contents">
    	
	    	<form id="operForm" action="/member/memModify" method="post">
	    		<input type="hidden" name="userPw" value="${member.userPw}">
	    		<input type="hidden" name="userType" value="${member.userType}">
	    		
	    		<div class="reg_box_con">
                	<div class="reg_box">
                		<h3>회원 정보</h3>
				    	<ul>
				    		<li>
			    				<p>아이디 </p>
			    				<input type="text" name="userId" value="${member.userId}" readonly>
				    		</li>
				    		<li>
			    				<p>이름</p>
			    				<input type="text" name="userName" value="${member.userName}">
				    		</li>
				    		<li>
			    				<p>생년월일</p>
								<fmt:parseDate var="userBirth" value="${member.userBirth}" pattern="yyyy-MM-dd" />
			               		<input type="date" name="userBirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${userBirth}" />'>
				    		</li>
				    		<li>
			    				<p>연락처</p>
			    				<input type="text" name="userPhone" value="${member.userPhone}">
				    		</li>
				    		<li>
			    				<p>주소</p>
			    				<input type="text" name="userAddr" value="${member.userAddr}">
				    		</li>
				    		<li>
			    				<p>이메일</p>
			    				<input type="text" name="userEmail" value="${member.userEmail}">
				    		</li>
				    		<li>
			    				<p>권한</p>
					    		<select name="auth">
					    			<option value="${member.auth}" selected>${member.auth}</option>
					    			<c:forEach items="${author}" var="at">
					    			<option value="${at.auth}">${at.auth} (${at.classname})</option>
					    			</c:forEach>
					    		</select> 
				    		</li>
		    			</ul>
		    		</div>
		    		
					<c:if test="${param.userType eq 'T'}">
                	<div class="reg_box">
                		<h3>반 정보</h3>
				    	<ul>
					    	<li>
			    				<p>반이름</p>
					    		<select name="classname">
					    			<c:if test='${member.classname eq null}'>
					   				<option value="" selected>-선택-</option>
					   				</c:if>
					   				<c:if test='${member.classname ne null}'>
					   				<option value="${member.classname}" selected>${member.classname}</option>
					       			<option value="">반없음</option>
					   				</c:if>
					   				<c:forEach items="${mngList}" var="boardMng">
					   					<c:if test="${member.classname ne boardMng.className}">
					       				<option value="${boardMng.className}">${boardMng.className}</option>
					       				</c:if>
					       			</c:forEach>
								</select>
							</li>
		    			</ul>
		    		</div>
		    		</c:if>
		    		
					<c:if test="${param.userType eq 'P'}">
                	<div class="reg_box">
                		<h3>원아 정보</h3>
				    	<ul>
				    		<li>
			    				<p>관계 </p>
			    				<input type="text" name="relation" value="${member.relation}">
				    		</li>
				    		<li>
			    				<p>아동명</p>
			    				<input type="text" name="cname" value="${member.cname}" readonly>
				    		</li>
				    		<li>
			    				<p>아동 고유번호</p>
			    				<input type="text" name="cunicode" value="${member.cunicode}" readonly>
				    		</li>
				    		<li>
			    				<p>반이름 </p>
			    				<input type="text" name="classname" value="${member.classname}" readonly>
				    		</li>
				    		<li>
			    				<p>생년월일 </p>
			    				<p>${member.cbirth}</p>
				    		</li>
		    			</ul>
		    		</div>
		    		
                	<div class="reg_box">
                		<h3>접수 정보</h3>
				    	<ul>
				    		<li>
			    				<p>접수유형</p>
			    				<input type="text" name="apptype" value="${member.apptype}" readonly>
				    		</li>
				    	</ul>
			    	</div>
					</c:if>
					
	    		</div>
		    	
		    	<div class="btn_box">
		    		<button type="button" class="btn_reg">저장</button>
		    		<button type="button" class="btn_list">목록</button>
		    	</div>
	    		
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    	
	    	</form>
	    	
	    </div>
    </section>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	$(".btn_reg").click(function(){
		console.log("submit clicked");
		operForm.submit();
	});
	$(".btn_list").click(function(){
		operForm.find("#userId").remove();
		operForm.find("#userType").remove();
		operForm.attr("action", "/member/memList").attr("method", "get");
		operForm.submit();
	})
});
</script>

<%@ include file="../includes/admin_footer.jsp"%>