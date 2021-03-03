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
    <link rel="stylesheet" href="/resources/css/admin_header.css">
    <link rel="stylesheet" href="/resources/css/admin_index.css">
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/admin_header.js"></script>
    <title>SKY Kindergarten</title>
</head>
<body>
    <!-- header { -->
    <header>
        <div id="hd">
            <button type="button" class="hd_btn hd_left">
                <span class="material-icons">format_indent_decrease</span>
            </button>
            <h1><a href="/admin/admin_index">ADMINISTRATOR</a></h1>
            <div class="hd_right">
				<%-- <form action="/" method="POST">
			    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			    	<button type="submit" class="btn btn-dark btn-sm">LOGOUT</button>
				</form> --%>
                <a href=""><span class="material-icons">logout</span></a>
                <a href="../"><span class="material-icons">home</span></a>
            </div>
        </div>
        <nav>
            <div id="nav">
                <ul>
                    <li>
                        <a href="../author/list">
                            <span class="material-icons">lock</span>
                            <p>권한 관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../member/memList">
                            <span class="material-icons">group</span>
                            <p>회원 관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../admin/classList">
                            <span class="material-icons">location_city</span>
                            <p>반 관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../admin/childList">
                            <span class="material-icons">face</span>
                            <p>원아 관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../apply/applyList">
                            <span class="material-icons">note_alt</span>
                            <p>온라인접수 관리</p>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- } header end -->

    <!-- main { -->
    <main>
        <div id="container">