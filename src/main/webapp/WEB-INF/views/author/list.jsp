<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_list">
    	<div class="admin_title">
	    	<h2>권한 관리</h2>
    	</div>
    	<div class="admin_contents">
        	<div class="admin_btnBox">
	    		<button type="button" class="btn_reg on">권한 등록</button>
	    	</div>
	    	<table>
	    		<thead>
		    		<tr>
		    			<th>권한등급</th>
		    			<th>권한명</th>
		    			<th>반이름</th>
		    		</tr>
		    	</thead>
		    	<tbody>
	    			<c:forEach items="${list}" var="board">
	    			<tr>
	    				<td><a href="<c:out value="${board.auth}" />" class="move"><c:out value="${board.auth}" /></a></td>
	    				<td><a href="<c:out value="${board.auth}" />" class="move"><c:out value="${board.atname}" /></a></td>
	    				<td><a href="<c:out value="${board.auth}" />" class="move"><c:out value="${board.classname}" /></a></td>
	    			</tr>
		    		</c:forEach>
		    	</tbody>
	    	</table>
	    	<form id="actionForm" action="/author/list" method="get">
	    		
	    	</form>
	    </div>
    </section>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_reg").click(function(){
			self.location = "/author/register";
		});
		var actionForm = $("#actionForm");
		$(".move").click(function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='auth' value='" + $(this).attr("href") + "'>")
			actionForm.attr("action", "/author/modify");
			actionForm.submit();
		});
	});
</script>

<%@ include file="../includes/admin_footer.jsp"%>