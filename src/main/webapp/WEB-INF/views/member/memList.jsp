<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp"%>

    <div>
    	<h2>회원관리</h2>
    	<div>
    		<button type="button" class="go_t">교직원</button>
    		<button type="button" class="go_p">학부모</button>
    	</div>
    	<table>
    		<thead>
    			<tr>
    				<th>아이디</th>
    				<th>권한</th>
    				<th>이름</th>
    				<th>연락처</th>
    				<th class="p_box">고유번호</th>
    				<th class="p_box">원아명</th>
    				<th>반이름</th>
    				<th>회원타입</th>
    			</tr>
    		</thead>
    		
    		<tbody class="t_box">
    			<c:forEach items="${Tlist}" var="board">
	    			<tr>
	    				<td><c:out value="${board.userId}" /></td>
	    				<td><c:out value="${board.atGrade}" /></td>
	    				<td><a href="${board.userId}" class="go_id"><c:out value="${board.userName}" /></a></td>
	    				<td><c:out value="${board.userPhone}" /></td>
	    				<td><c:out value="${board.classname}" /></td>
	    				<td class="uType"><c:out value="${board.userType}" /></td>
	    			</tr>
    			</c:forEach>
    		</tbody>
    			
    		<tbody class="p_box">
    			<c:forEach items="${Plist}" var="board">
    				<tr>
	    				<td><c:out value="${board.userId}" /></td>
	    				<td><c:out value="${board.atGrade}" /></td>
	    				<td><a href="${board.userId}" class="go_id"><c:out value="${board.userName}" /></a></td>
	    				<td><c:out value="${board.userPhone}" /></td>
	    				<td><c:out value="${board.cunicode}" /></td>
	    				<td><c:out value="${board.cname}" /></td>
	    				<td><c:out value="${board.classname}" /></td>
	    				<td class="uType"><c:out value="${board.userType}" /></td>
	    			</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
    
    <form id="memList" action="/member/memList" method="get">
    	
    </form>

<script type="text/javascript">
$(document).ready(function(){
	
	var tBox = $(".t_box");
	var pBox = $(".p_box");
	pBox.hide();
	
	// 교직원 버튼 클릭
	$(".go_t").click(function(){
		pBox.hide();
		tBox.show();
	});
	
	// 학부모 버튼 클릭
	$(".go_p").click(function(){
		tBox.hide();
		pBox.show();
	});
	
    // 아이디 조회 
    var aform = $("#memList");
	$(".go_id").click(function(e){
		e.preventDefault();
        aform.append("<input type='hidden' name='userId' value='" + $(this).attr("href") + "'>");
        aform.append("<input type='hidden' name='userType' value='" + $(this).parent().siblings('.uType').text() + "'>");
        aform.attr("action", "/member/memGet");
        aform.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>