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
var jid = RegExp(/^[a-zA-Z0-9]{4,12}$/);
var jpass = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
var jemail = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
var jnamed = RegExp(/^[가-힣]+$/);

var id = $("#userId");
var pw = $("#userPw");
var pwCheck = $("#pwCheck");
var uname = $("#userName");
var uphone = $("#userPhone");
var uaddr = $("#userAddr");
var uemail = $("#userEmail");

var idPass;
// 아이디 중복 체크
$("#idCheck").click(function(){
   	var idCheck = id.val();
   	if(idCheck == ""){
		popupOn();
		popup_m.text("아이디를 입력하세요.");
   		id.focus();
   		return;
   	}
   	$.ajax({
   		url:'/member/idCheck?userid=' + idCheck,
   		type:'get',
   		contentType: "text/html; charset=utf-8", 
   		dataType: 'text',
   		success:function(data){
   			var data_index = data.charAt(9);
   			//alert(data_index);
   			if(data_index > 0 || idCheck == "admin"){
				popupOn();
				popup_m.text(idCheck + "는 사용할 수 없는 아이디 입니다.");
   				id.focus();
   				idPass = false;
   			} else {
				popupOn();
				popup_m.text("사용 가능한 아이디 입니다.");
   				idPass = true;
   			}
   		}
   	})
});

// 유효성 검사
// #id
id.keyup(function(){

    // 아이디를 정규식을 테스트
    if(!jid.test(id.val())){
        $("#idLog").text("형식에 맞게 입력해주세요");
        $("#idLog").addClass("on");
        id.focus();
        return false;
    } else { // 할당한 경우
        $("#idLog").text("");
        $("#idLog").removeClass("on");
    }

});
// pw
pw.keyup(function(){

    // 아이디와 비밀번호가 동일하게 쓴 경우
    if(id.val() == pw.val()){
        $("#pwLog").text("아이디와 비밀번호가 같습니다");
        $("#pwLog").addClass("on");
        pw.focus();
        return false;
    } else {
        $("#pwLog").text("");
        $("#pwLog").removeClass("on");
	}

    // 비밀번호 정규식으로 테스트
    /*if(!jpass.test(pw.val())){
        $("#pwLog").text("형식에 맞게 입력해주세요");
        $("#pwLog").addClass("on");
        pw.focus();
        return false;
    } else { // 합당한 경우
        $("#pwLog").text("");
        $("#pwLog").removeClass("on");
    }*/

});

pwCheck.keyup(function(){
	
	// 비밀번호 일치여부
	if(pw.val() != pwCheck.val()){
		$("#pwChekLog").text("비밀번호가 일치하지 않습니다.");
        $("#pwChekLog").addClass("on");
		$(this).focus();
		return false;
	} else {
		$("#pwChekLog").text("");
        $("#pwChekLog").removeClass("on");
	}
	
});
// #name
uname.keyup(function(){

    // 이름 유효성 검사
    if(!jnamed.test(uname.val())){
        $("#nameLog").text("이름 형식에 맞게 입력해주세요.");
        $("#nameLog").addClass("on");
        // uname.val("");
        uname.focus();
        return false;
    } else {
        $("#nameLog").text("");
        $("#nameLog").removeClass("on");
    }

});
// #email
uemail.keyup(function(){

    // 이메일 유효성 검사
    if(!jemail.test(uemail.val())){
        $("#emailLog").text("이메일형식에 맞게 입력해주세요.");
        $("#emailLog").addClass("on");
        // uemail.val("");
        uemail.focus();
        return false;
    } else {
        $("#emailLog").text("");
        $("#emailLog").removeClass("on");
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
	
	// 아이디 중복확인
	if(idPass == null){
		popupOn();
		popup_m.text("아이디 중복확인을 해주세요.");
		return false;
	} else if (idPass == false){
		popupOn();
		popup_m.text("아이디 중복확인을 해주세요.");
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
	/*if(mailPass == undefined){
		popupOn();
		popup_m.text("이메일 중복확인을 해주세요.");
 		return false;
	}
	if(mailPass == false){
	 	popupOn();
   		popup_m.text("이메일 중복확인을 해주세요.");
		return false;
	}*/
	
	$("form").submit();
	
});