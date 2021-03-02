<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>Q & A</h3>
	</div>
	<div class="form-group">
				
			<form id='operForm' action="/board/questionsGet" method="post">
			<ul>
				<li><label>No</label> <input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly"></li>
					
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' ></li>
					
				<li><label>내용</label> <input type="text"
					class="input_tx input_tx2 input_tx3" name='content'
					value='<c:out value="${board.content}"/>' ></li>
					
				<li><label>작성자</label> <input type="text"
					class="input_tx input_tx2" name='writer'
					value='<c:out value="${board.writer}"/>' ></li>
					
				<li><label>비밀번호</label> <input type="text"
					class="input_tx input_tx2" name='pw'
					value='<c:out value="${board.pw}"/>' ></li>										
					
			</ul>			
				

			<div class="form-button">
				<button data-oper='questionsModify' class="btn_mod">수정</button>
				<button data-oper='questionsList' class="btn_list">목록</button>
				<button data-oper='questionsRemove' class="btn_del">접수취소</button>
			</div>


				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
			</form>
				
			</div>
			<!-- /.panel-body -->
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
			<label>작성자</label> <input type="text" class="input_1 form-control2"
				name='writer' value=''>
		</div>

		<div class="form-button2">
			<button id='modalRegisterBtn' type="button" class="btn_reg">등록</button>
		</div>
	</div>
</div>

<!-- <script type="text/javascript">

$(document).ready(function() {

 	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
		e.preventDefault();
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/board/applyRemove");
	      
	    } else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/board/applyList").attr("method","get");
	      formObj.empty();
	      
		} else if(operation === 'applyModify'){
		  formObj.attr("action", "/board/applyModify").attr("method","post");
		  formObj.empty();
		
		}
	    
	    formObj.submit();
	  });

});
</script> -->
<script type="text/javascript">
$(document).ready(function() {
	
	console.log("===================");
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
 
	showList(1);
   
	function showList(page){

		console.log("show list " + page);
	   
		/* QnaReplyService.getList({bno:bnoValue, page: page|| 1 }, function(list) { */

 		QnaReplyService.getList({bno:bnoValue, page: page|| 1 }, function(replyCnt, list) {
 			
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
		        +QnaReplyService.displayTime(list[i].regdate)+"</small>";
		    str += "<button id='hidebutton' type='button' class='testMod' style='display: none;'>저장</button>";
		    str +="<button id='modalModBtn' type='button' class='bt_mod'>" + '수정' + "</button>";
		    str +="<button id='modalRemoveBtn' type='button' class='bt_del'>" + '삭제' + "</button>"
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
		
		QnaReplyService.add(reply, function(){

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
		
		QnaReplyService.update(reply, function(){
			
			alert("마!");
		}); */
		
	});
	
	$(document).on("click", '#hidebutton', function(){
		
 		var rno = $(this).parent().find(".test").text();
 		var content = $(this).parent().find("#inputdis").val();
 		var content = $(this).parent().find('#inputdis').val();
		
		var reply = {rno, content};
		
		QnaReplyService.update(reply, function(){
			
			showList(pageNum);
		});
	});
	
	$(document).on("click", '#modalRemoveBtn', function(){

		//var rno = $(this).data("rno");
		var rno = $(this).parent().find(".test").text();
		
		QnaReplyService.remove(rno, function(){
			
			showList(pageNum);
		});
	});
	
/* 	QnaReplyService.add(
		{content:"JS Test", writer:"tester", bno:bnoValue}
		,
		function(result){
			alert("RESULT: " + result);
		}
	) */
	
/* 	QnaReplyService.getList({bno.bnovalue, page:1}, function(list){
		
		for(var i = 0, len = list.length||0; i < len; i++ ){
			console.log(list[i]);
		}
		
	}); */
	
/* 	QnaReplyService.remove(3, function(count) {
		
		console.log(count);
		
		if (count === "success") {
			alert("REMOVED");
		}
		
	}, function(err) {
		alert('ERROR...');
		
	}); */
	
/* 	QnaReplyService.update({
		rno : 13,
		bno : bnoValue,
		content : "수정",
		writer : "수정2"
	}, function(result) {
		alert("수정 완료");
	}); */
	
	QnaReplyService.get(10, function(data){
		console.log(data);
	});
	
/* 	$(".chat").on("click", "li" function(e){
		
		var rno = $(this).data("rno");
		
		console.log(rno);
	}); */
	
	
	var operForm = $("#operForm");
	
	$("button[data-oper='questionsModify']").on("click", function(e) {
		e.preventDefault();		
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/questionsModify").attr("result", "success").submit();
	});	
	
	$("button[data-oper='questionsList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/questionsList").attr("method","get").submit();
	});
	
	$("button[data-oper='questionsRemove']").on("click", function(e){
		operForm.attr("action", "/board/questionsRemove").submit();
	});
	
	
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
});
</script>

<%@include file="../includes/footer.jsp"%>
