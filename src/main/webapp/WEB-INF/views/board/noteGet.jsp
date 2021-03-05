<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script type="text/javascript" src="/resources/js/notereply.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	@media screen and (min-width: 768px){
		.navBox .main_nav a{
			margin-top: 27px;
		}
	}
</style>


<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>알림장</h3>
	</div>

	<div class="form-group">

		<form id="operForm" action="/board/noteModify" method="get">
			<ul>
				<li><label>No</label> <input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly" ></li>
				<li><label>반 이름</label> <input type="text"
					class="input_tx input_tx2" name='classname'
					value='<c:out value="${board.classname}"/>' readonly="readonly"></li>
				<li><label>원아 이름</label> <input type="text"
					class="input_tx input_tx2" name='cname'
					value='<c:out value="${board.cname}"/>' readonly="readonly"></li>
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' readonly="readonly"></li>
				<li><label>내용</label> <textarea class="input_tx input_tx2 input_tx3 textareaBox" 
					name='content' required><c:out value="${board.content}"/></textarea></li>
				<li><label>작성자</label> <input type="text"
					class="input_tx input_tx2" name='writer'
					value='<c:out value="${board.writer}"/>' readonly="readonly"></li>
			</ul>




			<div class="form-button">
				<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
        			<button data-oper='noteModify' class="btn_mod" onclick="location.href='/board/noteModify?bno=<c:out value="${board.bno}"/>'">수정</button>
				</sec:authorize>
				<!-- <button data-oper='noteModify' class="btn_mod">수정</button> -->
				<button data-oper='noteList' class="btn_list">목록</button>
			</div>


			<input type="hidden" id="bno" name="bno" value="${board.bno}">
			<input type='hidden' name='pageNum'
				value='<c:out value="${cri.pageNum}"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>

	</div>



	<!-- /.panel-heading -->
	<div class="panel-body modal">

		<ul class="chat">
			<!-- Start reply -->
			<li class="left clearfix" data-ron='12'>
				<div>
					<div class="header">
						<strong class="primary-font"></strong> <small
							class="pull-right text-muted"></small>
					</div>

				</div>
			</li>
			<!-- End reply -->

		</ul>
		<!-- ./ end ul -->
	</div>
	

	<div class="modal">

		<div class="form-reply">
			<label>댓글내용</label> <input type="text" class="input_1 form-control"
				name='content' value=''>
		</div>
		<div class="form-reply">
			<label>작성자</label> 
			

<sec:authentication property="principal" var="pinfo" />
			
<sec:authorize access="isAuthenticated()">
			<input type="text" class="input_1 form-control2"
				name='writer' value='${pinfo.username}' readonly>
</sec:authorize>
			
		</div>

		<div class="form-button2">
			<button id='modalRegisterBtn' type="button" class="btn_reg">등록</button>
		</div>
	</div>
</div>





<script type="text/javascript">

