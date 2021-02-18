<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"> <h1>ClassNote List Page</h1>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">알림장 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>반이름</th>
							<th>원아이름</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					
					<c:forEach items="${noteList}" var="boardNote">
						<tr>
							<td><c:out value="${boardNote.bno}" /></td>
							<td><c:out value="${boardNote.classname}" /></td>
							<td><c:out value="${boardNote.cname}" /></td>
							<td><a href='/board/noteGet?bno=<c:out value="${boardNote.bno}" />'>
							<c:out value="${boardNote.title}"/></a></td>
							<td><c:out value="${boardNote.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardNote.regdate}" /></td>
						</tr>
					</c:forEach>				



				</table>

			</div>

		</div>

	</div>

</div>



<script type="text/javascript">
   	$(document).ready(function(){
   		
   		$("#regBtn").on("click", function(){
   			
   			self.location ="/board/noteRegister";
   			
   		})
   		
   	});

</script>

<%@include file="../includes/footer.jsp"%>