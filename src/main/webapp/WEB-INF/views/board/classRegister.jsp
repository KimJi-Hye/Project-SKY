<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Class Register Page</h1>
</body>
</html>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Register Page</div>
			
			<div class="panel-body">
			
			<form role="form" action="/board/classRegister" method="post">
				<div class="form-group">
				 <label>반 이름</label> 
				 <input class="form-control" name='className'>
				</div>
				
				<div class="form-group">
				<label>연령</label>
				<input class="form-control" name='classAge'>
				</div>
				
				
				<div class="form-group">
				<label>정원</label> 
				<input class="form-control" name='classTotal'>
				</div>
				
				<button type="submit" class="btn btn-default">등록</button>
<!-- 				<button type="reset" class="btn btn-default">Reset Button</button> -->
			</form>
			
			
			
			</div>

		</div>

	</div>

</div>


