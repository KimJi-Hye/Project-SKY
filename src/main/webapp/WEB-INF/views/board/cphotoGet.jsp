<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp"%>




<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class="form-group">
				<label>Bno</label> <input class="form-control" name='bno'
				value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>
			
				<div class="form-group">
				 <label>반이름</label> <input class="form-control" name='className'
				value='<c:out value="${board.className }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				 <label>태그</label> <input class="form-control" name='tag'
				value='<c:out value="${board.tag }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content' readonly="readonly">
				<c:out value="${board.content}" />
				</textarea>
				</div>

				
				<div class="btn_box">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_list">목록</button>
					<button type="button" class="btn_del">삭제</button>
				</div>
				<form id="operForm" action="/board/cphotoModify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno}">
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
	
				</form>				
			
			
			
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->

<!-- 572p 첨부파일  -->
<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100%;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
.bigPicture img {
  width:600px;
}
</style>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- 573p 첨부파일 end -->
<script>
	$(document).ready(
			function() {
				var operForm = $("#operForm");
				var operForm = $("#operForm");
				$(".btn_mod").click(function() {
					operForm.submit();
				});
				$(".btn_list").click(function() {
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/cphotoList");
					operForm.submit();
				});
				$(".btn_del").click(function() {
					operForm.attr("action", "/board/cphotoRemove").attr("method","post");
					operForm.submit();
				});
				
				(function(){
				    var bno = '<c:out value="${board.bno}"/>';
				    
				    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				    
				      console.log(arr);
				      
				      //574p
				      var str = "";
				       
				       $(arr).each(function(i, attach){
				       
				         //image type
				         if(attach.fileType){
				           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
				           
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<img src='/display?fileName="+fileCallPath+"'>";
				           str += "</div>";
				           str +"</li>";
				         }else{
				             
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<span> "+ attach.fileName+"</span><br/>";
				           str += "<img src='/resources/img/snow.jpg'></a>";
				           str += "</div>";
				           str +"</li>";
				         }
				       });
				       
				       $(".uploadResult ul").html(str);     
				      //574p end
				      
				    }); //end getjson
				    
				  })();//end function
				 //575p 첨부파일 클릭 이벤트 처리
				  $(".uploadResult").on("click","li", function(e){
				      
				    console.log("view image");
				    
				    var liObj = $(this);
				    
				    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
				    
				    if(liObj.data("type")){
				      showImage(path.replace(new RegExp(/\\/g),"/"));
				    }else {
				      //download 
				      self.location ="/download?fileName="+path
				    }   
				    
				  });  
				  
				  function showImage(fileCallPath){
					    
					    //alert(fileCallPath);
				    
					    $(".bigPictureWrapper").css("display","flex").show();
					    
					    $(".bigPicture")
					    .html("<img src='/display?fileName="+fileCallPath+"' >")
					    .animate({width:'100%', height: '100%'}, 1000);	    
					  }
				  // 578p end
				  
				  //577p 원본 이미지 창 닫기  
				  $(".bigPictureWrapper").on("click", function(e){
					    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
					    setTimeout(function(){
					      $('.bigPictureWrapper').hide();
					    }, 1000);
					  });
				  //577p end
			});
</script>
<%@include file="../includes/footer.jsp"%>