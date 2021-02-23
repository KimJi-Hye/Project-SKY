$(document).ready(function(){

    // header
    // nav
    $(".nav_btn").click(function(){
        $(".navBox").slideToggle();
        $(this).toggleClass("on");
        $(".sub_nav").hide();
    });
    
    $(".main_nav").click(function(e){
        e.preventDefault();
        $(".main_nav").next().hide();
        $(this).next().show();
    });

    $(window).resize(function(){

        if($(window).width() >= 752){
            $(".navBox").show();  
            $(".sub_nav").show();          
        } else {
            $(".navBox").hide();
            $(".sub_nav").hide();
        }
    });

    // pc

});