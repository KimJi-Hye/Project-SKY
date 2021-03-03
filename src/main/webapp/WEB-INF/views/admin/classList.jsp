<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_list">
    	<div class="admin_title">
	    	<h2>반 관리</h2>
    	</div>
    	<div class="admin_contents">
        	<div class="admin_btnBox">
				<button id='regBtn' type="button" class="on">등록</button>
	    	</div>
	    	<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>반이름</th>
						<th>연령</th>
						<th>정원</th>
					</tr>
				</thead>
					
				<tbody>
				<c:forEach items="${classList}" var="board">
					<tr>
						<td><a href='/admin/classGet?bno=<c:out value="${board.bno}"/>'><c:out value="${board.bno}" /></a></td>
						<td><a href='/admin/classGet?bno=<c:out value="${board.bno}"/>'> <c:out value="${board.className}" /></a></td>
						<td><a href='/admin/classGet?bno=<c:out value="${board.bno}"/>'><c:out value="${board.classAge}" /></a></td>
						<td><a href='/admin/classGet?bno=<c:out value="${board.bno}"/>'><c:out value="${board.classTotal}" /></a></td>
					</tr>
				</c:forEach>
				</tbody>

			</table>
	    </div>
    </section>

	<script type="text/javascript">
		$(document).ready(function() {
		
			$('#regBtn').click(function() {
		
				$(location).attr('href','classRegister');
		
			});
		});
	</script>

<%@ include file="../includes/admin_footer.jsp"%>