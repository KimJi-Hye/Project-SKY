<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- ... -->
            
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/kinder.css"> 


    
</head>
<body>

            <div class="boardTitle2">
                <!-- 게시판 제목 -->
                <h3> 오시는 길 </h3>
            </div>
<!--
	* 카카오맵 - 약도서비스
	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="daumRoughmapContainer1614570054100" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1614570054100",
		"key" : "24nb5",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>

</body>
</html>

	<%@include file="../includes/footer.jsp"%>