<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>
	    	<c:if test="${param.userType eq 'T'}">교직원 회원정보 수정</c:if>
	    	<c:if test="${param.userType eq 'P'}">학부모 회원정보 수정</c:if>
    	</h2>
    	
    	<form id="operForm" action="/member/memModify" method="post">
    		<input type="hidden" name="userPw" value="${member.userPw}">
    		<input type="hidden" name="userType" value="${member.userType}">
    	
	    	<ul>
	    		<li>아이디 : <input type="text" name="userId" value="${member.userId}" readonly></li>
	    		<li>이름 : <input type="text" name="userName" value="${member.userName}"></li>
	    		<li>생년월일 : 
               	<fmt:parseDate var="userBirth" value="${member.userBirth}" pattern="yyyy-MM-dd" />
               	<input type="date" name="userBirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${userBirth}" />'>
	    		</li>
	    		<li>연락처 : <input type="text" name="userPhone" value="${member.userPhone}"></li>
	    		<li>주소 : <input type="text" name="userAddr" value="${member.userAddr}"></li>
	    		<li>이메일 : <input type="text" name="userEmail" value="${member.userEmail}"></li>
	    		<li>권한 : <input type="text" name="atGrade" value="${member.atGrade}"></li>
	    		
	    		
    		
		    	<c:if test="${param.userType eq 'T'}">
		    	<li>반이름 : 
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
		    	</c:if>
	    		
		    	<c:if test="${param.userType eq 'P'}">
	    		<li>관계 : <input type="text" name="relation" value="${member.relation}"></li>
	    		<li>아동명 : <input type="text" name="cunicode" value="${member.cunicode}" readonly></li>
	    		<li>아동 고유번호 : ${member.atGrade}</li>
	    		<li>반이름 : <input type="text" name="classname" value="${member.classname}" readonly></li>
	    		<li>생년월일 : ${member.atGrade}</li>
	    		
	    		<li>접수유형 : <input type="text" name="apptype" value="${member.apptype}" readonly></li>
		    	</c:if>
	    	</ul>
	    	
	    	<div class="btn_box">
	    		<button type="button" class="btn_save">저장</button>
	    		<button type="button" class="btn_list">목록</button>
	    	</div>
    	
    	</form>
    </div>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	$(".btn_save").click(function(){
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

<%@ include file="../includes/footer.jsp"%>