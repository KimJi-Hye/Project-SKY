$(document).ready(function(){

    // header
    // nav
    $(".hd_btn").click(function(){
        var icon = $(this).find("span");
        var nav = $("#nav");
        var con = $("#container");
        var ft = $("#ft");

        if(icon.text() == 'format_indent_decrease'){
            icon.text("format_indent_increase");
            nav.addClass("on");
            con.addClass("on");
            ft.addClass("on");
        } else {
            icon.text("format_indent_decrease");
            nav.removeClass("on");
            con.removeClass("on");
            ft.removeClass("on");
        }

    });

});