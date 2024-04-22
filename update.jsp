<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
        if(request.getParameter("submit") !=null)
        {
            String id = request.getParameter("id");
            String Emp_Id = request.getParameter("eid");
        String Emp_Name = request.getParameter("ename");
        String Designation = request.getParameter("designation");
         String Department = request.getParameter("department");
          String Date_of_Joining = request.getParameter("date_of_joining");
           String Date_of_Service = request.getParameter("date_of_service");
           
           Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gpn","root","");
        pst = con.prepareStatement("update employee set Emp_Id = ? ,Emp_Name = ? ,Designation = ? ,Department = ? ,Date_of_Joining = ? ,Date_of_Service = ? where id=?");
        pst.setString(1, Emp_Id);
        pst.setString(2, Emp_Name);
        pst.setString(3, Designation);
        pst.setString(4, Department);
        pst.setString(5, Date_of_Joining);
        pst.setString(6, Date_of_Service); 
          pst.setString(7, id); 
        pst.executeUpdate();  
       session.setAttribute("message", "Your Details have been Updated Successfully!");
//    response.sendRedirect("update.jsp");
     
    }
   %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>-->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style>
            *{
                align-content: center;
            }
       .login-container{
           margin-left: 170%;
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
        <%@include file="message.jsp" %>
         <section id="section1">
        <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png"></header>
         </section>
         <div class="row">
        
         <div class="col-sm-4">
        <div class="login-container" >
            <div class="row">
                <div class="login-form-1">
                      <h3>Update Employee</h3>

                <form  method="POST" action="#" >
                   
                    <%    
                          Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gpn","root","");
        

        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from employee where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                            %>

                    <div class="form-group">
                        <label >Emp ID</label>
                        <input type="text" class="form-control" placeholder="Emp Id" value="<%=rs.getString("Emp_Id")%>" name="eid" id="eid" required >
                     </div>
                        
                   <div class="form-group">
                        <label >Emp Name</label>
                        <input type="text" class="form-control" placeholder="Emp Name" value="<%=rs.getString("Emp_Name")%>" name="ename" id="ename" required >
                     </div>
                         
                     <div class="form-group">
                        <label >Designation</label>
                        <input type="text" class="form-control" placeholder="Designation" value="<%=rs.getString("Designation")%>" name="designation" id="designation" required >
                     </div>
                   <div class="form-group">
                        <label >Department</label>
                        <input type="text" class="form-control" placeholder="Department" value="<%=rs.getString("Department")%>" name="department" id="department" required >
                     </div>
                    
                    <div class="form-group">
                        <label >Date of Joining</label>
                        <input type="text" class="form-control" placeholder="Date Of Joining" value="<%=rs.getString("Date_of_Joining")%>" name="date_of_joining" id="date_of_joining" required >
                     </div>
                    
                    <div class="form-group">
                        <label >Date of Service</label>
                        <input type="text" class="form-control" placeholder="Date Of Service" value="<%=rs.getString("Date_of_Service")%>" name="date_of_service" id="date_of_service" required >
                     </div>
                       
                            <% }  %>
                            
                            
                            
                         </br>
            <div align="center">
                         <input type="submit" id="submit" value="Submit" name="submit" class="btn btn-success">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-info">
                          <a href="AdminOperations.jsp"><input type="button" name = "submitBack" class="btn btn-warning" value="Back"/></a>

                     </div>           
            
<!--                     
                         
                          <center>          
            <div style=" width: 50%;
            border-radius: 1rem; padding: 3%;border: none;cursor: pointer; display:flex;" class="form-group">
           
            <input type="submit" name = "submitBTN" class="btn btn-success" value="Insert" style="margin-left:5%"/>
            <input type="reset" name = "submitBTN" class="btn btn-danger" value="Reset" style="margin-left:5%">
           
            </div>
          </center>-->
                         
                </form>
            </div>
        
            </div></div>
    
    
    
    </body>
</html>