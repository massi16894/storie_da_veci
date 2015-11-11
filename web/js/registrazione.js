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
    
    $("form").submit(function(event){
        if(!($("#email").hasClass("invisibile")&&$("#pass").hasClass("invisibile"))){
            event.preventDefault();
        }
    });
});