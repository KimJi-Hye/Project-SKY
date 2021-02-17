<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Apply Register Page</div>

			<div class="panel-body">

				<form role="form" action="/board/childRegister" method="post">
				
					<div class="form-group">
						<label>고유번호</label> <input class="form-control" name='cunicode'>
					</div>

	   				담당 반
   				 	<select name="classname">
   						<option value="" selected>선택</option>
   						<c:forEach items="${mngList}" var="boardMng">
       						<option value="${boardMng.className}">${boardMng.className}</option>
       					</c:forEach>
					</select>

					<div class="form-group">
						<label>이름</label> <input class="form-control" name='cname'>
					</div>

					<div class="form-group">
						<label>원아생년월일</label> <input class="form-control" name='cbirth'>
					</div>
					
					<button type="submit" class="btn btn-default">접수 신청</button>
				</form>

			</div>

		</div>

	</div>

</div>