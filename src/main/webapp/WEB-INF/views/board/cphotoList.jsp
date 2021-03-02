<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_list.css">



<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>반앨범</h3>
</div>


<!-- 게시판 목록  -->
<div class="boardList">
	<table>
		<thead>
			<tr>
				<th class="th_bno">No</th>
				<th class="th_classname">반이름</th>
				<th class="th_tag">태그</th>
				<th class="th_title">제목</th>
				<th class="th_regdate">작성일</th>
			</tr>
			
		</thead>

		<tbody>
			<c:forEach items="${cphotoList}" var="board">
				<tr>
					<td><c:out value="${board.bno}" /></td>
					<td><c:out value="${board.className}" /></td>
					<td><c:out value="${board.tag}" /></td>
					<%-- <td><a href='/board/cphotoGet?bno=<c:out value="${board.bno}"/>'> --%>
					<td><a class='move' href='<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}" />
					</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${board.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

	<!-- 글쓰기 -->
	<div class="bo_register">
		<a href="cphotoRegister" class="pg_regi"> <span
			class="material-icons"> create </span>글쓰기
		</a>
	</div>

	<!-- Pagination -->
	<div class='bo_pages'>
		<ul class="pg_wrap">
			<span class="pg"> <c:if test="${pageMaker.prev}">
					<li class="paginate_button pg_page pg_start"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if> <c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button pg_page ${pageMaker.cri.pageNum == num ? "
						active pg_current":""} "><a href="${num}">${num}</a></li>
				</c:forEach> <c:if test="${pageMaker.next}">
					<li class="paginate_button pg_page pg_end"><a
						href="${pageMaker.endPage +1}">Next</a></li>
				</c:if>
			</span>
		</ul>
	</div>
	<!-- end Pagination -->

	<form id='actionForm' action="/board/cphotoList" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>

</div>
<!-- /.panel-body -->

 <script type="text/javascript">
  function fnImgPop(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
	 }
  
  function zoomIn(event) {
	  event.target.style.transform ="scale(1.5)";
	  event.target.style.zIndex = 1;
	  event.target.style.transition = "all 0.5s";
  }
  function zoomOut(event) {
	  event.target.style.transform ="scale(1)";
	  event.target.style.zIndex = 0;
	  event.target.style.transition = "all 0.5s";
  }
  
  
  </script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#regBtn").on("click", function() {

			self.location = "/board/cphotoRegister";

		})
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});		

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/cphotoGet");
			actionForm.submit();
		});		
		
		
		
	});
</script>
<%@include file="../includes/footer.jsp"%>
