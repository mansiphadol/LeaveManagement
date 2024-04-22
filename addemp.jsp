<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style>
       .login-container{
           display: flex;
           justify-content:center;
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
            padding:5%;
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
                    <h3>ADD Employee</h3>
                  
                <form class="form" action="register" method="get">
                <div class="form-group">
                        <label>Enter Employee Id : </label>
			<input type="text" name="Emp_Id" class="form-control" required>
		</div>
		<div class="form-group">
			<label> Enter Employee Name : </label>
			<input type="text" name="Emp_Name" class="form-control" required>
		</div>
		<div class="form-group">
			<label> Enter Designation : </label>
                	<input type="text" name="Designation" class="form-control" required>
		</div>
		<div class="form-group">
			<label>Enter Department : </label>
        		<input type="text" name="Department" class="form-control" required>
		</div>
                <div class="form-group">
			<label> Enter the date of joining : </label>
        		<input type="date" name="doj" class="form-control" required>
		</div>
		<div class="form-group">
			<label> Enter the date of service : </label>
        		<input type="date" name="dos" class="form-control" required>
		</div>	
              <center>          
            <div style=" width: 50%;
            border-radius: 1rem; padding: 3%;border: none;cursor: pointer; display:flex;" class="form-group">
           
            <input type="submit" name = "submitBTN" class="btn btn-success" value="Insert" style="margin-left:5%"/>
            <input type="reset" name = "submitBTN" class="btn btn-danger" value="Reset" style="margin-left:5%">
            <a href="AdminOperations.jsp"><input type="button" name = "submitBack" class="btn btn-warning" value="Back" style="margin-left:5%"/></a>

            </div>
          </center>
        </form>
                </div>
            </div>
        </div>
    </body>
</html>
