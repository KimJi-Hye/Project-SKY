<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1>ClassNote Register Page</h1>
			</div>

			<div class="panel-body">

				<form role="form" action="/board/noteRegister" method="post">

					<div class="form-group">
						<label>반 이름</label> <select name="classname">
							<option value="" selected>선택</option>
							<c:forEach items="${mngList}" var="boardMng">
								<option value="${boardMng.className}">${boardMng.className}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>원아 이름</label> 
						<select name="cunicode">
							<option value="" selected>선택</option>

						</select>
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>

					<div class="form-group">
						<label>내용</label> <input class="form-control" name='content'>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'>
					</div>


					<button type="submit" class="btn btn-default">등록</button>
					<a href="/board/noteList">목록</a>

				</form>

			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function (e){
		
		
		$("select[name='classname']").change(function(){
			var name = $("select[name='cunicode']");
			var str ="";
			
			str +="<option value='' selected>선택</option>";
			str +="<c:forEach items='${cnameList}' var='boardChild'>";
			if($(this).val() == "${boardChild.classname}"){
			str +="<option value='${boardChild.cunicode}'>${boardChild.cname}(${boardChild.cunicode})</option>";
			}
			
			str +="</c:forEach>";
			
			name.html(str);
		});
		
		$(".btn_list").click(function() {
			
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>