<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Class Read Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Class Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				
			<form id='operForm' action="/board/applyGet" method="post">	
				<div class="form-group">
					<label>게시글 번호</label> <input class="form-control" name='bno'
						value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> 
					<input class="form-control" name='title'
						value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label> <input class="form-control" name='content'
						value='<c:out value="${board.content}"/>'>
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>'>
				</div>
				
				<div class="form-group">
					<label>작성일</label> <input class="form-control" name='regdate'
						value='<c:out value="${board.regdate}"/>'>
				</div>
				
				<div class="form-group">
					<label>수정날짜</label> <input class="form-control" name='updatedate'
						value='<c:out value="${board.updatedate}"/>'>
				</div>
				
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" name='pw'
						value='<c:out value="${board.pw}"/>'>
				</div>

				<button data-oper='applyModify' class="btn btn-default">수정</button>
				<button data-oper='applyList' class="btn btn-info">돌아가기</button>
				<button data-oper='applyRemove' class="btn btn-default">접수취소</button>

				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			</form>
				
			</div>
			<!-- /.panel-body -->
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
						</div>
						<p>Good job!</p>
					</div>
				</li>
			<!-- End reply -->
			
			</ul>
		<!-- ./ end ul -->
		</div>
		<div class="panel-footer"></div>
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
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
		    str +="    <p id='con'>"+list[i].content+"</p><input id='inputdis' style='display:none' type='text' value='"+list[i].content+"'></div>";
		    str += "<button id='hidebutton' type='button' class='testMod' style='display: none;'>저장</button>";
		    str +="<button id='modalModBtn' type='button' class='btn btn-default'>" + '수정' + "</button>";
		    str +="<button id='modalRemoveBtn' type='button' class='btn btn-default'>" + '삭제' + "</button>" + "</div></li>";
		    
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
	
	$("button[data-oper='applyModify']").on("click", function(e) {
		operForm.attr("action", "/board/questionsModify").submit();
	});
	
	$("button[data-oper='applyList']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/questionsList").attr("method","get").submit();
	});
	
	$("button[data-oper='applyRemove']").on("click", function(e){
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
<script type="text/javascript">

</script>
