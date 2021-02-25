<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
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
                    <a href="#"><img src="/resources/img/5-1.jpg"></a>
                </div>

                <div class="banner_box2">

                    <div class="notice">
                        <h2><a href="">공지사항</a></h2>
                        <!-- Swiper -->
                        <div class="swiper-container swiper2">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <a href="#">기존일정 클릭시 팝업을 통한 수정, 삭제</a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">기존일정 클릭시 팝업을 통한 수정, 삭제</a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">기존일정 클릭시 팝업을 통한 수정, 삭제</a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">기존일정 클릭시 팝업을 통한 수정, 삭제</a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">기존일정 클릭시 팝업을 통한 수정, 삭제</a>
                                </div>
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
                            <a href="#">
                                <img src="/resources/img/notes.png">
                                <p>알림장</p>
                            </a>
                        </div>
                        <div class="con_bn banner3">
                            <a href="#">
                                <img src="/resources/img/calendar.png">
                                <p>이달의 행사</p>
                            </a>
                        </div>
                        <div class="con_bn banner4">
                            <a href="#"> 
                                <img src="/resources/img/restaurant.png">
                                <p>급식안내</p>
                            </a>
                        </div>
                        <div class="con_bn banner5">
                            <a href="#">
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