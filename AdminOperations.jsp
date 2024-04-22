<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GP Nashik</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <style> 
    @import url('https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500');
    * {
        padding: 0;
        margin: 0;
        list-style: none;
        text-decoration: none;
    }
    .sidebar {
        font-family: Verdana, sans-serif;
        position: fixed;
        left:0px;
        width: 22vw;
        height: 100%;
        background: #357EC7;
    }
    .sidebar header {
        padding: 10px;
        margin-top: 20px;
        margin-bottom: 40px;
        font-size: 22px;
        color: white;
        text-align: center;
        background: #357EC7;
        user-select: none;
    }
    .sidebar ul a {
        text-decoration: none;
        display: block;
        height: 100%;
        width: 90%;
        line-height: 65px;
        font-size: 22px;
        color: white;
        padding-left: 20px;
        padding-right: 20px;
        margin-bottom:10px;
        box-sizing: border-box;
        border-top: 1px solid rgba(255, 255, 255, .1);
    }

    ul li:hover a {
       background-color: white;
       color: #357EC7;
    }

    .sidebar ul a i {
        margin-right: 16px;
    }
    
    .sidebar img {
        margin-left: auto;
        margin-right: auto;
        display: block;
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
    <div class="sidebar">
        <br><img class="img-fluid" src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" >
        <header>Admin Name<br><small>Designation/Dpt</small></header>
             
        <ul>
            <li><a href="AdminOperations.jsp"><i class="fas fa-qrcode" ></i>Admin</a><li>
            <li><a href="#"><i class="fas fa-sliders-h"></i>Edit Profile</a></li>
            <!--<li><a href="ChangePassword.jsp"><i class="fas fa-key"></i>Change User Password</a></li>-->
            <li><a href="AdminLogout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>
    <center style="margin-left:255px"> <img src="https://gpnashik.ac.in/new-site/images/logo.png" alt="GPN" style = "margin: 25px"></center>
      
    <div class="container admin">
        
            <div class="row mt-3">
            
            <!--first_col, first row-->
            
            <div style="margin-left:355px"class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width:160px; max-height: 100px;" class="img-fluid" src="https://cdn-icons-png.flaticon.com/128/376/376915.png" >
                        </div>
                        
                        <h1 class="text-uppercase text-muted"><a href="addemp.jsp">Add <br>Employee</a></h1>
                    </div>                    
                </div>
            </div>
           
            <!--second_col , first row-->
            
            <div class="col-md-4">
                  <div class="card">
                    <div class="card-body  text-center">
                        <div class="container">
                           <img style="max-width:120px;  max-height: 100px;" class="img-fluid " src="https://t3.ftcdn.net/jpg/04/17/43/66/240_F_417436637_Gunor9TpmXx9LKe4emQxpDMishS9yuV4.jpg" >
                        </div>
                        
                        <h1 class="text-uppercase text-muted"><a href="Deleteemp.jsp">Delete Employee</a></h1>
                    </div>
                  </div>            
            </div>
            </div>
            
         <!--second row-->
         
         <div class="row mt-3">
            
            <!--first_col , second row-->
            
            <div style="margin-left:355px"class="col-md-4">
                
                <!--first box  -->
                
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                             <img style="max-width:140px;" class="img-fluid " src="https://cdn-icons-png.flaticon.com/128/476/476863.png" >
                           </div>
                        <h1 class="text-uppercase text-muted"><a href="updateform.jsp">Update Employee Data</a></h1>
                    </div>                    
                </div>
            </div>
            
            <!--second_col , second row-->
            <div class="col-md-4">
                  <div class="card">
                    <div class="card-body  text-center">
                        <div class="container">
                              <img style="max-width:140px;" class="img-fluid " src="https://cdn-icons-png.flaticon.com/128/476/476863.png" >
                        </div>
                        <h1 class="text-uppercase text-muted"><a href="viewemp.jsp">View All Employees</a></h1>
                    </div>
                  </div>  
                
            </div>
            </div>
            </div>
        
    </body>
</html>