<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname= request.getParameter("name1"); 

    String qry="Insert into clients(Name) values(?)"; 
 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
 
        PreparedStatement ps=con.prepareStatement(qry); 
        ps.setString(1, uname); 
        int yes=ps.executeUpdate(); 
        if(yes==1) 
          out.println("Inserted"); 
        else 
          out.println("Fail"); 

%>