<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>
	    	<c:if test="${param.userType eq 'T'}">교직원 회원정보</c:if>
	    	<c:if test="${param.userType eq 'P'}">학부모 회원정보</c:if>
    	</h2>
    	<ul>
    		<li>아이디 : ${member.userId}</li>
    		<li>이름 : ${member.userName}</li>
    		<li>생년월일 : 
    		<fmt:parseDate var="userBirth" value="${member.userBirth}" pattern="yyyy-MM-dd HH:mm:ss" />
    		<fmt:formatDate pattern="yyyy-MM-dd" value="${userBirth}" />
    		</li>
    		<li>연락처 : ${member.userPhone}</li>
    		<li>주소 : ${member.userAddr}</li>
    		<li>이메일 : ${member.userEmail}</li>
    		<li>권한 : ${member.atGrade}</li>
    		
	    	<c:if test="${param.userType eq 'T'}">
	    	<li>반이름 : ${member.classname}</li>
	    	</c:if>
    		
	    	<c:if test="${param.userType eq 'P'}">
	    	<li>관계 : ${member.relation}</li>
    		<li>아동명 : ${member.cname}</li>
    		<li>아동 고유번호 : ${member.cunicode}</li>
    		<li>반이름 : ${member.classname}</li>
    		<li>생년월일 : ${member.atGrade}</li>
    		
    		<li>접수유형 : ${member.userType}</li>
	    	</c:if>
    	</ul>
    	
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

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	$(".btn_mod").click(function(){
		operForm.submit();
	});
	$(".btn_del").click(function(){
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

<%@ include file="../includes/footer.jsp"%>