var day = 1;
var month = 1;
var year = 1900;
var id_cat = 1;
var media = null;
var res = null;

$(document).ready(function(){
    var pass1 = $("input[name=pass1]");
    var pass2 = $("input[name=pass2]");
    var email_reg = $("#registrazione input[name=email]");
    
    $("form").trigger("reset");
    setInterval(check,100);
    
    function check() {
        if (pass1.val()!==""&&pass2.val()!==""){
            if(pass1.val()!==pass2.val()){
                $("#pass").removeClass("invisibile");
            } else {
                $("#pass").addClass("invisibile");
            }
        }
    }
    
    $(email_reg).keypress(function(){
        $("#email").addClass("invisibile");
    });
    
    $(email_reg).focusout(function(){
        if(email_reg.val()!==""){
            $.ajax({
                type: "POST",
                url: "validate",
                data: {email: $(email_reg).val()},
                success: function(esiste){
                    if(esiste==="true"){
                        $("#email").removeClass("invisibile");
                    } else {
                        $("#email").addClass("invisibile");
                    }
                }
            });
        } else {
            $("#email").addClass("invisibile");
        }
    });
    
    $("#registrazione").submit(function(event){
        if(!($("#email").hasClass("invisibile")&&$("#pass").hasClass("invisibile"))){
            event.preventDefault();
        }
    });
    
    for(var i=1; i<32; i++) {
        $('#day').append("<option>"+ i +"</option>");
    }
    
    for(var i=1; i<13; i++) {
        $('#month').append("<option>"+ i +"</option>");
    }
    
    for(var i=1900; i<1981; i++) {
        $('#year').append("<option>"+ i +"</option>");
    }
    
    $('.birth').click(function() {
        $('.data').empty();
        day = $('#day').val();
        month = $('#month').val();
        year = $('#year').val();
        $('.data').append('<input type="hidden" name="date" value="' + year + '-' + month + '-' + day + '">');
    });
    
    $('.categoria').click(function() {
        $('.cat').empty();
        id_cat = $(this).children(':selected').attr('id');
        $('.cat').append('<input type="hidden" name="categoria" value="' + id_cat + '">');
    });
    
    $('input[name="submit"]').click(function () {
        console.log("ciao");
        $('.media').empty();
        media = $('input[name="media"]').val();
        res = media.replace("watch?v=","embed/");
        $('.media').append('<input type="hidden" name="media-embed" value="' + res + '">');
    });
    
    $('#up-img').fileinput({showCaption: false});
    
    
    
});