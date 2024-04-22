<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            ResultSet rs = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            
              try{
                  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");;
                  st = con.createStatement();
                  int sr = Integer.parseInt(request.getParameter("id"));
                  String rm = request.getParameter("remark");
                  out.println(rm);
                  rs = st.executeQuery("select * from employee1 where Sr_No  =" + sr +"");
                  if(rs.next()) {
                    st.executeUpdate("update employee1 set Remark = '"+ rm +"' where Sr_No =" + sr + "");
                    
                      con.close();
                  }
              }
              catch(SQLException e){

           }
        %>
        
        

