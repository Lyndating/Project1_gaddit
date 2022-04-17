$(document).ready(function () {

    /*--Scroll Back to Top Button Show--*/
    $("#back-to-top").fadeOut();
    $(window).scroll(function(){
        if ($(this).scrollTop() > 110) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    
    //Click event scroll to top button jquery
    
    $('#back-to-top').click(function(){
    
        $('html, body').animate({scrollTop : 0},600);
        return false;
    });


    $('select').formSelect();
    M.textareaAutoResize($('#post-content'));

});