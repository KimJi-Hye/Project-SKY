<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>권한 관리 등록</h2>
    	<form action="/author/register" method="post">
    		<ul>
    			<li>권한등급 <input type="text" name="atgrade"></li>
    			<li>권한명 <input type="text" name="atname"></li>
    			<li>반이름 
	    			<select name="classname">
	    				<option value="">선택</option>
	    				<c:forEach items="${mngList}" var="list">
	    				<option value="${list.className}">${list.className}</option>
	    				</c:forEach>
	    			</select>
    			</li>
    		</ul>
    		<button type="submit" class="btn_reg">등록</button>
    		<button type="button" class="btn_list">리스트</button>
    	</form>
    </div>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_list").click(function(){
			self.location = "/author/list";
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>