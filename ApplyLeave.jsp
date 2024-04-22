<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String username = request.getParameter("username");
Connection con = null;
String name = "";
String deg = "";
String dept = "";
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");;
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from Employee where Emp_Id = '" + username + "' ");
    while(rs.next()){
        name = rs.getString("Emp_Name");
        deg = rs.getString("Designation");
        dept = rs.getString("Department");
        response.sendRedirect("LeaveTemplate.html");
        con.close();
    }
}
catch(Exception e){
out.println(e);
}
%>