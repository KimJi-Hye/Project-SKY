<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_get">
    	<div class="admin_title">
	    	<h2> 회원 관리 - 
		    	<c:if test="${param.userType eq 'T'}">교직원 회원정보</c:if>
		    	<c:if test="${param.userType eq 'P'}">학부모 회원정보</c:if>
	    	</h2>
	    </div>
    	<div class="admin_contents">

			<div class="get_box_con">
			
				<div class="get_box">
					<h3>회원 정보</h3>
			    	<ul>
			    		<li>
			    			<p>아이디</p>
			    			<p>${member.userId}</p>
			    		</li>
			    		<li>
			    			<p>이름</p>
			    			<p>${member.userName}</p>
			    		</li>
			    		<li>
			    			<p>생년월일</p>
				    		<p><fmt:parseDate var="userBirth" value="${member.userBirth}" pattern="yyyy-MM-dd HH:mm:ss" />
				    		<fmt:formatDate pattern="yyyy-MM-dd" value="${userBirth}" /><p>
			    		</li>
			    		<li>
			    			<p>연락처</p>
			    			<p>${member.userPhone}</p>
			    		</li>
			    		<li>
			    			<p>주소</p>
			    			<p>${member.userAddr}</p>
			    		</li>
			    		<li>
			    			<p>이메일</p>
			    			<p>${member.userEmail}</p>
			    		</li>
			    		<li>
			    			<p>권한</p>
			    			<p>${member.auth}</p>
			    		</li>
			    	</ul>
			    </div>
			
				<c:if test="${param.userType eq 'T'}">
					<div class="get_box">
						<h3>반 정보</h3>
				    	<ul>
					    	<li>
					    		<p>반이름</p>
					    		<p>${member.classname}</p>
                            </li>
				    	</ul>
				    </div>
				</c:if>

				<c:if test="${param.userType eq 'P'}">
					<div class="get_box">
						<h3>원아 정보</h3>
				    	<ul>
					    	<li>
					    		<p>관계</p>
				    			<p>${member.relation}</p>
					    	</li>
				    		<li>
				    			<p>아동명</p>
				    			<p>${member.cname}</p>
				    		</li>
				    		<li>
				    			<p>아동 고유번호</p>
				    			<p>${member.cunicode}</p>
				    		</li>
				    		<li>
				    			<p>반이름</p>
				    			<p>${member.classname}</p>
				    		</li>
				    		<li>
				    			<p>생년월일</p>
				    			<p><fmt:parseDate var="cbirth" value="${member.cbirth}" pattern="yyyy-MM-dd HH:mm:ss" />
				    			<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" /><p>
				    		</li>
				    	</ul>
				    </div>
				
					<div class="get_box">
						<h3>접수 정보</h3>
				    	<ul>
				    		<li>
				    			<p>접수유형</p>
				    			<p>${member.apptype}</p>
				    		</li>
				    	</ul>
					</div>
				</c:if>
				
			</div>
    	
	    	<div class="btn_box">
	    		<button type="button" class="btn_mod">수정</button>
	    		<button type="button" class="btn_del">삭제</button>
	    		<button type="button" class="btn_list">목록</button>
	    	</div>
    	
	    	<form id="operForm" action="/member/memModify" method="get">
	    		<input type="hidden" id="userId" name="userId" value="${member.userId}">
	    		<input type="hidden" id="userType" name="userType" value="${member.userType}">
	    	</form>
	    	
	    </div>
    </section>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	$(".btn_mod").click(function(){
		operForm.submit();
	});
	$(".btn_del").click(function(){
		operForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />");
		operForm.attr("action", "/member/memRemove").attr("method", "post");
		operForm.submit();
	});
	$(".btn_list").click(function(){
		operForm.find("#userId").remove();
		operForm.find("#userType").remove();
		operForm.attr("action", "/member/memList");
		operForm.submit();
	});
});
</script>

<%@ include file="../includes/admin_footer.jsp"%>