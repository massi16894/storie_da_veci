var media = null;
var res = null;
$(document).ready(function(){
     
    $('input[name="submit"]').click(function () {
        $('.media').empty();
        media = $('input[name="media"]').val();
        res = media.replace("watch?v=","embed/");
        $('.media').append('<input type="hidden" name="media-embed" value="' + res + '">');
    });
   
   $('.categoria').click(function() {
        $('.cat').empty();
        id_cat = $(this).children(':selected').attr('id');
        $('.cat').append('<input type="hidden" name="categoria" value="' + id_cat + '">');
    });
   
   
   var titolo_crea = $('#crea input[name="titolo"]');
    
    $(titolo_crea).focusout(function(){
        if(titolo_crea.val()!==""){
            $.ajax({
                type: "POST",
                url: "validatePost",
                data: {titolo: $(titolo_crea).val()},
                success: function(esiste){
                    if(esiste==="true"){
                        $("#title").removeClass("invisibile");
                    } else {
                        $("#title").addClass("invisibile");
                    }
                }
            });
        } else {
            $("#title").addClass("invisibile");
        }
    });
    
    $("#crea").submit(function(event){
        if(!($("#title").hasClass("invisibile"))){
            event.preventDefault();
        }
    });
 });

//$("#login input").focusin($("#login-error").addClass("invisibile"));
