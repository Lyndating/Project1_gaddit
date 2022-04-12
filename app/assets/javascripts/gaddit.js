$(document).ready(function () {

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

    function readURL() {
        let preview = $("#avatar-img");
        let file = $('input[type=file]').files[0];
        let reader = new FileReader();

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