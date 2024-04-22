<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Admin</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="template.css">
        <script>
           function validate() {
            var user = document.adminform.username.value;
            var pass = document.adminform.password.value;
            if(user === "") {
                document.getElementById("user_err").innerHTML = "**Username cannot be empty";
                return false;
            } else {
                document.getElementById('user_err').innerHTML = "";
            }
            if(pass === "") {
                document.getElementById("pass_err").innerHTML = "**Password cannot be empty";
                return false;
            } else {
                 document.getElementById("pass_err").innerHTML = "";
            }
        }  
        </script>
    </head>
    <body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires", "0"); //Proxies
    %>
        <%@include file="errormessage.jsp" %>
        <div class="login-container" >
            <div class="row">
                <div class="login-form-1">
                    <h3>Admin Login</h3>
                    <form action = "CheckAdmin" method = "post" onsubmit="return validate()" name="adminform">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username" name="username" />
                            <span id="user_err" style="color:red; font-size:15px;"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" name="password" />
                            <span id="pass_err" style="color:red; font-size:15px;"></span>
                        </div>
                        <div class="form-group">
                            <center>
                            <input type="submit" name = "submitBTN" class="btnSubmit" value="Login" />  <br><br> 
                            <a href="index.html"><input type="button" name = "submitBack" class="btnSubmit" value="Back" /></a>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
