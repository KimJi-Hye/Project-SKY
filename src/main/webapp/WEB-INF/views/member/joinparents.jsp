<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원가입</h2>
    	<form role="form" action="/member/joinparents" method="post">
	    	<div>
		    	<div>
		    		<h3>학부모 정보 입력</h3>
			   		<ul>
			   			<li>아이디<input type="text" name="userId" id="userId" required></li>
			   			<li>비밀번호<input type=password name="userPw" id="userPw" required></li>
			   			<li>비밀번호 확인<input type="password" name="pwCheck" id="pwCheck" required><span id="pwLog"></span></li>
			   			<li>이름<input type="text" name="userName" id="userName" value="${apply.pname}" required></li>
               			<li>생년월일
               				<fmt:parseDate var="pbirth" value="${apply.pbirth}" pattern="yyyy-MM-dd" />
               				<input type="date" name="userBirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />'>
               			</li>
			   			<li>연락처<input type="text" name="userPhone" id="userPhone" value="${apply.phone}" required></li>
			   			<li>주소<input type="text" name="userAddr" id="userAddr" value="${apply.addr}" required></li>
			   			<li>이메일<input type="text" name="userEmail" id="userEmail" value="${apply.useremail}" required></li>
			   		</ul>
			   		<h3>원아 접수 정보</h3>
			   		<ul>
			   			<li>접수일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${apply.adddate}" /></li>
			   			<li>접수 유형 : <input type="text" name="apptype" value="${apply.apptype }" readonly required></li>
			   		</ul>
			   		<h3>원아 정보 확인</h3>
			   		<ul>
			   			<li>관계 : <input type="text" name="relation" value="${apply.relation}" required></li>
			   			<li>원아 고유번호 : <input type="text" name="cunicode" id="cunicode" value="${apply.cunicode}" readonly></li>
			   			<li>원아명 : <c:out value="${apply.cname}" /></li>
			   			<li>성별 : <c:out value="${apply.cgender}" /></li>
			   			<li>생년월일 : <c:out value="${apply.cbirth}" /></li>
			   			<li>반이름 : <c:out value="${apply.cclass}" /></li>
			   			<li>원아 정보 상이 시 회원가입 후 원으로 연락 바랍니다^^</li>
			   		</ul>
			   		<input type="hidden" name="atGrade" value="z">
			   		<input type="hidden" name="userType" value="P">
		    	</div>
	    	</div>
	    	<div>
	    		<a href="/member/join">뒤로가기</a>
	    		<input type="reset" value="초기화">
	    		<input type="submit" value="회원가입">
	    	</div>
	    	
    	</form>
    	
    </div>
    
    <div id="popup">
    	<p class="popup_m"></p>
    	<button type="button" class="popup_close">확인</button>
    </div>

<script src="/resources/js/join.js"></script>
<script>
   	$(document).ready(function(){
   		
   		// no type
   		var result = '<c:out value="${result}" />';
   		if(result == ''){
   			//location.href="/member/joinType";
   		}
   		
   		// popup
   		popupOff();
   		$(".popup_close").click(function(){
   			popup_m.text("");
   			popupOff();
   		});
   		
   	});
</script>

<%@ include file="../includes/footer.jsp"%>