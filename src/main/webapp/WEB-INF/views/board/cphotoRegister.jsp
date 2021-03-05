<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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

	<div class="form-group">

		<form role="form" action="/board/cphotoRegister" method="post">

			<ul>
				<li><label>반 이름</label> <select name="className" required>
						<option value="" selected>선택</option>
						<c:forEach items="${mngList}" var="boardMng">
							<option value="${boardMng.className}">${boardMng.className}</option>
						</c:forEach>
				</select></li>


				<li><label>태그</label> <select name="tag" required>
						<option value="" selected>선택</option>
						<option value="교내사진">교내사진</option>
						<option value="외부행사">외부행사</option>
				</select></li>
				
				<li><label>제목</label> <input type="text"
					class="input_tx input_tx2" name='title'
					value='<c:out value="${board.title}"/>' required></li>
					
				<li><label>내용</label> <textarea class="input_tx input_tx2 input_tx3 textareaBox"  
					name='content' required></textarea></li>
			</ul>


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

			<div class="form-button">
				<sec:authorize access="hasAnyRole('B, C, D, E, F, G, ROLE_A')">
				<button type="submit" class="btn btn_mod">등록</button>
				<button data-oper='cphotoList' class="btn_list">목록</button>
		        </sec:authorize>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>



<script type="text/javascript">
	$(document).ready(
			function(e) {

				var form = $("form");
				$("button[data-oper='cphotoList']").on(
						"click",
						function(e) {
							e.preventDefault();
							form.attr("action", "/board/cphotoList").attr(
									"method", "get").submit();
						});
			});
</script>




<script>
	$(document)
			.ready(
					function(e) {

						var formObj = $("form[role='form']");

						$("button[type='submit']")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											console.log("submit clickked");

											var str = "";

											$(".uploadResult ul li")
													.each(
															function(i, obj) {

																var jobj = $(obj);

																console
																		.dir(jobj);

																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName'value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid'value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath'value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType'value='"
																		+ jobj
																				.data("type")
																		+ "'>";
															});
											formObj.append(str).submit();
										});

						var regex = new RegExp(
								"(.*?)\.(exe|sh|zip|alz|xlsx|pdf|pptx|hwp|html)$");
						var maxSize = 5242880; // 5MB

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

											function showUploadResult(
													uploadResultArr) {

												if (!uploadResultArr
														|| uploadResultArr.length == 0) {
													return;
												}

												var uploadUL = $(".uploadResult ul");

												var str = "";

												$(uploadResultArr)
														.each(
																function(i, obj) {

																	//image type
																	if (obj.image) {
																		var fileCallPath = encodeURIComponent(obj.uploadPath
																				+ "/s_"
																				+ obj.uuid
																				+ "_"
																				+ obj.fileName);

																		str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"
						str +=" ><div>";
																		str += "<span> "
																				+ obj.fileName
																				+ "</span>";
																		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle btn_cancle'><span class='material-icons'>cancel</span></button><br>";
																		str += "<img src='/display?fileName="
																				+ fileCallPath
																				+ "'>";
																		str += "</div>";
																		str
																				+ "</li>";
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
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
																		str += "<span> "
																				+ obj.fileName
																				+ "</span>";
																		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'"
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
																		str += "<img src='/resources/img/snow.jpg'></a>";
																		str += "</div>";
																		str
																				+ "</li>";
																	}
																});
												uploadUL.append(str);
											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												beforeSend : function(xhr) {
													xhr.setRequestHeader(
															csrfHeaderName,
															csrfTokenValue);
												},
												data : formData,
												type : 'POST',
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result); // 업로드 결과 처리 함수
												}
											}); //$.ajax
										});

						$(".uploadResult").on(
								"click",
								"button",
								function(e) {

									console.log("delete file");

									var targetFile = $(this).data("file");
									var type = $(this).data("type");

									var targetLi = $(this).closest("li");

									$.ajax({
										url : '/deleteFile',
										data : {
											fileName : targetFile,
											type : type
										},
										beforeSend : function(xhr) {
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
										},
										dataType : 'text',
										type : 'POST',
										success : function(result) {
											alert(result);
											targetLi.remove();
										}
									}); // $.ajax

								});
					});
</script>

<%@include file="../includes/footer.jsp"%>
