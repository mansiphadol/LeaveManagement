<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Employee</title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style>
       .login-container{
           display: flex;
            justify-content: center;
            margin-top: 4%;
          
        }
        .login-form-1{
            padding: 5%;
            width : 500px;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
              background-color:buttonface;
        }
        .login-form-1 h3{
            text-align: center;
            color: #333;
        }
        .login-container form{
            padding: 10%;
        }
        .btnSubmit
        {
            width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }
        .login-form-1 .btnSubmit{
            font-weight: 600;
            color: #fff;
            background-color: #0062cc;
        }

        .login-form-1 .ForgetPwd{
            color: #0062cc;
            font-weight: 600;
            text-decoration: none;
        }
         #section1 {
        margin-left: 90px;
    }

    #img1 {
        display: block;
        width: 60%;
        margin-left: auto;
        margin-right: auto;
        height: 19vh;
    }
       </style>
    </head>
    <body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires", "0");//Proxies
        if(session.getAttribute("admin") == null) {
            response.sendRedirect("Admin.jsp");
        }
    %>
         <%@include file="message.jsp" %>
         <section id="section1">
        <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png"></header>
         </section>
        <div class="login-container" >
            <div class="row">
                <div class="login-form-1">
                    <h3>DELETE Employee</h3>
                       <form class="form" action="delete" method="get">
                <div class="form-group">
                        <label><i class="fa fa-address-card  fa-2x"></i> Enter Employee Id : </label>
			<input type="text" name="Emp_Id" class="form-control" required>
		</div>
		
					
<!--  <div style=" width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;" class="form-group">
        <input type="submit" name = "submitBTN" class="btn btn-outline-success" value="Delete" />
        <input type="reset" name = "submitBTN" class="btn btn-outline-danger" value="reset" >
 </div>-->
           <center>          
            <div style=" width: 70%;
            border-radius: 1rem; padding: 3%;border: none;cursor: pointer; display:flex;  text-align: center;" class="form-group">
           
            <input type="submit" name = "submitBTN" class="btn btn-success" value="Delete"/>
            <input type="reset" name = "submitBTN" class="btn btn-danger" value=" Reset" style="margin-left:3%">
            <a href="AdminOperations.jsp"><input type="button" name = "submitBTN" class="btn btn-warning" value=" Back" style="margin-left:14%"/></a>

            </div>
          </center>
        </form>
                </div>
            </div>
        </div>
    </body>
</html>