$(document).ready(function() {
	
	console.log("===================");
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
 
	showList(1);
   
	function showList(page){

		console.log("show list " + page);
	   
		/* NoteReplyService.getList({bno:bnoValue, page: page|| 1 }, function(list) { */

 		NoteReplyService.getList({bno:bnoValue, page: page|| 1 }, function(replyCnt, list) {
 			
		console.log("replyCnt: "+ replyCnt );
		console.log("list: " + list);
		console.log(list);
	   
 		if(page == -1){
		  pageNum = Math.ceil(replyCnt/10.0);
		  showList(pageNum);
		  return;
		}
	   
		var str="";
		
		if(list == null || list.length == 0){
			return;
		}
	  
		/* for (var i = 0, len = list.length || 0; i < len; i++) {
		    str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		    str +="  <div><div class='header'><strong class='primary-font'>["
		 	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
		    str +="    <small class='pull-right text-muted'>"
		        +list[i].replyDate+"</small></div>";
		    str +="    <p>"+list[i].reply+"</p></div></li>";
		} */
	  
		for (var i = 0, len = list.length || 0; i < len; i++) {
		    str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		    str +="  <div><div class='header'><strong class='primary-font'>[<span class='test'>"
		 	   +list[i].rno+"</span>] "+list[i].writer+"</strong>"; 
		    str +="    <small class='pull-right text-muted'>"
		        +NoteReplyService.displayTime(list[i].regdate)+"</small>";
		    str += "<button id='hidebutton' type='button' class='testMod' style='display: none;'>저장</button>";
		    str +="<button id='modalModBtn' type='button' class='bt_mod'>" + '수정' + "</button>";
		    str +="<button id='modalRemoveBtn' type='button' class='bt_del'>" + '삭제' + "</button>";
		    str +="    <p id='con'>"+list[i].content+"</p><input id='inputdis' style='display:none' type='text' value='"+list[i].content+"'></div>";
		    str += "</div></li>";
		    
		} 
	  
		replyUL.html(str);
		
		showReplyPage(replyCnt);


	});//end function
	
		/* } 주석해야되나 */
	}
		
    //버튼처리
    
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='content']");
	var modalInputReplyer = modal.find("input[name='writer']");
	var modalInputReplyDate = modal.find("input[name='regdate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	// 시큐리티 처리
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
    // Ajax spring security header ..
    $(document).ajaxSend(function(e, xhr, options) {
    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });
	
	modalRegisterBtn.on("click", function(){

		var reply = {
			content: modalInputReply.val(),
			writer: modalInputReplyer.val(),
			bno:bnoValue
		};
		
		NoteReplyService.add(reply, function(){

			showList(-1);
		})
	});
	
	
	$(document).on("click", '#modalModBtn', function(){
		
		$(this).hide();
		$(this).parent().find('#con').hide();
		$(this).parent().find('#hidebutton').show();
		$(this).parent().find('#inputdis').show();
		
		
/* 		var rno = $(this).parent().find(".test").text();
		
		var reply = {rno, content: modalInputReply.val()};
		
		NoteReplyService.update(reply, function(){
			
			alert("마!");
		}); */
		
	});
	
	$(document).on("click", '#hidebutton', function(){
		
 		var rno = $(this).parent().find(".test").text();
 		var content = $(this).parent().find("#inputdis").val();
 		var content = $(this).parent().find('#inputdis').val();
		
		var reply = {rno, content};
		
		NoteReplyService.update(reply, function(){
			
			showList(pageNum);
		});
	});
	
	$(document).on("click", '#modalRemoveBtn', function(){

		//var rno = $(this).data("rno");
		var rno = $(this).parent().find(".test").text();
		
		NoteReplyService.remove(rno, function(){
			
			showList(pageNum);
		});
	});
	
/* 	NoteReplyService.add(
		{content:"JS Test", writer:"tester", bno:bnoValue}
		,
		function(result){
			alert("RESULT: " + result);
		}
	) */
	
/* 	NoteReplyService.getList({bno.bnovalue, page:1}, function(list){
		
		for(var i = 0, len = list.length||0; i < len; i++ ){
			console.log(list[i]);
		}
		
	}); */
	
/* 	NoteReplyService.remove(3, function(count) {
		
		console.log(count);
		
		if (count === "success") {
			alert("REMOVED");
		}
		
	}, function(err) {
		alert('ERROR...');
		
	}); */
	
/* 	NoteReplyService.update({
		rno : 13,
		bno : bnoValue,
		content : "수정",
		writer : "수정2"
	}, function(result) {
		alert("수정 완료");
	}); */
	
	NoteReplyService.get(10, function(data){
		console.log(data);
	});
	
/* 	$(".chat").on("click", "li" function(e){
		
		var rno = $(this).data("rno");
		
		console.log(rno);
	}); */
	
	
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
	 
		var endNum = Math.ceil(pageNum / 10.0) * 10;  
		var startNum = endNum - 9; 
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
		  endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
		  next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
		  
			var active = pageNum == i? "active":"";
			
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str);
	}
//paging - end-------------------------

	//페이지 번호 클릭 이벤트
	replyPageFooter.on("click","li a", function(e){
		
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	}); 
	
	
	
	
	$(document).ready(function() {
		
		var operForm = $("#operForm");

		$("button[data-oper='noteModify']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/noteModify").submit();
		});
		
		$("button[data-oper='noteList']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/noteList").attr("method","get").submit();
		});
	});		
	
	
});
	
</script>




<%@include file="../includes/footer.jsp"%>