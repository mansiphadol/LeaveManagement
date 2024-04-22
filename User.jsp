<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome User</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="template.css">
       <script language="javascript" src="UserValidate.js"></script>
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
                    <h3>User Login</h3>
                    <form action = "CheckLogin.jsp" method = "post" name="userform" onsubmit="return validate();">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username" name="username" value="" />
                            <span id="user_err" style="color:red; font-size:15px;"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" name="password" />
                            <span id="pass_err" style="color:red; font-size:15px;"></span>
                        </div>
                        <div class="form-group">
                            <input list="Designation" class="form-control" placeholder="Designation" name="Designation" />
                            <datalist id="Designation">
                              <option value="Principal">
                              <option value="HOD">
                              <option value="Lecturer">
                              <option value="Lab Assistant">
                            </datalist>
                            <span id="designation_err" style="color:red; font-size:15px;"></span>
                        </div>
                        <div class="form-group">
                            <center>
                            <input type="submit" name = "submitBTN" class="btnSubmit" value="Login" />  <br><br> 
                            <a href="index.html"><input type="button" name = "submitBack" class="btnSubmit" value="Back" /></a>
                            </center>
                        </div>
                        <div class="form-group">
                            <a href="ChangePass.html" class="ChngPwd">Change Password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>