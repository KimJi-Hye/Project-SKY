<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>


<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>classList</h3>
</div>

	<!-- 게시판 목록  -->
	<div class="boardList">
		<table>
			<thead>
				<tr>
					<th class="th_bno">No</th>
					<th class="th_className">반이름</th>
					<th class="th_classAge">연령</th>
					<th class="th_classTotal">정원</th>
				</tr>
			</thead>

		<!-- 게시물이 출력될 영역 -->
		<tbody>
			<c:forEach items="${classList}" var="board">
				<tr>
					<td><c:out value="${board.bno}" /></td>
					<td><a
						href='/board/classGet?bno=<c:out value="${board.bno}"/>'> <c:out
								value="${board.className}" /></a></td>
					<td><c:out value="${board.classAge}" /></td>
					<td><c:out value="${board.classTotal}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

	<!-- 글쓰기 -->
	<div class="bo_register">
   	 <a href="#" class="pg_regi"><span class="material-icons">
      	  create
      	  </span>글쓰기</a>
	</div>


<script type="text/javascript">
	$(document).ready(function() {

		$('#regBtn').click(function() {

			$(location).attr('href', 'classRegister');

		});
	});
</script>

<%@include file="../includes/footer.jsp"%>