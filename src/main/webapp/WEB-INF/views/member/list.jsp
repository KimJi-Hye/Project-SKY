<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원관리</h2>
    	<table>
    		<thead>
    			<tr>
    				<th>아이디</th>
    				<th>권한</th>
    				<th>이름</th>
    				<th>연락처</th>
    				<th>주소</th>
    				<th>이메일</th>
    				<th>회원타입</th>
    				<th>담당반</th>
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${Tlist}" var="board">
	    			<tr>
	    				<td><c:out value="${board.userId}" /></td>
	    				<td><c:out value="${board.atGrade}" /></td>
	    				<td><c:out value="${board.userName}" /></td>
	    				<td><c:out value="${board.userPhone}" /></td>
	    				<td><c:out value="${board.userAddr}" /></td>
	    				<td><c:out value="${board.userEmail}" /></td>
	    				<td><c:out value="${board.userType}" /></td>
	    				<td><c:out value="${board.className}" /></td>
	    			</tr>
    			</c:forEach>
    			<c:forEach items="${Plist}" var="board">
    				<tr>
	    				<td><c:out value="${board.userId}" /></td>
	    				<td><c:out value="${board.atGrade}" /></td>
	    				<td><c:out value="${board.userName}" /></td>
	    				<td><c:out value="${board.userPhone}" /></td>
	    				<td><c:out value="${board.userAddr}" /></td>
	    				<td><c:out value="${board.userEmail}" /></td>
	    				<td><c:out value="${board.userType}" /></td>
	    				<td><c:out value="${board.cunicode}" /></td>
	    				<td><c:out value="${board.classname}" /></td>
	    				<td><c:out value="${board.cname}" /></td>
	    				<td><c:out value="${board.cbirth}" /></td>
	    			</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>

<%@ include file="../includes/footer.jsp"%>