<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/resources/img/favicon.ico" type="image/favicon.ico">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/header.js"></script>
    <title>SKY Kindergarten</title>
</head>

<body>
    <!-- header { -->
    <header>
        <div id="header">
            <div class="hd_nav pc">
                <ul>
                  <sec:authorize access="isAnonymous()">
                  	<li><a href="/member/login" class="badge badge-pill badge-info">로그인</a></li>
                    <li><a href="/member/join">회원가입</a></li>
		          	<!-- <h5><a href="/member/login" class="badge badge-pill badge-info">LOGIN</a> 로그인 해주세요.</h5> -->
		          </sec:authorize>
		          <sec:authorize access="isAuthenticated()">
		          	<li><p><%=name %>님, 반갑습니다.</p></li>
			        <form action="/" method="POST">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			        <li><button type="submit" class="btn btn-dark btn-sm">로그아웃</button></li>
			        </form>
			        <li><a href="/member/myPage?userId=tea&userType=T">마이페이지</a></li>
		          </sec:authorize>
		          <sec:authorize access="hasRole('ROLE_A')">
		          <li><a href="../admin/admin_index">관리자</a></li>
		          </sec:authorize>
                    <!-- <li><a href="/member/login">로그인</a></li>
                    <li><a href="/member/join">회원가입</a></li>
                    <li><a href="../admin/admin_index">관리자</a></li> -->
                </ul>
            </div>
            <div class="hd mobile">
                <a href="../">
                    <img src="/resources/img/sky_logo.png" alt="SKY Kindergarten">
                    <h1>SKY <br><span>KINDERGARTEN</span></h1>
                </a>
                <button type="button" class="nav_btn">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
            <nav class="navBox">
                <ul>
                    <li>
                        <p class="main_nav"><a href="#self">유치원 소개<span></span></a></p>
                        <ul class="sub_nav">
                            <li><a href="/info/greetings">인사말</a></li>
                            <!-- <li><a href="#self">연혁</a></li>
                            <li><a href="#self">교육방향</a></li>
                            <li><a href="#self">교육계획</a></li>
                            <li><a href="#self">현황소개</a></li> -->
                            <li><a href="/info/kinderSpace">시설 및 환경</a></li>
                            <li><a href="/info/Map">오시는 길</a></li>
                        </ul>
                    </li>
                    <li>
                        <p class="main_nav"><a href="#self">알림마당<span></span></a></p>
                        <ul class="sub_nav">
                            <li><a href="/board/noticeList">공지사항</a></li>
                            <li><a href="/board/eventList">이달의 행사</a></li>
                            <!-- <li><a href="#self">급식안내</a></li> -->
                        </ul>
                    </li>
                    <li class="li_hd pc">
                        <a href="../" class="li_hd_h1">
                            SKY <br><span>KINDERGARTEN</span>
                        </a>
                        <a href="../" class="li_hd_img">
                            <img src="/resources/img/sky_logo.png" alt="SKY Kindergarten">
                        </a>
                    </li>
                    <li>
                        <p class="main_nav"><a href="#self">우리반이야기<span></span></a></p>
                        <ul class="sub_nav">
                            <!-- <li><a href="#self">반소개</a></li> -->
                            <li><a href="/board/noteList">알림장</a></li>
                            <li><a href="/board/cphotoList">반 앨범</a></li>
                        </ul>
                    </li>
                    <li>
                        <p class="main_nav"><a href="#self">원아모집<span></span></a></p>
                        <ul class="sub_nav">
                            <!-- <li><a href="#self">모집안내</a></li> -->
                            <li><a href="/apply/applyRegister">온라인접수</a></li>
                            <li><a href="/apply/applyCheck">접수조회</a></li>
                            <li><a href="/info/questionsList">Q&amp;A</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="login_bar mobile">
                    <a href="#self" class="login_btn">로그인</a>
                    <!-- <ul>
                        <li class="login_btn"><a href="#self">로그인</a></li>
                        <li class="join_btn"><a href="#self">회원가입</a></li>
                    </ul> -->
                </div>
            </nav>
            <span class="nav_bg"></span>
        </div>
    </header>
    <!-- } header end -->

    <!-- main { -->
    <main>
        <div id="container">
          
    