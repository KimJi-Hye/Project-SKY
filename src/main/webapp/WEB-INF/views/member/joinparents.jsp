<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/mem_header.jsp"%>

            <div class="memberBox signup2">
                
                <div class="cardBox join_contents join_contents2">
                    
                    <div class="join_title">
                        <h2>회원가입</h2>
                        <p>STEP 02. 정보 입력</p>
                    </div>
                    <div class="join_con">
                        <form role="form" action="/member/joinparents" method="post">
                            <div class="join_form">
                                <h3>학부모 정보 입력</h3>
                                <ul>
	                                <li class="li_id">
	                                	<label for="userId">아이디</label>
	                                	<input type="text" name="userId" id="userId" class="input_tx" required><button type="button" id="idCheck">중복확인</button>
	                                </li>
                                	<li class="logBox"><span class="b_box"></span><span id="idLog"></span></li>
	                                <li>
	                                	<label for="userPw">비밀번호</label>
	                                	<input type=password name="userPw" id="userPw" class="input_tx" required>
	                                </li>
                                	<li class="logBox"><span class="b_box"></span><span id="pwLog"></span></li>
	                                <li>
	                                	<label for="pwCheck">비밀번호 확인</label>
	                                	<input type="password" name="pwCheck" id="pwCheck" class="input_tx" required>
	                                </li>
                                	<li class="logBox"><span class="b_box"></span><span id="pwChekLog"></span></li>
	                                <li>
	                                	<label for="userName">이름</label>
	                                	<input type="text" name="userName" id="userName" class="input_tx" value="${apply.pname}" required>
	                                </li>
                                	<li class="logBox"><span class="b_box"></span><span id="nameLog"></span></li>
	                                <li>
	                                	<label for="userBirth">생년월일</label>
	               						<fmt:parseDate var="pbirth" value="${apply.pbirth}" pattern="yyyy-MM-dd" />
	                                	<input type="date" name="userBirth" class="input_tx" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pbirth}" />'>
	                                </li>
	                                <li>
	                                	<label for="userPhone">연락처</label>
	                                	<input type="text" name="userPhone" id="userPhone" class="input_tx" value="${apply.phone}" required>
	                                </li>
	                                <li>
	                                	<label for="userAddr">주소</label>
	                                	<input type="text" name="userAddr" id="userAddr" class="input_tx" value="${apply.addr}" required>
	                                </li>
	                                <li>
	                                	<label for="userEmail">이메일</label>
	                                	<input type="text" name="userEmail" id="userEmail" class="input_tx" value="${apply.useremail}" required>
	                                </li>
                                	<li class="logBox"><span class="b_box"></span><span id="emailLog"></span></li>
                                </ul>
                            </div>
                            <div class="join_form join_apply">
                                <h3>원아 접수 정보</h3>
                                <ul>
	                                <li>접수일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${apply.adddate}" /></li>
	                                <li>접수 유형 : <input type="text" name="apptype" value="${apply.apptype }" readonly required></li>
                                </ul>
                            </div>
                            <div class="join_form join_child">
                                <h3>원아 정보 확인</h3>
                                <ul>
                                <li>관계 : <input type="text" name="relation" value="${apply.relation}" readonly required></li>
                                <li>원아 고유번호 : <input type="text" name="cunicode" id="cunicode" value="${apply.cunicode}" readonly></li>
                                <li>원아명 : <c:out value="${apply.cname}" /></li>
                                <li>성별 : <c:out value="${apply.cgender}" /></li>
                                <li>생년월일 : 
                                <fmt:parseDate var="cbirth" value="${apply.cbirth}" pattern="yyyy-MM-dd" />
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${cbirth}" />
                                </li>
                                <li>반이름 : <c:out value="${apply.cclass}" /></li>
                                <li class="join_info">* 원아 정보 상이 시 회원가입 후 원으로 연락 바랍니다^^</li>
                                </ul>
                            </div>
                            <div class="join_btn">
                                <a href="/member/join" class="a_btn">뒤로가기</a>
                                <input type="submit" class="btn_reg" value="회원가입">
                                <input type="reset" class="btn_reset" value="초기화">
                            </div>
                            
                            <input type="hidden" name="auth" value="ROLE_b">
                            <input type="hidden" name="userType" value="P">

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>

                </div>
            </div>
    
    		<div id="popup">
                <div class="popup_bg">
                    <div class="popup_box">
                        <p class="popup_m"></p>
                        <button type="button" class="popup_close">확인</button>
                    </div>
                </div>
            </div>

<script src="/resources/js/join.js"></script>
<script>
   	$(document).ready(function(){
   		
   		// no type
   		var result = '<c:out value="${result}" />';
   		if(result == ''){
   			//location.href="/member/joinType";
   		}
   		
   		// popup
   		popupOff();
   		$(".popup_close").click(function(){
   			popup_m.text("");
   			popupOff();
   		});
   	});
</script>

<%@ include file="../includes/mem_footer.jsp"%>