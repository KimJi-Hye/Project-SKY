<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/cphoto.css">



<div class="boardTitle">
	<!-- 게시판 제목 -->
	<h3>반앨범</h3>
</div>


<!-- 게시판 목록  -->
<div class="boardList">
	<div class="cphoto"></div>
	<ul>
	<!-- 데모이미지 { -->
		<li>
			<a class='move' href='581'>
				<div class="li_img">
					<img class="img" src="/resources/demo/1.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='582'>
				<div class="li_img">
					<img class="img" src="/resources/demo/2.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='583'>
				<div class="li_img">
					<img class="img" src="/resources/demo/3.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='584'>
				<div class="li_img">
					<img class="img" src="/resources/demo/4.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='585'>
				<div class="li_img">
					<img class="img" src="/resources/demo/5.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='586'>
				<div class="li_img">
					<img class="img" src="/resources/demo/6.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='587'>
				<div class="li_img">
					<img class="img" src="/resources/demo/7.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='588'>
				<div class="li_img">
					<img class="img" src="/resources/demo/8.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
		<li>
			<a class='move' href='589'>
				<div class="li_img">
					<img class="img" src="/resources/demo/9.jpg">
				</div>
				<div class="li_title">
					<h4>수업사진 입니다.</h4>
				</div>
				<div class="li_date">
					<p>2021-03-04</p>
					<p>교내 사진</p>
				</div>
			</a>
		</li>
	<!-- } 데모이미지 끝 -->
		<%-- <c:forEach items="${cphotoList}" var="board">
			<li><a class='move' href='<c:out value="${board.bno}"/>'>
					<div class="li_img">
						<img class="img"
							src="/resources/cphoto/<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}" />/<c:out value='${board.uuid}'/>_<c:out value='${board.filename}'/>">
					</div>
					<div class="li_title">
						<h4>
							<c:out value="${board.title}" />
						</h4>
					</div>

					<div class="li_date">
						<p>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
						</p>
						<p>
							<c:out value="${board.tag}" />
						</p>
					</div>
			</a></li>
		</c:forEach> --%>
	</ul>
</div>


<!-- 글쓰기 -->
<div class="bo_register">
<sec:authorize access="hasAnyRole('B, C, D, E, F, G, ROLE_A')">
	<a href="cphotoRegister" class="pg_regi"> <span
		class="material-icons"> create </span>글쓰기
	</a>
</sec:authorize>
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
					class="paginate_button pg_page ${pageMaker.cri.pageNum == num ? "activepg_current":""} "><a
					href="${num}">${num}</a></li>
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
