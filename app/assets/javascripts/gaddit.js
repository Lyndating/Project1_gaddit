$(document).ready(function () {
    $('#back-to-top').addClass("hidden");
    /*--Scroll Back to Top Button Show--*/
    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
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