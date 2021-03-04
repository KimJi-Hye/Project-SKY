<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_register">
    	<div class="admin_title">
    		<h2>원아 관리</h2>
	    </div>
    	<div class="admin_contents">
				
			<form id='operForm' action="/admin/childGet" method="post">	

				<div class="reg_box_con">
				
					<div class="reg_box">
				    	<ul>
				    		<li>
								<p>고유번호</p>
				    			<input type="text" name='cunicode' value='<c:out value="${board.cunicode}"/>' readonly>
							</li>
				    		<li>
								<p>원아이름</p>
				    			<input type="text" name='cname' value='<c:out value="${board.cname}"/>' >
							</li>
				    		<li>
								<p>반이름</p>
				    			<input type="text" name='classname' value='<c:out value="${board.classname}"/>'>
							</li>
				    		<li>
								<p>원아성별</p>
				    			<input type="text" name='cgender' value='<c:out value="${board.cgender}"/>'>
							</li>
				    		<li>
								<p>아동 생년 월일</p>
				    			<fmt:parseDate var="cbirth" value="${board.cbirth}" pattern="yyyy-MM-dd" />
								<input name='cbirth' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />'>
							</li>
				    		<li>
								<p>입학일</p>
				    			<fmt:parseDate var="enter" value="${board.enter}" pattern="yyyy-MM-dd" />
								<input name='enter' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${enter}" />'>
							</li>
				    		<li>
								<p>졸업일</p>
				    			<fmt:parseDate var="graduation" value="${board.graduation}" pattern="yyyy-MM-dd" />
								<input name='graduation' type='date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${graduation}" />'>
							</li>
				    	</ul>
			    	</div>
					
	    		</div>
    	
		    	<div class="btn_box">
					<button data-oper='childModify' class="btn btn-default btn_mod">수정</button>
					<button data-oper='childList' class="btn btn-info btn_reset">목록</button>
					<button data-oper='childRemove' class="btn btn-default btn_del">삭제</button>
				</div>
				
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			    <input type='hidden' value='<c:out value="${cri.amount}"/>'>

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
	      formObj.attr("action", "/admin/applyRemove");
	      
	    } else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/admin/applyList").attr("method","get");
	      formObj.empty();
	      
		} else if(operation === 'applyModify'){
		  formObj.attr("action", "/admin/applyModify").attr("method","post");
		  formObj.empty();
		
		}
	    
	    formObj.submit();
	  });

});
</script> -->
<script>
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='childModify']").on("click", function(e) {
		
		operForm.attr("action", "/admin/childModify").submit();
	});
	
	$("button[data-oper='childList']").on("click", function(e) {
		
		operForm.find("#cunicode").remove();
		operForm.attr("action", "/admin/childList").attr("method","get")
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
	
	$("button[data-oper='childRemove']").on("click", function(e){
		
		operForm.attr("action", "/admin/childRemove").submit();
		
	});
});
</script>

<%@ include file="../includes/admin_footer.jsp"%>