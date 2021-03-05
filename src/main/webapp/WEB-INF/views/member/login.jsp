<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/mem_header.jsp"%>


<div class="memberBox login">

	<div class="cardBox login_contents">

		<div class="lb_left">
		</div>

		<div class="lb_right">
			<div class="lb_title">
				<h2>LOGIN</h2>
				<a href="../" class="lb_home"><img src="/resources/img/sky_logo2.png" alt=""></a>
			</div>
			<div class="lb_con">
				<form action="/login" method="post">
					<!-- <div class="radioBox">
						<input type="radio" name="usertype" id="ut1" class="radioBtn" checked> 
						<label for="ut1"><span></span> 학부모</label> 
						<input type="radio" name="usertype" id="ut2" class="radioBtn"> 
						<label for="ut2"><span></span> 교직원</label>
					</div> -->
					<input type="text" name="userId" placeholder="ID" required>
					<input type="password" name="userPw" placeholder="PASSWORD" required> 
					<input type="submit" value="LOGIN">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				</form>
			</div>
			<div class="lb_bottom">
				<p>
					회원이 아니신가요? <a href="join">Sign Up</a>
				</p>
			</div>

		</div>

	</div>

</div>

<%@ include file="../includes/mem_footer.jsp"%>