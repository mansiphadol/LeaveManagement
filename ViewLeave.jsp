<%@page import="java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement, java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<apex:page applyHtmlTag="false" standardStylesheets="false" showHeader="false" applyBodyTag="false" renderAs="pdf">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <title>Leave Template</title>
        <style>  
            table{
                width:80%;
                margin: 50px auto;
                font-size: 22px; 
                font-family:"Times New Roman",Times,serif;
            }
            #date{
                text-align-last:right;
            }
            #to{
                text-align-last: left;
            }
            #last_part{
                margin-left: 70%;
                
            }
        </style>
    </head>
    <body id="body1" style="font-family:'Times New Roman',Times,serif; border-style: solid; margin: 0.5%; line-height: 35px">
        <input type="button" style="margin-left: 50px; margin-top:10px; font-size:22px;" onclick="return generate()" id="downloadButton" value="Download">
        <script>
            function generate() {
                document.getElementById('downloadButton').style.visibility = 'hidden';
                window.print();   
                document.getElementById('downloadButton').style.visibility = 'visible';
            }
        </script>    

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
            try{ 
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
            String dept = (String) session.getAttribute("empdept");
            int sr = Integer.parseInt(request.getParameter("id"));
            String sql ="SELECT * FROM employee1 where Sr_No = '"+ sr +"'";

            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
        %>
             <!--<buttton><a href="javascript:generate()" id="downloadButton"> Download </a></button><br><br>-->
            <table id="printThis">
                <center>  
                    <div id="img1"> 
                        <img  src="https://gpnashik.ac.in/new-site/images/logo.png" /><br><br>
                    <h2><mark>The application is 
                            <% 
                    String action = resultSet.getString("Action");
                    if(action.equals("Approved")) {
                        out.print("<strong class='text-success'>Approved</strong>");
                    }
                    if(action.equals("Rejected")) {
                        out.print("<strong class='text-danger'>Rejected</strong></center>");
                    }
                    if(action.equals("Forwarded to Principal")) {
                        out.print("<strong class='text-primary'>Forwarded to Principal</strong></center>");
                    }
                    if(action.equals("Approved by principal")) {
                        out.print("<strong class='text-success'>Approved by Principal</strong></center>");

                    }
                    if(action.equals("Rejected by principal")) {
                        out.print("<strong class='text-danger'>Rejected by Principal</strong></center>"); 
                    }
                    %>
                        </mark> </h2>
                    </div></center>
<!--        <table id="printThis">-->

            <tr id="printThis">
                <td id="date" colspan="2">
                    <strong>  Date:</strong>
                 <%=resultSet.getString("Request_Date") %>                   
                <br><br>
                </td>
            </tr>
            
            <tr id="printThis">
                <td id="to">
                    <strong>To,</strong><br>
                    <%=resultSet.getString("To_Whom") %>
                </td>
            </tr>

            <tr id="printThis">
                <td >
                    Government Polytechnic Nashik 
                </td>
            </tr>
             <tr id="printThis">
                <td><br>
                    <strong>Subject:</strong> A letter requesting for 
                    <%=resultSet.getString("Leave_Type") %> leave
                    
                </td>
            </tr>
             <tr>
                <td><br>
                    <strong>Reference:</strong>
                <%=resultSet.getString("Reference") %>
                </td>
            </tr>
            <br>
            <tr>
                <td><br>
                    <strong>Respected sir/madam,</strong>
                   
                    
                </td>
            </tr>
            
            <tr>
                <td id="content1" style="text-align: justify;"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                        
                        
              Myself &nbsp;<strong><%=resultSet.getString("Employee_Name") %> </strong>a <strong><%=resultSet.getString("Designation") %> </strong>from 
             <strong> <%=resultSet.getString("Department") %> department &nbsp;</strong>of <strong>&nbsp; Government Polytechnic Nashik</strong> is writing you  letter, to request you for a<strong> <%=resultSet.getString("Leave_Type") %></strong> leave from
             <strong>  <%=resultSet.getString("Begin_Date") %> to  <%=resultSet.getString("End_Date") %></strong> because of following reasons: &nbsp;<%=resultSet.getString("Reason") %>
   . To make my reason more clear ,  I have attached the reference document.
           
            
                   
                    
                </td>
            </tr>
           <tr>
                <td id="content2" style="text-align: justify;"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;
                    I request you to grant me the leave.
                    I promise you to complete  my scheduled  work before my leave date, as soon as I join I'll work more harder. 
                    Awaiting for your response.
                    <br><br><br>
                </td>
            </tr>
            <tr>
                <td id="last_part" style="line-height: 35px; text-align: right;">
                    <div style="margin-left: 65%; text-align: center; white-space: nowrap;">
                    <strong>Your's sincerely</strong><br>    
                    <%=resultSet.getString("Employee_Name") %><br>
                    <%=resultSet.getString("Designation") %><br>
                    <%=resultSet.getString("Department") %><br>
                    Government Polytechnic Nashik<br>
                    </div>
                </td>
            </tr>
            <b>

       <% 
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
            
        </table>
        <b style='font-size: 26px; margin-left: 10%'>This application is digitally generated, hence it is digitally verified.</b>

</body>
</html>
</apex:page>