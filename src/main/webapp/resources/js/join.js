// 회원가입  팝업
var popup = $("#popup");
var popup_m = $(".popup_m");

function popupOn(){
	popup.show();
    popup.addClass("on");
	//setTimeout(popupOff, 5000);
}
function popupOff(){
	popup_m.text("");
    popup.removeClass("on");
    popup.hide();
}

// 회원가입 검사
var id = $("#userId");
var pw = $("#userPw");
var pwCheck = $("#pwCheck");
var uname = $("#userName");
var uphone = $("#userPhone");
var uaddr = $("#userAddr");
var uemail = $("#userEmail");

pwCheck.keyup(function(){
	
	// 비밀번호 일치여부
	if(pw.val() != pwCheck.val()){
		$("#pwLog").text("비밀번호가 일치하지 않습니다.");
        $("#pwLog").addClass("on");
		$(this).focus();
		return false;
	} else {
		$("#pwLog").text("");
        $("#pwLog").removeClass("on");
	}
	
});

// 전송
$("input[type=submit]").click(function(e){
	
	e.preventDefault();
	
	// 아이디 미입력
	if(id.val() == ""){
		popupOn();
		popup_m.text("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	
	// 비밀번호 미입력
	if(pw.val() == ""){
		popupOn();
		popup_m.text("비밀번호를 입력하세요.");
		pw.focus();
		return false;
	}
	
	// 비밀번호 미입력
	if(pw.val() != pwCheck.val()){
		popupOn();
		popup_m.text("비밀번호를 확인하세요.");
		pwCheck.focus();
		return false;
	}
	
	// 이름 미입력
	if(uname.val() == ""){
		popupOn();
		popup_m.text("이름을 입력하세요.");
		uname.focus();
		return false;
	}
	
	// 연락처 미입력
	if(uphone.val() == ""){
		popupOn();
		popup_m.text("연락처를 입력하세요.");
		uphone.focus();
		return false;
	}
	
	// 주소 미입력
	if(uaddr.val() == ""){
		popupOn();
		popup_m.text("주소를 입력하세요.");
		uaddr.focus();
		return false;
	}
	
	// 이메일 미입력
	if(uemail.val() == ""){
		popupOn();
		popup_m.text("이메일을 입력하세요.");
		uemail.focus();
		return false;
	}
	
	$("form").submit();
	
});