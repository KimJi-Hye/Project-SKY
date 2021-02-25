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

				<form role="form" action="/board/noticeRegister" method="post">
				
					<div class="form-group">
						<label>게시물 번호</label> <input class="form-control" name='bno'>
					</div>
					
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>
					
					<div class="form-group">
						<label>내용</label> <input class="form-control" name='content'>
					</div>
					
					<button type="submit" class="btn btn-default">작성</button>
				</form>

			</div>

		</div>

	</div>

</div>