<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script> 
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css'>
    
    </head>
    <body>
           
    <%
        String msg = (String) session.getAttribute("message");
        if(msg != null) {
    %>
    <script>
    swal({
      title: "<%= msg%>",
      icon: "success",
      button: "OK"
    });
    </script>

    <%
            session.removeAttribute("message");
        }
    %>
    </body>
</html>
