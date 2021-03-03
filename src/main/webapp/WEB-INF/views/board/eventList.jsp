<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>

    <link rel="stylesheet" href="/resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="/resources/vendor/css/bootstrap.css">
    <link rel="stylesheet" href='/resources/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='/resources/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="/resources/css/main.css">
    <div class="container">

		<sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
	        <!-- 일자 클릭시 메뉴오픈 -->
	        <div id="contextMenu" class="dropdown clearfix">
	            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                style="display:block;position:static;margin-bottom:5px;">
	                <li><a tabindex="-1" href="#">일정등록</a></li>
	<!--                 <li><a tabindex="-1" href="#">카테고리2</a></li>
	                <li><a tabindex="-1" href="#">카테고리3</a></li>
	                <li><a tabindex="-1" href="#">카테고리4</a></li> -->
	                <li class="divider"></li>
	                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
	            </ul>
	        </div>
        </sec:authorize>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar">
            
            </div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row" style="display: none;">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" checked></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                               	<input class="inputModal" type="text" name="edit-type" id="edit-type" value="유치원행사" readonly>
                                <!-- <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select> -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        
                        <sec:authorize access="hasAnyRole('ROLE_A,B,C,D,E,F,G')">
	                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                        </sec:authorize>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
		
		<!-- 필터 박스 -->
        <div class="panel panel-default" style="display: none;">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="유치원행사">유치원행사</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline">
                        <input class="filter" type="checkbox" value="관리자" checked>관리자</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="/resources/vendor/js/jquery.min.js"></script>
    <script src="/resources/vendor/js/bootstrap.min.js"></script>
    <script src="/resources/vendor/js/moment.min.js"></script>
    <script src="/resources/vendor/js/fullcalendar.min.js"></script>
    <script src="/resources/vendor/js/ko.js"></script>
    <script src="/resources/vendor/js/select2.min.js"></script>
    <script src="/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript" >
    
    	// 데이터 불러오기
		var events = [
    		<c:forEach items="${list}" var="li">
			{
				_id: "${li.bno}",
			    title: "${li.title}",
			    description: "${li.content}",
			    start: "${li.startdate}",
			    end: "${li.enddate}",
			    type: "유치원행사",
			    username: "관리자",
			    backgroundColor: "${li.color}",
			    textColor: "#ffffff",
			    allDay: false
		    },
			</c:forEach>
		];
    	
    	// 시큐리티 처리
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
	    // Ajax spring security header ..
	    $(document).ajaxSend(function(e, xhr, options) {
	    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    });

    </script>
    
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/addEvent.js"></script>
    <script src="/resources/js/editEvent.js"></script>
    <script src="/resources/js/etcSetting.js"></script>
    
    <script>
    	$(document).ready(function(){
    	});
    </script>
    
<%@ include file="../includes/footer.jsp"%>