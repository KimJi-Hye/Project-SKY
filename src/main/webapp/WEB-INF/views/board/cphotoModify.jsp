<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
       

     <form id="operForm" action="/board/cphotoModify" method="post">
 
				<div class="form-group">
				<label>Bno</label>${board.bno }
				</div>
			
				<div class="form-group">
				 <label>반이름</label> 
				 ${board.className }
				</div>
				
				<div class="form-group">
				 <label>태그</label> 
				 ${board.tag }
				</div>
				
				<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${board.title }"/>' >
				</div>
				
				<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content' >
				<c:out value="${board.content}" />
				</textarea>
				</div>
				
				<div class="form-group">
				<label>작성일</label> 
				${board.regdate }
				</div>
          

				<div class="btn_box">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_list">목록</button>
					<button type="button" class="btn_del">삭제</button>
				</div>
				
			    <input type="hidden" id="bno" name="bno" value="${board.bno}">				
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>	  
	</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- 584p 첨부파일 -->
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
  width: 100px;
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
      
        <!-- 586p  -->
	        <div class="form-group uploadDiv">
	            <input type="file" name='uploadFile' multiple="multiple">
	        </div>
        <!-- 586p  end -->
        
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
<!-- 584p 첨부파일 end -->

<script type="text/javascript">

$(document).ready(function() {
	
	var operForm = $("#operForm");
	$(".btn_mod").click(function() {
        console.log("submit clicked");
        
        var str = "";
        
        $(".uploadResult ul li").each(function(i, obj){
          
          var jobj = $(obj);
          
          console.dir(jobj);
          
          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
          
        });
        operForm.append(str).submit();
	});
	$(".btn_list").click(function() {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/cphotoList").attr("method","get");
	    var pageNumTag = $("input[name='pageNum']").clone();
	    var amountTag = $("input[name='amount']").clone();
	    
	    operForm.empty();
	    operForm.append(pageNumTag);
	    operForm.append(amountTag);
	    
		operForm.submit();
	});
	$(".btn_del").click(function() {
		operForm.attr("action", "/board/cphotoRemove");
		operForm.submit();
	});
});

</script>

<!-- 584p 첨부파일 -->
<script>
$(document).ready(function() {
  (function(){
    
    var bno = '<c:out value="${board.bno}"/>';
    
    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
    
      console.log(arr);
      
      var str = "";

      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            /* 587p */
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            /* 587p end*/
            str += "<img src='/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            /* 587p */
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"; 
            /* 587p end */
            str += "<img src='/resources/img/snow.jpg'></a>";
            str += "</div>";
            str +"</li>";
          }
       });
      
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  /* 588p  */
  $(".uploadResult").on("click", "button", function(e){
	    
	    console.log("delete file");
	      
	    if(confirm("Remove this file? ")){
	    
	      var targetLi = $(this).closest("li");
	      targetLi.remove();
	    }
  });  
  /* 588p  end */
  
  /* 589p 첨부파일 추가 */
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|xlsx|pdf|pptx|hwp|html)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  } 
  
  /* 589p end  */
  
  
}); //$(document).ready(function()
</script>
<!-- 585p 첨부파일 end -->

<%@include file="../includes/footer.jsp"%>