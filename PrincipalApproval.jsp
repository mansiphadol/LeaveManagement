<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<center> <img src="https://gpnashik.ac.in/new-site/images/logo.png" alt="GOVERNMENT POLYTECHNIC NASHIK" width="60%" height="25%"></center><br>
<a href="PrincipalDashboard.jsp" style="margin-left: 2%; margin-top: 2%; text-decoration: none;"  class="btn btn-dark"><b>&laquo; Back To DashBoard</b></a>
<center><h2>Employee Applications<br></h2></center>
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

         a {
            display: inline-block;
            padding: 8px 16px;
          }

          a:hover {
            background-color: #ddd;
            color: black;
          }

          .previous {
            background-color: #f1f1f1;
            color: black;
          }
          
          table {
            font-size: 20px;
          }
          
          table td {
            width:100px;
            word-wrap:break-word;
          }

        </style>
    </head>
    
    <body style="font-family: 'Times New Roman', Times, serif;">
        <h2 align="center"><font><strong></strong></font></h2>
        <form method="get">
        <table align="center" cellpadding="2" cellspacing="2" border="1" width="95%">
        <tr>

        </tr>
        <tr bgcolor="LightSkyBlue ">
        <!--<td><center><b>Sr_No</b></center></td>-->
        <td><center><b>Emp ID</b></center></td>
        <td><center><b>Emp Name</b></center></td>
        <td><center><b>Leave Type</b></center></td>
        <!--<td><center><b>Department</b></center></td>-->
        <td><center><b>Action</b></center></td>
        <td><center><b>Status</b></center></td>
        <td><center><b>View</b></center></td>

        </tr>
        <%
        try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
        String dept = (String) session.getAttribute("empdept");
        String sql ="SELECT * FROM employee1 where Action='Forwarded to principal' and To_Whom='Principal'";

        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
        <tr bgcolor="">
        <!--<td><center>-->
            <%--<%=resultSet.getString("Sr_No") %>--%>
        <!--</center></td>-->
        <td><center><%=resultSet.getString("Employee_ID") %></center></td>
        <td>
        <center>
            <%=resultSet.getString("Employee_Name") %>
        </center>
        </td>
        <td><center><%=resultSet.getString("Leave_Type") %></center></td>
        <!--<td><center><%=resultSet.getString("Department") %></center></td>-->
  
        <td>
        <center>
        <a href="PrincipalApprove?id=<%=resultSet.getString("Sr_No") %>" class="btn btn-success"  name="app" value="Approve">Approve</a>
        <a href="PrincipalDeny?id=<%=resultSet.getString("Sr_No") %>" class="btn btn-danger" name="deny" value="Reject">Reject</a>
        </center>
        </td>

        <td><center>
        <% 
            String action = resultSet.getString("Action");
                if(action.equals("Approved")) {
                    out.println("<br><p><strong class='text-success'>Approved</strong>");
                }
                if(action.equals("Rejected")) {
                    out.println("<br><strong class='text-danger'>Rejected</strong></p></center>");
                }
                if(action.equals("Pending")) {
                    out.println("<br><strong class='text-black'>Pending</strong></p></center>");
                }
                if(action.equals("Forwarded to Principal")) {
                    out.println("<br><strong class='text-primary'>Forwarded to Principal</strong></p></center>");
                }
                if(action.equals("Approved by principal")) {
                    out.println("<br><strong class='text-success'>Approved by principal</strong></p></center>");
                    
                }
                if(action.equals("Rejected by principal")) {
                    out.println("<br><strong class='text-danger'>Rejected by principal</strong></p></center>");
                    
                }
        %>
        </td>
        <td><center>
            <a href="ViewLeave.jsp?id=<%=resultSet.getString("Sr_No") %>" class="btn btn-secondary">View</a>
        </center></td>

        <% 
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </form>
    </table>
<!--        <div style="margin-top: 30px;">
            <center><a href="Save" class="btn btn-secondary" name="Save" value="Save">Save</a></center>
        </div>-->
    </body>
</html>