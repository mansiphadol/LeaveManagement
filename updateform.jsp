<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
        if(request.getParameter("submit") !=null)
        {

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
        pst = con.prepareStatement("insert into employee(Emp_Id,Emp_Name,Designation,Department,Date_of_Joining,Date_of_Service)values(?,?,?,?,?,?)");
        pst.setString(1, Emp_Id);
        pst.setString(2, Emp_Name);
        pst.setString(3, Designation);
        pst.setString(4, Department);
        pst.setString(5, Date_of_Joining);
        pst.setString(5, Date_of_Service); 
        pst.executeUpdate();  

          %>

 <script>  
        alert("Record Adddeddddd");    
    </script>
    <%            
    }
   %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        <h1><center> Edit and Update Employee Information </center></h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
          
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="7px" border="2px" width="100%">
                         <thead>
                             <tr>
                                    <th>Emp ID</th>
                                    <th>Emp Name</th>
                                    <th>Designation</th>
                                     <th>Department</th>
                                      <th>Date Of Joining</th> 
                                      <th>Date Of Service</th>
                                      
                                    <th>Edit</th>
                                    
                             </tr>  
                             
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/gpn","root","");
                                
                                  String query = "select * from employee";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td><%=rs.getString("Emp_Id") %></td>
                                 <td><%=rs.getString("Emp_Name") %></td>
                                 <td><%=rs.getString("Designation") %></td>
                                 <td><%=rs.getString("Department") %></td>
                                 <td><%=rs.getString("Date_of_joining") %></td>
                                 <td><%=rs.getString("Date_of_service") %></td>
                                 <th><a href="update.jsp?id=<%=id%>" style="text-decoration: none; color:blue;">Edit</a></th>
                               
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
             
                                                     
                     </table>    
                 </div>

            </div>  
        </div>

    </body>
</html>