<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Apply Register Page</div>

			<div class="panel-body">

				<form role="form" action="/board/applyRegister" method="post">

					<div class="form-group">
						<label>학부모이름</label> <input class="form-control" name='pname'>
					</div>

					<div class="form-group">
						<label>관계</label> <input class="form-control" name='relation'>
					</div>

					<div class="form-group">
						<label>학부모생년월일</label> <input class="form-control" name='pbirth' type='date'>
					</div>

					<div class="form-group">
						<label>주소</label> <input class="form-control" name='addr'>
					</div>

					<div class="form-group">
						<label>연락처</label> <input class="form-control" name='phone'>
					</div>
					
					<div class="form-group">
						<label>e-mail</label> <input class="form-control" name='useremail'>
					</div>

					<div class="form-group">
						<label>아동이름</label> <input class="form-control" name='cname'>
					</div>

					<div class="form-group">
						<label>아동성별</label> <input class="form-control" name='cgender'>
					</div>

					<div class="form-group">
						<label>아동생년월일</label> <input class="form-control" name='cbirth' type='date'>
					</div>

					<div class="form-group">
						<label>접수유형</label> <input class="form-control" name='apptype'>
					</div>
					
					<div class="form-group">
						<label>비밀번호</label> <input class="form-control" name='pw'>
					</div>

					<button type="submit" class="btn btn-default">접수 신청</button>
				</form>

			</div>

		</div>

	</div>

</div>
<%@include file="../includes/footer.jsp"%>