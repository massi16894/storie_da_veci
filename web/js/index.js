$(document).ready(function(){
    $("#scroller").simplyScroll();
    
    $("li img").click(function(){
        $( location ).attr("href", "film.jsp?"+$.param({id:$(this).attr("id")}));
    });
});