<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/resources/img/favicon.ico" type="image/favicon.ico">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <title>SKY Kindergarten</title>
    <style type="text/css">
    	#error{
    		width: 100%; height: 100vh;
    		background: #eee;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    	.errorBox{
    		width: 80%; max-width: 600px; padding: 40px 40px 60px;
    		border-radius: 20px;
    		background: #fff;
    		border: 1px solid #dbdbdb;
    	}
    	img{
    		width: 100%;
    		display: block;
    	}
    	h2{
			color: #0A69CC;
    		font-size: 42px;
    		text-align: center;
    	}
    	p{
    		margin: 40px 0;
    		font-size: 21px;
    		text-align: center;
    	}
    	.btn_reg{
    		width: 50%; padding: 10px; margin: 0 auto;
	    	font-size: 21px;
    		text-align: center;
    		display: block;
    	}
    </style>
</head>
<body>
	
	<div id="error">
		<div class="errorBox">
			<img alt="403 ERROR" src="/resources/img/error.jpg">
			<h2>403 ERRORE</h2>
			<p>접근 권한이 없습니다.</p>
			<div class="er_btnBox">
				<a href="/" class="btn_reg">메인페이지</a>
			</div>
		</div>
	</div>
	
</body>
</html>