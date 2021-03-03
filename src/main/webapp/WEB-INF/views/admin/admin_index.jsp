<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/admin_header.jsp"%>

			<section id="adminPage" class="admin_main">
                <div class="admin_title">
                    <h2>SKY KINDERGARTEN | ADMINISTRATOR</h2>
                </div>
                <div class="admin_contents">
                    <h2><span class="material-icons">info</span> 메뉴를 선택하세요.</h2>
                    <ul class="ulBox">
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
            </section>


<%@ include file="../includes/admin_footer.jsp"%>