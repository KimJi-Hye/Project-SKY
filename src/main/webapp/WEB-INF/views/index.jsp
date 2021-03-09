<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
    
<%@ include file="includes/header.jsp"%>
    <link rel="stylesheet" href="/resources/css/sky_main.css">


                <div class="main_con">

                    <section class="sliderBox">
    
                        <!-- Swiper -->
                        <div class="swiper-container swiper1">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="/resources/img/1-1.jpg"></div>
                                <div class="swiper-slide"><img src="/resources/img/2-1.jpg"></div>
                                <div class="swiper-slide"><img src="/resources/img/3-1.jpg"></div>
                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>

                    </section>



            <section class="section_1">

                <div class="banner_box">
                    <a href="/apply/applyRegister"><img src="/resources/img/5-1.jpg"></a>
                </div>

                <div class="banner_box2">

                    <div class="notice">
                        <h2><a href="/board/noticeList">공지사항</a></h2>
                        <!-- Swiper -->
                        <div class="swiper-container swiper2">
                            <div class="swiper-wrapper">
                            
                            	<div class="swiper-slide">
	                            	<a href="/board/noticeGet?bno=322">공지사항 입니다.</a>
	                            </div>
                            
                            	<div class="swiper-slide">
	                            	<a href="/board/noticeGet?bno=322">공지사항 입니다.</a>
	                            </div>
	                            <%-- <c:if test="${empty homeN}">
	                                <div class="swiper-slide">
	                                    <p>등록된 공지사항이 없습니다.</p>
	                                </div>
								</c:if>
								
                                <c:forEach items="${homeN}" var="notice">
	                                <div class="swiper-slide">
	                                    <a href="/board/noticeList?bno=<c:out value="${notice.bno}"/>"><c:out value="${notice.title}" /></a>
	                                </div>
								</c:forEach> --%>
								
                            </div>
                            <!-- Add Arrows -->
                            <div class="slide_btn">
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                    </div>

                    <div class="icon_box">
                        <div class="con_bn banner2">
                            <a href="/board/noteList">
                                <img src="/resources/img/notes.png">
                                <p>알림장</p>
                            </a>
                        </div>
                        <div class="con_bn banner3">
                            <a href="/board/eventList">
                                <img src="/resources/img/calendar.png">
                                <p>이달의 행사</p>
                            </a>
                        </div>
                        <div class="con_bn banner4">
                            <a href="/board/cphotoList"> 
                                <img src="/resources/img/restaurant.png">
                                <p>반 앨범</p>
                            </a>
                        </div>
                        <div class="con_bn banner5">
                            <a href="/info/Map">
                                <img src="/resources/img/map.png">
                                <p>오시는 길</p>
                            </a>
                        </div>
                    </div>
                </div>

            </section>
                            
        </div>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/resources/js/sky_main.js"></script>

<%@ include file="includes/footer.jsp"%>