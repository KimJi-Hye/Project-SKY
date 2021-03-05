<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board_register.css">

<style>

.uploadResult {
	width: 100%;
	background-color: #eee;
}

.uploadResult ul {
	display: flex;
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

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: #333;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0% width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background-color: #eee;
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}

.btn_cancle {
    background: none;
    border: none;
}

select {
	width: 100%;
}
</style>

<div id="wrapper">
	<div class="boardTitle">
		<!-- 게시판 제목 -->
		<h3>반 앨범</h3>
	</div>

	<!-- /.row -->

	<div class="form-group">


		<form id="operForm" action="/board/cphotoModify" method="post">
			<ul>
				<li><label>Bno</label><input type="text"
					class="input_tx input_tx2" name='bno'
					value='<c:out value="${board.bno}"/>' readonly="readonly"></li>

				<li><label>반이름</label><input type="text"
					class="input_tx input_tx2" name='className'
					value='<c:out value="${board.className}"/>' readonly="readonly" ></li>

				<li><label>태그</label><input type="text"
					class="input_tx input_tx2" name='tag'
					value='<c:out value="${board.tag}"/>' readonly="readonly"></li>

				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' required></li>

				<li><label>내용</label> <textarea class="input_tx input_tx2 input_tx3 textareaBox" 
					name='content' required><c:out value="${board.content}"/></textarea></li>
			</ul>


	<!-- 584p 첨부파일 -->
	<div class='bigPictureWrapper'>
		<div class='bigPicture'></div>
	</div>


	<!-- 등록을 위한 화면 처리 p.554  -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">파일첨부</div>
				<!--  /.panel-heading -->
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name='uploadFile'>
					</div>

					<div class='uploadResult'>
						<ul>
						</ul>
					</div>
				</div>
				<!-- end panel-body -->
			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
	<!-- 584p 첨부파일 end -->
	

			<div class="form-button">
				<button type="button" class="btn_list">목록</button>
				<sec:authorize access="hasAnyRole('B, C, D, E, F, G, ROLE_A')">
					<button type="button" class="btn_mod">수정</button>
					<button type="button" class="btn_del">삭제</button>
				</sec:authorize>
			</div>

			<input type="hidden" id="bno" name="bno" value="${board.bno}">
			<input type='hidden' name='pageNum'
				value='<c:out value="${cri.pageNum}"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>
</div>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var operForm = $("#operForm");
						$(".btn_mod")
								.click(
										function() {
											console.log("submit clicked");

											var str = "";

											$(".uploadResult ul li")
													.each(
															function(i, obj) {

																var jobj = $(obj);

																console
																		.dir(jobj);

																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type")
																		+ "'>";

															});
											operForm.append(str).submit();
										});
						$(".btn_list")
								.click(
										function() {
											operForm.find("#bno").remove();
											operForm.attr("action",
													"/board/cphotoList").attr(
													"method", "get");
											var pageNumTag = $(
													"input[name='pageNum']")
													.clone();
											var amountTag = $(
													"input[name='amount']")
													.clone();

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
	$(document)
			.ready(
					function() {
						(function() {

							var bno = '<c:out value="${board.bno}"/>';

							$
									.getJSON(
											"/board/getAttachList",
											{
												bno : bno
											},
											function(arr) {

												console.log(arr);

												var str = "";

												$(arr)
														.each(
																function(i,
																		attach) {

																	//image type
																	if (attach.fileType) {
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/s_"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		/* 587p */
																		str += "<span> "
																				+ attach.fileName
																				+ "</span>";
																		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle btn_cancle'><span class='material-icons'>cancel</span></button><br>";
																		/* 587p end*/
																		str += "<img src='/display?fileName="
																				+ fileCallPath
																				+ "'>";
																		str += "</div>";
																		str
																				+ "</li>";
																	} else {

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<span> "
																				+ attach.fileName
																				+ "</span><br/>";
																		/* 587p */
																		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle btn_cancle'><span class='material-icons'>cancel</span></button><br>";
																		/* 587p end */
																		str += "<img src='/resources/img/snow.jpg'></a>";
																		str += "</div>";
																		str
																				+ "</li>";
																	}
																});

												$(".uploadResult ul").html(str);

											});//end getjson
						})();//end function

						/* 588p  */
						$(".uploadResult").on("click", "button", function(e) {

							console.log("delete file");

							if (confirm("Remove this file? ")) {

								var targetLi = $(this).closest("li");
								targetLi.remove();
							}
						});
						/* 588p  end */

						/* 589p 첨부파일 추가 */
						var regex = new RegExp(
								"(.*?)\.(exe|sh|zip|alz|xlsx|pdf|pptx|hwp|html)$");
						var maxSize = 5242880; //5MB

						function checkExtension(fileName, fileSize) {

							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}

							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}

						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";

						$("input[type='file']")
								.change(
										function(e) {

											var formData = new FormData();

											var inputFile = $("input[name='uploadFile']");

											var files = inputFile[0].files;

											for (var i = 0; i < files.length; i++) {

												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);

											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												type : 'POST',
												beforeSend : function(xhr) {
													xhr.setRequestHeader(
															csrfHeaderName,
															csrfTokenValue);
												},
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result); //업로드 결과 처리 함수 

												}
											}); //$.ajax

										});

						function showUploadResult(uploadResultArr) {

							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}

							var uploadUL = $(".uploadResult ul");

							var str = "";

							$(uploadResultArr)
									.each(
											function(i, obj) {

												if (obj.image) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/s_"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn_cancle'><span class='material-icons'>cancel</span></button><br>";
													str += "<img src='/display?fileName="
															+ fileCallPath
															+ "'>";
													str += "</div>";
													str + "</li>";
												} else {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");

													str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn_cancle'><span class='material-icons'>cancel</span><br>";
													str += "<img src='/resources/img/attach.png'></a>";
													str += "</div>";
													str + "</li>";
												}

											});

							uploadUL.append(str);
						}

						/* 589p end  */

					}); //$(document).ready(function()
</script>
<!-- 585p 첨부파일 end -->

<%@include file="../includes/footer.jsp"%>
