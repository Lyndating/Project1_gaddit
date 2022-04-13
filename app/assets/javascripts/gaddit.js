$(document).ready(function () {

    /*--Scroll Back to Top Button Show--*/
    
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
    
    function readURL() {
        var preview = $("#avatar-img");
        var file = $('input[type=file]').files[0];
        var reader = new FileReader();
        console.log("it's running")
        reader.onloadend = function() {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        }else {
            preview.src = "avatars/G-1.png";
        }
    };
    
});