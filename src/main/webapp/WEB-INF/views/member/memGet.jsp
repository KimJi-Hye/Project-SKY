<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원정보</h2>
    	<c:if test="${param.userType eq 'T'}">
    	교직원
    	</c:if>
    	<c:if test="${param.userType eq 'P'}">
    	학부모
    	</c:if>
    	<ul>
    		<li>아이디 ${member.userId}</li>
    		<li>이름 ${member.userName}</li>
    		<li>연락처 ${member.userPhone}</li>
    		<li>주소  ${member.userAddr}</li>
    		<li>이메일  ${member.userEmail}</li>
    		<li>반이름  ${member.classname}</li>
    		<li>권한  ${member.atGrade}</li>
    		<li>타입 <span class="userType">${member.userType}</span></li>
    	</ul>
    </div>

<script type="text/javascript">
$(document).ready(function(){
	
});
</script>

<%@ include file="../includes/footer.jsp"%>