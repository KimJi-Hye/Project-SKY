<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>
<style>
	.radioBox{
		height: 36px;
		align-items: center;
	}
	.radioBox label{
		margin-right: 20px;
	}
</style>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
    		<h2>온라인 접수 관리</h2>
	    </div>
    	<div class="admin_contents">
    	
			<form id='operForm' action="/apply/applyGet" method="post">	
	    		<div class="reg_box_con">
                	<div class="reg_box">
                		<h3>원아 관리 정보</h3>
				    	<ul>
				    		<li>
								<p>접수번호</p>
				    			<input type="text" name='ano' value='<c:out value="${board.ano}"/>' readonly>
							</li>
				    		<li>
								<p>학부모이름</p>
				    			<input type="text" name='pname' value='<c:out value="${board.pname}"/>' readonly>
							</li>
				    		<li>
								<p>관계</p>
				    			<input type="text" name='relation' value='<c:out value="${board.relation}"/>'>
							</li>
				    		<li>
								<p>학부모 생년월일</p>
								<fmt:parseDate var="pbirth" value="${board.pbirth}" pattern="yyyy-MM-dd" />
								<input name='pbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />'>
							</li>
				    		<li>
								<p>주소</p>
				    			<input type="text" name='addr' value='<c:out value="${board.addr}"/>'>
							</li>
				    		<li>
								<p>연락처</p>
				    			<input type="text" name='phone' value='<c:out value="${board.phone}"/>'>
							</li>
				    		<li>
								<p>e-mail</p>
				    			<input type="text" name='useremail' id='useremail' value='<c:out value="${board.useremail}"/>'>
							</li>
				    		<li>
								<p>아동이름</p>
				    			<input type="text" name='cname' value='<c:out value="${board.cname}"/>'>
							</li>
				    		<li>
								<p>아동성별</p>
				    			<input type="text" name='cgender' value='<c:out value="${board.cgender}"/>'>
							</li>
				    		<li>
								<p>아동 생년월일</p>
								<fmt:parseDate var="cbirth" value="${board.cbirth}" pattern="yyyy-MM-dd" />
								<input name='cbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />'>
							</li>
				    		<li>
								<p>접수유형</p>
				    			<input type="text" name='apptype' value='<c:out value="${board.apptype}"/>' readonly>
								<!-- <div class="radioBox">
									<input type="radio" name="apptype" id="type1" value="우선모집">
									<label for="type1"><span></span> 우선모집(재원생 동생)</label>
									<input type="radio" name="apptype" id="type2" value="일반모집">
									<label for="type2"><span></span> 일반모집</label>
									<input type="radio" name="apptype" id="type3" value="방과후 과정">
									<label for="type3"><span></span> 방과후 과정</label>
								</div> -->
							</li>
				    		<li>
								<p>접수상태</p>
				    			<input type="text" name='appstate' value='<c:out value="${board.appstate}"/>'>
							</li>
				    		<li>
								<p>아동고유번호</p>
				    			<input type="text" name='cunicode' value='<c:out value="${board.cunicode}"/>' readonly>
							</li>
				    		<li>
								<p>소속반</p>
				    			<input type="text" name='cclass' value='<c:out value="${board.cclass}"/>' readonly>
							</li>
				    	</ul>
			    	</div>
			    </div>
		    	
		    	<div class="btn_box">
					<button data-oper='applyModify' class="btn btn-default btn_mod">수정</button>
					<button data-oper='applyList' class="btn btn-info btn_list">돌아가기</button>
					<button data-oper='applyRemove' class="btn btn-default btn_del">접수취소</button>
				</div>
				
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
				    
			</form>

			<form id='operForm2' action="/apply/applyPass" method="post">
				
				<input type='hidden' name='ano' value='<c:out value="${board.ano}"/>'>
				<input type='hidden' name='cname' value='<c:out value="${board.cname}"/>'>
				<fmt:parseDate var="cbirth" value="${board.cbirth}" pattern="yyyy-MM-dd" />
				<input type='hidden' name='cbirth' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />'>
				<input type='hidden' name='cgender' value='<c:out value="${board.cgender}"/>'>
	    		
	    		<div class="reg_box_con">
                	<div class="reg_box">
                		<h3>관리자 승인</h3>
				    	<ul>
				    		<li>
								<p>아동고유번호</p>
				    			<input type="text" id='cunicode' name='cunicode'>
							</li>
				    		<li>
				   				<p>담당 반</p>
			   				 	<select name="cclass">
			   						<option value="" selected>선택</option>
			   						<c:forEach items="${mngList}" var="boardMng">
			       						<option value="${boardMng.className}">${boardMng.className}</option>
			       					</c:forEach>
								</select>
							</li>
				    	</ul>
			    	</div>
			    </div>
		    	
		    	<div class="btn_box">
					<button data-oper='applyPass' id="mail_check_button" class="btn btn-default btn_reg">최종 승인</button>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
	
			</form>
	    	
	    </div>
    </section>
    
<!-- <script type="text/javascript">
$(document).ready(function() {
 	  var formObj = $("form");
	  $('button').on("click", function(e){
	    
		e.preventDefault();
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/apply/applyRemove");
	      
	    } else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/apply/applyList").attr("method","get");
	      formObj.empty();
	      
		} else if(operation === 'applyModify'){
		  formObj.attr("action", "/apply/applyModify").attr("method","post");
		  formObj.empty();
		
		}
	    
	    formObj.submit();
	  });
});
</script> -->

<!-- <script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'applyRemove') {
			
			formObj.attr("action", "/apply/applyRemove");
			
		} else if(operation === 'applyModify') {
			formObj.attr("action", "/apply/applyModify");
			
		} else if(operation === 'applyList') {
			
			formObj.attr("action", "/apply/applyList").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var pageamountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(pageamountTag);
			
		}
		
		formObj.submit();
	});
	
});
</script> -->

<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='applyModify']").on("click", function(e) {
		
		operForm.attr("action", "/apply/applyModify").submit();
	});
	
	$("button[data-oper='applyList']").on("click", function(e) {
		
		operForm.find("#ano").remove();
		operForm.attr("action", "/apply/applyList").attr("method","get")
		var pageNumTag = $("input[name='pageNum']").clone();
		var pageamountTag = $("input[name='amount']").clone();
		var keywordTag = $("input[name='keyword']").clone();
		var typeTag = $("input[name='type']").clone();
		
		operForm.empty();
		operForm.append(pageNumTag);
		operForm.append(pageamountTag);
		operForm.append(keywordTag);
		operForm.append(typeTag);
		
		operForm.submit();
		
	});
	
	$("button[data-oper='applyRemove']").on("click", function(e){
		
		operForm.attr("action", "/apply/applyRemove").submit();
		
	});
	
	$("button[data-oper='applyPass']").on("click", function(e){
		operForm.attr("action", "/apply/applyPass").submit();
	});
	
	/* 인증번호 이메일 전송 */
	$("#mail_check_button").click(function(e) {
		var email = $("#useremail").val(); //입력한 이메일
		var cunicode = $("#cunicode").val(); // 인증번호 입력란

		$.ajax({

			type : "GET",
			url : "sendMail?email=" + email + "&cunicode=" + cunicode,
			success : function(data) {

				console.log("data : " + data);

			}

		});
	});
	
});
</script>

<%@ include file="../includes/admin_footer.jsp"%>