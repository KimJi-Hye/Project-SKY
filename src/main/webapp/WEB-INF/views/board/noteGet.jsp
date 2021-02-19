<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/resources/js/notereply.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1>ClassNote Get Page</h1>
			</div>

			<div class="panel-body">

					<div class="form-group">
						<label>bno</label> <input class="form-control" name='bno' 
						value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>


					<div class="form-group">
						<label>반 이름</label> <input class="form-control" name='classname' 
						value='<c:out value="${board.classname }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>원아 이름</label> <input class="form-control" name='cname'
						value='<c:out value="${board.cname }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label> <input class="form-control" name='content'
						value='<c:out value="${board.content }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>작성일</label> <input class="form-control" name='regdate'
							value='<c:out value="${board.regdate }"/>' readonly="readonly">
					</div>

				
				<div class="btn_box">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_list">목록</button>
					<button type="button" class="btn_del">삭제</button>
				</div>
				
				<form id="operForm" action="/board/noteModify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno}">
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				</form>
	
			</div>
		</div>
		
				<div class="modal">
		
			<div class="form-group">
				<label>댓글</label>
				<input class="form-control" name='content' value=''>
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input class="form-control" name='writer' value=''>
			</div>
			
			<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
		
		</div>
		
		<!-- /.panel -->
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Reply
		<!-- 718p -->
		<!-- <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button> -->
		</div>      
		
		
		<!-- /.panel-heading -->
		<div class="panel-body modal">        
		
			<ul class="chat">
				<!-- Start reply -->
				<li class="left clearfix" data-ron='12'>
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2018-01-01 13:13</small>
							<!-- <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button> -->
						</div>
						<p>Good job!</p>
					</div>
				</li>
			<!-- End reply -->
			
			</ul>
		<!-- ./ end ul -->
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
	   
		NoteReplyService.getList({bno:bnoValue, page: page|| 1 }, function(list) {

/* 		NoteReplyService.getList({bno:bnoValue, page: page|| 1 }, function(replyCnt, list) {
		console.log("replyCnt: "+ replyCnt ); */
		console.log("list: " + list);
		console.log(list);
	   
/* 		if(page == -1){
		  pageNum = Math.ceil(replyCnt/10.0);
		  showList(pageNum);
		  return;
		}  */
	   
		var str="";
		
		if(list == null || list.length == 0){
			replyUL.html("");
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
		    str +="    <p id='con'>"+list[i].content+"</p><input id='inputdis' style='display:none' type='text' value='"+list[i].content+"'></div>";
		    str += "<button id='hidebutton' type='button' class='testMod' style='display: none;'>저장</button>";
		    str +="<button id='modalModBtn' type='button' class='btn btn-default'>" + '수정' + "</button>";
		    str +="<button id='modalRemoveBtn' type='button' class='btn btn-default'>" + '삭제' + "</button>" + "</div></li>";
		    
		} 
	  
		replyUL.html(str);
		
		/* showReplyPage(replyCnt); */


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
	
	modalRegisterBtn.on("click", function(){

		var reply = {
			content: modalInputReply.val(),
			writer: modalInputReplyer.val(),
			bno:bnoValue
		};
		
		NoteReplyService.add(reply, function(){

			showList(1);
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
		
		var reply = {rno, content};
		
		NoteReplyService.update(reply, function(){
			
			showList(1);
		});
	});
	
	$(document).on("click", '#modalRemoveBtn', function(){

		//var rno = $(this).data("rno");
		var rno = $(this).parent().find(".test").text();
		
		NoteReplyService.remove(rno, function(){
			
			showList(1);
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
	
/* 	ReplyService.remove(3, function(count) {
		
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
	
	
	
	
	
	var operForm = $("#operForm");
	$(".btn_mod").click(function() {
		operForm.submit();
	});
	$(".btn_list").click(function() {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/noteList");
		operForm.submit();
	});
	$(".btn_del").click(function() {
		operForm.attr("action", "/board/noteRemove").attr("method","post");
		operForm.submit();
	});
});

</script>





<%@include file="../includes/footer.jsp"%>