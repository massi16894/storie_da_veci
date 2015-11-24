/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
        $('.data').append('<td class="hdata"><input name="date" value="' + year + '-' + month + '-' + day + '"></td>');
    });
        
});

