<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>권한 관리 수정</h2>
    	<form id="operForm" action="/author/modify" method="post">
    		<ul>
    			<li>권한등급 <input type="text" name="atgrade" value='<c:out value="${author.atgrade}" />' ></li>
    			<li>권한명 <input type="text" name="atname" value='<c:out value="${author.atname}" />' ></li>
    			<li>반이름
    				<select name="classname">
		   				<option value="<c:out value="${author.classname}" />" selected><c:out value="${author.classname}" /></option>
		   				<c:forEach items="${mngList}" var="boardMng">
		       				<option value="${boardMng.className}">${boardMng.className}</option>
		       			</c:forEach>
					</select>
				</li>
    		</ul>
    		<button type="submit" class="btn_mod">수정</button>
    		<button type="button" class="btn_del">삭제</button>
    		<button type="button" class="btn_list">리스트</button>
    	</form>
    </div>

	<script type="text/javascript">
		$(document).ready(function(){
			var operForm = $("#operForm");
			$(".btn_list").click(function(){
				self.location = "/author/list";
			});
			$(".btn_del").click(function(){
				operForm.attr("action", "/author/remove");
				operForm.submit();
			});
		});
	</script>

<%@ include file="../includes/footer.jsp"%>