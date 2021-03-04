<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<h3>온라인 접수 조회</h3>
	</div>
	<div class="form-group">
    	
			<form id='operForm' action="/apply/applyGet" method="post">	
				    	<ul>
				    		<li>
								<label>접수번호</label>
				    			<input type="text" name='ano' value='<c:out value="${board.ano}"/>' readonly>
							</li>
				    		<li>
								<label>학부모이름</label>
				    			<input type="text" name='pname' value='<c:out value="${board.pname}"/>' readonly>
							</li>
				    		<li>
								<label>관계</label>
				    			<input type="text" name='relation' value='<c:out value="${board.relation}"/>' required>
							</li>
				    		<li>
								<label>학부모 생년월일</label>
								<fmt:parseDate var="pbirth" value="${board.pbirth}" pattern="yyyy-MM-dd" />
								<input name='pbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />' required>
							</li>
				    		<li>
								<label>주소</label>
				    			<input type="text" name='addr' value='<c:out value="${board.addr}"/>' required>
							</li>
				    		<li>
								<label>연락처</label>
				    			<input type="text" name='phone' value='<c:out value="${board.phone}"/>' required>
							</li>
				    		<li>
								<label>e-mail</label>
				    			<input type="text" name='useremail' value='<c:out value="${board.useremail}"/>' required>
							</li>
				    		<li>
								<label>아동이름</label>
				    			<input type="text" name='cname' value='<c:out value="${board.cname}"/>' required>
							</li>
				    		<li>
								<label>아동성별</label>
				    			<input type="text" name='cgender' value='<c:out value="${board.cgender}"/>' required>
							</li>
				    		<li>
								<label>아동 생년월일</label>
								<fmt:parseDate var="cbirth" value="${board.cbirth}" pattern="yyyy-MM-dd" />
								<input name='cbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />' required>
							</li>
				    		<li>
								<label>접수유형</label>
				    			<input type="text" name='apptype' value='<c:out value="${board.apptype}"/>' required>
							</li>
				    		<li>
								<label>접수상태</label>
				    			<input type="text" name='appstate' value='<c:out value="${board.appstate}"/>' required>
							</li>
				    		<li>
								<label>아동고유번호</label>
				    			<input type="text" name='cunicode' value='<c:out value="${board.cunicode}"/>' readonly>
							</li>
				    		<li>
								<label>소속반</label>
				    			<input type="text" name='cclass' value='<c:out value="${board.cclass}"/>' readonly>
							</li>
				    	</ul>
		    	
		    	<div class="form-button">
					<button data-oper='applyModify' class="btn btn-default btn_mod">수정</button>
					<button data-oper='applyList' class="btn btn-info btn_list">돌아가기</button>
					<button data-oper='applyRemove' class="btn btn-default btn_del">접수취소</button>
				</div>
				
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
				    
			</form>

	</div>
</div>

<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='applyModify']").on("click", function(e) {
		
		operForm.attr("action", "/apply/applyModifyMember").submit();
	});
	
	$("button[data-oper='applyList']").on("click", function(e) {
		
		location.href="/apply/applyCheck";
		
	});
	
	$("button[data-oper='applyRemove']").on("click", function(e){
		
		/* if (input[name='ano'].val() == "") {
			
			alert("최종 승인후는 접수취소가 불가능합니다.");
			return;
		} */
		
		operForm.attr("action", "/apply/applyRemoveMember").submit();
		
	});
	
	$("button[data-oper='applyPass']").on("click", function(e){
		operForm.attr("action", "/apply/applyPassMember").submit();
	});
});
</script>

<%@ include file="../includes/footer.jsp"%>