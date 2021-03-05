<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	.form-group ul li{
		justify-content: center;
	}
	.form-group ul li label + *{
		width: 300px;
	}
	.get_box_con .get_box{
		padding: 30px; margin-bottom: 30px;
		border-bottom: 1px dashed #dbdbdb;
	}
	.get_box_con h3{
		padding: 15px 20px; margin-bottom: 30px;
		background: #eee;
		border: 1px solid #dbdbdb;
		border-radius: 10px;
	}
</style>


<div id="wrapper">
	<div class="boardTitle">
		<h3>마이페이지</h3>
	</div>
	<div class="form-group">
    	
		<form id='operForm' action="/member/myPage" method="post">	

			<div class="get_box_con">
			
			
				<c:if test="${memberT.userType eq 'T'}">
					<div class="get_box">
						<h3>회원 정보</h3>
				    	<ul>
				    		<li>
				    			<label>아이디</label>
				    			<input type="text" name='userId' value='<c:out value="${memberT.userId}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>이름</label>
				    			<input type="text" name='userName' value='<c:out value="${memberT.userName}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>생년월일</label>
				    			<fmt:parseDate var="pbirth" value="${memberT.userBirth}" pattern="yyyy-MM-dd" />
								<input name='userBirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />' required>
				    		</li>
				    		<li>
				    			<label>연락처</label>
				    			<input type="text" name='userPhone' value='<c:out value="${memberT.userPhone}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>주소</label>
				    			<input type="text" name='userAddr' value='<c:out value="${memberT.userAddr}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>이메일</label>
				    			<input type="text" name='userEmail' value='<c:out value="${memberT.userEmail}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>권한</label>
				    			<input type="text" name='auth' value='<c:out value="${memberT.auth}"/>' readonly>
				    		</li>
				    	</ul>
				    </div>
					<div class="get_box">
						<h3>반 정보</h3>
				    	<ul>
					    	<li>
					    		<label>반이름</label>
			    				<input type="text" name='classname' value='<c:out value="${memberT.classname}"/>' readonly>
                            </li>
				    	</ul>
				    </div>
				</c:if>

				<c:if test="${memberP.userType eq 'P'}">
					<div class="get_box">
						<h3>회원 정보</h3>
				    	<ul>
				    		<li>
				    			<label>아이디</label>
				    			<input type="text" name='userId' value='<c:out value="${memberP.userId}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>이름</label>
				    			<input type="text" name='userName' value='<c:out value="${memberP.userName}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>생년월일</label>
				    			<fmt:parseDate var="pbirth" value="${memberP.userBirth}" pattern="yyyy-MM-dd" />
								<input name='userBirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />' required>
				    		</li>
				    		<li>
				    			<label>연락처</label>
				    			<input type="text" name='userPhone' value='<c:out value="${memberP.userPhone}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>주소</label>
				    			<input type="text" name='userAddr' value='<c:out value="${memberP.userAddr}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>이메일</label>
				    			<input type="text" name='userEmail' value='<c:out value="${memberP.userEmail}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>권한</label>
				    			<input type="text" name='auth' value='<c:out value="${memberP.auth}"/>' readonly>
				    		</li>
				    	</ul>
				    </div>
				    
					<div class="get_box">
						<h3>원아 정보</h3>
				    	<ul>
					    	<li>
					    		<label>관계</label>
			    				<input type="text" name='relation' value='<c:out value="${memberP.relation}"/>' readonly>
					    	</li>
				    		<li>
				    			<label>아동명</label>
			    				<input type="text" name='cname' value='<c:out value="${memberP.cname}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>아동 고유번호</label>
			    				<input type="text" name='cunicode' value='<c:out value="${memberP.cunicode}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>반이름</label>
			    				<input type="text" name='classname' value='<c:out value="${memberP.classname}"/>' readonly>
				    		</li>
				    		<li>
				    			<label>생년월일</label>
			    				<fmt:parseDate var="cbirth" value="${memberP.cbirth}" pattern="yyyy-MM-dd" />
								<input name='cbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />' required>
				    		</li>
				    	</ul>
				    </div>
				
					<div class="get_box">
						<h3>접수 정보</h3>
				    	<ul>
				    		<li>
				    			<label>접수유형</label>
			    				<input type="text" name='apptype' value='<c:out value="${memberP.apptype}"/>' readonly>
				    		</li>
				    	</ul>
					</div>
				</c:if>
				
			</div>
    	
	    	<div class="form-button">
	    		<button type="button" class="btn_mod">수정</button>
	    		<!-- <button type="button" class="btn_del">삭제</button>
	    		<button type="button" class="btn_list">목록</button> -->
	    	</div>
	    		
	    		<input type="hidden" id="userId" name="userId" value="${member.userId}">
	    		<input type="hidden" id="userType" name="userType" value="${member.userType}">
	    	</form>

	</div>
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