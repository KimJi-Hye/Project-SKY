<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">
<style>
	#QApwCheck{
		width: 900px; margin: 200px auto;
	}
	#QApwCheck .boardTitle{
		margin-bottom: 30px;
		border-bottom: 3px solid #0a69cc;
	}
	#QApwCheck .boardTitle h3{
		height: 50px; margin-bottom: 10px;
		font-size: 32px;
	}
	#QApwCheck .pwBox{
		width: 80%; margin: 0 auto;
	} 
	#QApwCheck .pwBox h3{
		margin-bottom: 20px;
		text-align: center;
	}
	#QApwCheck .pwBox .inputBox{
		margin-bottom: 10px;
	    font-size: 16px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	#QApwCheck .pwBox .inputBox label{
		width: 100px; padding-right: 10px;
		font-size: 16px;
    	display: block;
	}
	#QApwCheck .pwBox .inputBox input{
		width: 240px;
	}
	#QApwCheck .pwBox .btn_reg{
		width: 340px; padding: 10px; margin: 30px auto;
	    font-size: 18px;
	    font-weight: bold;
	    transition: .2s;
	}
	@media screen and (min-width: 768px){
		.navBox .main_nav a{
			margin-top: 27px;
		}
	}
</style>

<div id="QApwCheck">
	<div class="boardTitle">
		<h3>Q&A 비밀번호 조회</h3>
	</div>
	<div class="form-group">
		<div class="pwBox">
			<h3>비밀번호를 입력하세요.</h3>
			<div class="inputBox">
				<label for="QNApw">비밀번호</label>
				<input type="password" id="pw_qna" name="pw_qna">
			</div>
			<button type="button" class="pw_btn btn_reg">확인</button>
		</div>
	</div>
</div>

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>Q & A</h3>
	</div>
	<div class="form-group">
				
			<form id='operForm' action="/info/questionsGet" method="post">
			<ul>
				<li><label>No</label> <input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly"></li>
					
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' required></li>
					
				<li><label>내용</label> 
					<textarea name='content' class="textareaBox" required><c:out value="${board.content}"/></textarea>
				</li>
					
				<li><label>작성자</label> <input type="text"
					class="input_tx input_tx2" name='writer'
					value='<c:out value="${board.writer}"/>' readonly></li>									
					
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
			<label>댓글내용</label> <input type="text" id="replycon" class="input_1 form-control"
				name='content' value=''>
		</div>
		<div class="form-reply">
			<label>작성자</label> 
			<input type="text" class="input_1 form-control2" name='writer' id='reply_w' value='<c:out value="${board.writer}"/>'>
			<%-- <sec:authentication property="principal" var="pinfo" />
			
			<sec:authorize access="isAnonymous()">
			
			<c:choose>

				<c:when test="${pinfo.username eq 'admin'}">
					<input type="text" class="input_1 form-control2" name='writer' value='관리자'>
				</c:when>
				<c:otherwise>
					<input type="text" class="input_1 form-control2" name='writer' value='<c:out value="${board.writer}"/>'>
				</c:otherwise>
			
			</c:choose>
			</sec:authorize> --%>
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
	      formObj.attr("action", "/info/applyRemove");
	      
	    } else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/info/applyList").attr("method","get");
	      formObj.empty();
	      
		} else if(operation === 'applyModify'){
		  formObj.attr("action", "/info/applyModify").attr("method","post");
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
		
		if ($("#replycon").val() == "") {
			alert("내용을 입력하세요");
			return;
		}
	
		var reply = {
			content: modalInputReply.val(),
			writer: modalInputReplyer.val(),
			bno:bnoValue
		};
		
		QnaReplyService.add(reply, function(){

			showList(-1);
		});
		$("#replycon").val("");
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
		operForm.attr("action", "/info/questionsModify").attr("result", "success").submit();
	});	
	
	$("button[data-oper='questionsList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/info/questionsList").attr("method","get").submit();
	});
	
	$("button[data-oper='questionsRemove']").on("click", function(e){
		operForm.attr("action", "/info/questionsRemove").submit();
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


<script type="text/javascript">
	$(document).ready(function(){
		var wrap = $("#wrapper");
		var windex = wrap.html();
		
		var bno = '<c:out value="${board.bno}"/>';
        var pwQna = $("#pw_qna").val();
		//wrap.html("");
		wrap.hide();

		<sec:authentication property="principal" var="pinfo" />

		<sec:authorize access="hasRole('ROLE_A')">
			$("#reply_w").val("관리자");
			wrap.show();
		  	$("#QApwCheck").hide();
		</sec:authorize>
		
		$(".pw_btn").click(function(){
	        var pwQna = $("#pw_qna").val();
			if(pwQna == ""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			$.ajax({
	        	url:'/info/qnaPwCheck?bno=' + bno,
	       		type:'get',
	       		success:function(data){
	    			if(pwQna == data){
	    				//wrap.append(windex);
	    				wrap.show();
	    				$("#QApwCheck").hide();
	    				//$("#QApwCheck").html("");
	    			} else {
	    				alert("비밀번호가 일치하지 않습니다.");
	    				$("#pw_qna").focus();
	    				return false;
	    			}
	       		}
	        })
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>
