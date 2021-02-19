<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>권한관리</h2>
    	<table>
    		<thead>
	    		<tr>
	    			<th>권한등급</th>
	    			<th>권한명</th>
	    		</tr>
	    	</thead>
	    	<tbody>
    			<c:forEach items="${list}" var="board">
    			<tr>
    				<td><c:out value="${board.atgrade}" /></td>
    				<td><c:out value="${board.atname}" /></td>
    			</tr>
	    		</c:forEach>
	    	</tbody>
    	</table>
    </div>

<script type="text/javascript">
$(document).ready(function(){
		
});
</script>

<%@ include file="../includes/footer.jsp"%>