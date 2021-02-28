<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/kinder.css"> 

            <div class="boardTitle2">
                <!-- 게시판 제목 -->
                <h3> 시설 및 환경 </h3>
            </div>

            <!-- Swiper -->
            <div class="swiper-container gallery-top">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class2.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class3.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class4.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class5.jpg)"></div>                                                
                </div>
                <!-- Add Arrows -->
                <div class="swiper-button-next swiper-button-white"></div>
                <div class="swiper-button-prev swiper-button-white"></div>
            </div>
            <div class="swiper-container gallery-thumbs">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class2.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class3.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class4.jpg)"></div>
                    <div class="swiper-slide"
                        style="background-image:url(/resources/img/class5.jpg)"></div>   
                </div>
            </div>
            
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/resources/js/kinder.js"></script>            
            



<%@include file="../includes/footer.jsp"%>