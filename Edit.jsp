<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String user = (String) session.getAttribute("user");
String n = request.getParameter("name1");
String deg1 = request.getParameter("desig1");
String dept1 = request.getParameter("dept1");
String doj1 = request.getParameter("datejoin");
String dos1 = request.getParameter("dateservice");

Connection con = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");;
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from Employee where Emp_Id = '" + user + "' ");
    if(rs.next()){
    Statement st1 = con.createStatement();
    st1.executeUpdate("update Employee set Emp_Name = '" + n + "' , Designation = '"+ deg1 + "' , Department = '" + dept1 + "' , Date_of_Joining = '" + doj1 + "' , Date_of_Service = '" + dos1 +"' where Emp_Id = '" + user +"' ");
    session.setAttribute("empname", n);
    session.setAttribute("empdeg",deg1);
    session.setAttribute("empdept",dept1);
    session.setAttribute("empdoj",doj1);
    session.setAttribute("empdos",dos1);
    
    session.setAttribute("message", "Your Details have been Updated Successfully!");
    response.sendRedirect("EditProfile.jsp");
    st1.close();
    con.close();
}
}
catch(Exception e){
out.println(e);
}
%>