<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <center> <img src="https://gpnashik.ac.in/new-site/images/logo.png" alt="GPN"  ></center><br>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
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

        </style>
    </head>
    
    <body>
        <h2 align="center"><font><strong></strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" width="90%">
<tr>

</tr>
<tr bgcolor="LightSkyBlue ">
 <td><center><b>Sr.No</b></center></td>
<td><center><b>Employee ID</b></center></td>
<td><center><b>Name</b></center></td>
<td><center><b>Designation</b></center></td>
<td><center><b>Department</b></center></td>
<td><center><b>Date Of Joining</b></center></td>
<td><center><b>Date Of Service</b></center></td>
<td><center><b>View</b></center></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="">

    <td><center><%=resultSet.getString("id") %></center></td>

<td><center><%=resultSet.getString("Emp_Id") %></center></td>
<td><center><%=resultSet.getString("Emp_Name") %></center></td>

<td><center><%=resultSet.getString("Designation") %></center></td>
<td><center><%=resultSet.getString("Department") %></center></td>
<td><center><%=resultSet.getString("Date_of_Joining") %></center></td>
<td><center><%=resultSet.getString("Date_of_Service") %></center></td>
<td>
<center><button class="btn info" onclick="location.href='LeaveTemplate.jsp'">View</button></center>
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