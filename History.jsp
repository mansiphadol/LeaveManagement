<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<center> <img src="https://gpnashik.ac.in/new-site/images/logo.png" alt="GOVERNMENT POLYTECHNIC NASHIK" width="50%" height="20%"></center><br>
<button onclick="history.back()" style="margin-left: 2%; margin-top: 2%; text-decoration: none;"  class="btn btn-dark"><b>&laquo; Back To DashBoard</b></button>
<%@page import="java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement, java.sql.Connection"%>

<%
    String id = request.getParameter("id");
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "gpn";
    String userId = "root";
    String password = "";

    try {
    Class.forName(driverName);
    } catch (ClassNotFoundException e) {
    e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>      
<%
    try{ 
    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
    statement=connection.createStatement();
    String username=(String )session.getAttribute("user");
    String sql ="SELECT * FROM employee where Emp_ID='"+username+"'";

    resultSet = statement.executeQuery(sql);
    if(resultSet.next()){
        out.println("<h4><center>No. of Medical Leaves Remaining: " + resultSet.getInt("ML")+ "</center></h4>");
        out.println("<h4><center>No. of Casual Leaves Remaining: " + resultSet.getInt("CL") + "</center></h4><br>");
    }

    }
    catch (Exception e) {
    e.printStackTrace();
    }
%>  
    

<!<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        .btn {
           border: none;
           color: white;
           padding: 14px 28px;
           font-size: 16px;
           cursor: pointer;
         }
         .info {background-color: #2196F3;} /* Blue */
         .info:hover {background: #0b7dda;}
         .info:hover{color:white;}

         table {
             font-size:20px;
         }
        </style>
    </head>
    <center><h2>My Leave History<br></h2></center>
    <body style="font-family: 'Times New Roman', Times, serif;">
        <h2 align="center"><font><strong></strong></font></h2>
        <table align="center" cellpadding="8" cellspacing="8" border="1" width="90%">
        <tr>

        </tr>
        <tr bgcolor="LightSkyBlue ">
        <!--<td><center><b>Sr.No</b></center></td>-->
        <td><center><b>Employee ID</b></center></td>
        <td><center><b>Employee Name</b></center></td>
        <td><center><b>Leave Type</b></center></td>
        <td><center><b>Begin Date</b></center></td>
        <td><center><b>End Date</b></center></td>
        <td><center><b>Department</b></center></td>
        <td><center><b>Action</b></center></td>
        <td><center><b>View</b></center></td>


        </tr>
        <%
            try{ 
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
            String username=(String )session.getAttribute("user");
            String sql ="SELECT * FROM employee1 where Employee_ID='"+username+"'";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
        %>
        <tr bgcolor="">

        <!--<td><center><%=resultSet.getString("Sr_No") %></center></td>-->

        <td><center><%=resultSet.getString("Employee_ID") %></center></td>
        <td><center><%=resultSet.getString("Employee_Name") %></center></td>
        <td><center><%=resultSet.getString("Leave_Type") %></center></td>
        <td><center><%=resultSet.getString("begin_date") %></center></td>
        <td><center><%=resultSet.getString("end_date") %></center></td>
        <td><center><%=resultSet.getString("Department") %></center></td>

        <td><center>
        <% 
            String action = resultSet.getString("Action");
                if(action.equals("Approved")) {
                    out.println("<br><p><strong class='text-success'>Approved</strong>");
                }
                if(action.equals("Rejected")) {
                    out.println("<br><strong class='text-danger'>Rejected</strong></p></center>");
                }
                if(action.equals("Forwarded to Principal")) {
                    out.println("<br><strong class='text-primary'>Forwarded to Principal</strong></p></center>");
                }
                if(action.equals("Approved by principal")) {
                    out.println("<br><strong class='text-success'>Approved by Principal</strong></p></center>");
                    
                }
                if(action.equals("Rejected by principal")) {
                    out.println("<br><strong class='text-danger'>Rejected by Principal</strong></p></center>"); 
                }
                if(action.equals("Pending")) {
                    out.println("<br><strong class='text-secondary'>Pending</strong></p></center>"); 
                }
                
        %>
        </td>
        
        <td>
            <a href="ViewLeave.jsp?id=<%=resultSet.getString("Sr_No") %>" class="btn btn-secondary">View</a>
        </td>
        </tr>

        <% 
            }

            } catch (Exception e) {
            e.printStackTrace();
            }
        %>
    </table>    
    </body>
</html>