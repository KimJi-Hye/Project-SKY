<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/admin_header.jsp"%>

    <section id="adminPage" class="admin_list">
    	<div class="admin_title">
	    	<h2>원아 관리</h2>
    	</div>
    	<div class="admin_contents">
        	<div class="admin_btnBox">
				<button id='regBtn' type="button" class="btn btn-xs pull-right on">원아 등록</button>
			</div>
	    	<table>
				<thead>
					<tr>
						<th>고유번호</th>
						<th>원아이름</th>
						<th>성별</th>
						<th>반이름</th>
						<th>생년월일</th>
						<th>학부모이름</th>
						<th>입학일</th>
						<th>졸업일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${childList}" var="board">
						<tr>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><c:out value="${board.cunicode}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><c:out value="${board.cname}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><c:out value="${board.cgender}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><c:out value="${board.classname}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><fmt:parseDate var="cbirth" value="${board.cbirth}" pattern="yyyy-MM-dd" />
							<fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><c:out value="${board.username}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><fmt:parseDate var="enter" value="${board.enter}" pattern="yyyy-MM-dd" />
							<fmt:formatDate pattern="yyyy-MM-dd" value="${enter}" /></a></td>
							<td><a class='move' href='<c:out value="${board.cunicode}"/>'><fmt:parseDate var="graduation" value="${board.graduation}" pattern="yyyy-MM-dd" />
							<fmt:formatDate pattern="yyyy-MM-dd" value="${graduation}" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- <검색창> -->
			<div class='bo_search'>
				<form id='searchForm' action="/admin/childList" method='get'>
					<div class="bo_searchBox">
						<select name='type'>								
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?' selected':''}"/>>학부모 이름</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?' selected':''}"/>>원아이름</option>
							<option value="F" <c:out value="${pageMaker.cri.type eq 'F'?' selected':''}"/>>고유번호</option>
						</select>
					 
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'  placeholder="검색어를 입력해주세요">
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' >
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' >
						<button type="button" class='btn btn-default'><span class="material-icons" > search </span></button>
					</div>				   
				</form>
			</div>
				
			<!-- Pagination -->
			<div class='bo_pages'>
				<div class="pg_wrap">
					<ul class="pg">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""} '>
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage +1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- end Pagination -->

			<form id='actionForm' action="/admin/childList" method='get'>
				<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
			</form>
	    </div>
    </section>

<script type="text/javascript">
$(document).ready(function() {

	$('#regBtn').click(function() {

		$(location).attr('href','childRegister');
	});
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='cunicode' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/admin/childGet");
		actionForm.submit();
	});
	
    $("#searchForm button").on("click", function(e) {

/* 		if (!searchForm.find("option:selected").val()) {
			
		   alert("검색종류를 선택하세요");
		   return false;
		   
		} */
		
		if (!searchForm.find("input[name='keyword']").val()) {
			
		   alert("키워드를 입력하세요");
		   return false;
		   
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
});
</script>

<%@ include file="../includes/admin_footer.jsp"%>