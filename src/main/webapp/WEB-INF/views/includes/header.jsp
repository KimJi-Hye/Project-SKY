<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/resources/img/favicon.ico" type="image/favicon.ico">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                    <li><a href="#">로그인</a></li>
                    <li><a href="/member/join">회원가입</a></li>
                    <li><a href="../admin/admin_index">관리자</a></li>
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
                            <li><a href="#self">인사말</a></li>
                            <!-- <li><a href="#self">연혁</a></li>
                            <li><a href="#self">교육방향</a></li>
                            <li><a href="#self">교육계획</a></li>
                            <li><a href="#self">현황소개</a></li> -->
                            <li><a href="#self">시설 및 환경</a></li>
                            <li><a href="#self">오시는 길</a></li>
                        </ul>
                    </li>
                    <li>
                        <p class="main_nav"><a href="#self">알림마당<span></span></a></p>
                        <ul class="sub_nav">
                            <li><a href="/board/noticeList">공지사항</a></li>
                            <li><a href="/board/eventList">이달의 행사</a></li>
                            <li><a href="#self">급식안내</a></li>
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
                            <li><a href="#self">반소개</a></li>
                            <li><a href="/board/noteList">알림장</a></li>
                            <li><a href="/board/cphotoList">반 앨범</a></li>
                        </ul>
                    </li>
                    <li>
                        <p class="main_nav"><a href="#self">원아모집<span></span></a></p>
                        <ul class="sub_nav">
                            <li><a href="#self">모집안내</a></li>
                            <li><a href="/board/applyRegister">온라인접수</a></li>
                            <li><a href="/board/applyGet">접수조회</a></li>
                            <li><a href="/board/questionsList">Q&amp;A</a></li>
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
          
    