<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
    String username = request.getParameter("username");
    String newPass = request.getParameter("newpassword");
    Connection con = null;
    String user = "";
    String action = request.getParameter("submitBTN");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from staff where Username = '" + username + "' ");
        while(rs.next()){
        user = rs.getString("Username");
    } 
    if(user.equals(username)){
        Statement st1 = con.createStatement();
        st1.executeUpdate("update staff set password = '" + newPass + "' where Username = '" + user +"' ");
        st1.executeUpdate("update staff set flag = true where Username = '" + user + "' ");
        
        if(action.equals("Update Password")) {
            session.setAttribute("message","Your password has been changed successfully!");
            response.sendRedirect("ChangePassword.jsp");
            return;
        }
       
        if(action.equals("ChangePassword")) {
            response.sendRedirect("Success.jsp");
        }
        
        st1.close();
        con.close();
    }
    else{
    out.println("Invalid Username");
    }
    }
    catch(Exception e){
    out.println(e);
    }
%>