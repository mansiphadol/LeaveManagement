$(document).ready(function(){ 
    $('#submit').click( 
            function(){ 
        var n= localStorage.setItem("namevalue",name);
        $.ajax({ 
            type : "POST", 
            data : { 
                name1 : n
            }, 
            url : "Apply_marathi.jsp", 
            success : function(resp){ 
                alert(resp); 
            }, 
            error : function(resp){ 
                alert("FAIL"); 
            } 
        }); 
    }); 
}); 