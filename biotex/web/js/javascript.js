function modify_normalization(form) 
{
    if(form.measure.value == "C_value") 
    {
            document.getElementById('div_normalisation').style.display = 'none';
            document.getElementById('text_type_source').style.display = 'none';
            document.getElementById('typesource1').checked = true;
    }
    else 
    {
            document.getElementById('div_normalisation').style.display = '';
            document.getElementById('typesource2').checked = true;
            document.getElementById('text_type_source').style.display = '';
    }
}
        
function show_message_doc1(form) 
{
    document.getElementById('text_type_source').style.display = 'none';
}

function show_message_doc2(form) 
{
    document.getElementById('text_type_source').style.display = '';
    
}

function RotateSpinner(spinnerId, up) {
    document.getElementById(spinnerId).value = up?parseInt(document.getElementById(spinnerId).value)+1:parseInt(document.getElementById(spinnerId).value)-1;
}   

$(document).ready(function() {
    // Configure/customize these variables.
    var showChar = 100;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Show more >";
    var lesstext = "Show less";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
});