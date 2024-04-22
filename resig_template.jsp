<%--<%@page import="java.lang.ProcessBuilder.Redirect.to(...)"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import=" java.time.LocalDateTime"%>
<!DOCTYPE html>
<apex:page applyHtmlTag="false" standardStylesheets="false" showHeader="false" applyBodyTag="false" renderAs="pdf">
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
  <%
                   String tow=request.getParameter("To_whom2");
                   session.setAttribute("towhom2",tow);
                   
                  String r=request.getParameter("resig_reason");
                   session.setAttribute("rs",r);
                   
                   
                   
                   
                   

                  
                   %>

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
<html>
    <%
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
   LocalDateTime now = LocalDateTime.now();  
   String a=(dtf.format(now));  
  // session.setAttribute(request.getParameter("r_date"), a);
 // String d= request.getParameter("r_date");
  session.setAttribute("date2", a);

%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Template</title>
        <style>  
            table{
                width:80%;
                margin: 50px auto;
                font-size: 20px; 
                font-family:"Times New Roman",Times,serif;
                line-height: 29px;
/*                border:solid 1px;*/
            }
            #date,#last_part{
                text-align-last:right;
            }
            #to{
                text-align-last: left;
            }
            #last_part{
                text-align: center;
                margin-left: 1000px;
            }
            body{
             border:solid 1px;   
            }
        </style>
    </head>
    <body id="body1">
        <%
        try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
        String toname = (String) session.getAttribute("towhom2");
        String dept= (String) session.getAttribute("empdept");
        String sql = "";
        if(toname != null && toname.equals("Principal")){
             sql ="SELECT * FROM employee where Designation = '"+ toname +"'";
        }
        if(toname != null && toname.equals("HOD")){
             sql ="SELECT * FROM employee where Designation = '"+ toname +"' and Department = '"+ dept +"'";
        }

        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>

        <!--<buttton><a href="javascript:generate()" id="downloadButton"> Download </a></button><br><br>-->
        <table id="printThis">
            <center>  <div id="img1" > <img  src="https://gpnashik.ac.in/new-site/images/logo.png" /></div>
               <h1>  <mark> <strong> RESIGNATION LETTER </strong>  </mark></h1>
            </center>
<!--        <table id="printThis">-->
            <tr id="printThis">
                <td id="date">
                    <strong>  Date:</strong>
                            ${date2}                     
                </td>
            </tr>
            
            <tr id="printThis">
                <td id="to">
                    <strong>    To,</strong><br>
                </td>
            </tr>
            
            <tr>
                <td id="" style="">
                    
                    <%=resultSet.getString("Emp_Name") %>,<br>
                    ${towhom2},
                    <%=resultSet.getString("Department")%>

                </td>
            </tr>
            
           
            <tr id="printThis">
                <td name="nameclg">
<!--                   // Government Polytechnic Nashik -->
                       Government Polytechnic Nashik
                   
                    
                </td>
            </tr>
             <tr id="printThis">
                <td><br>
                    <strong>Subject:</strong> Resignation letter.
                    
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
                        
                        
                        Myself, <strong>${empname} </strong>I am writing you this letter to inform you that I am resigning my position as <strong>${empdeg} in ${empdept}
                            effective from ${date2}.</strong> I am resigning my position because of the following reason : <strong>${rs}</strong> .Thank you for the opportunity to work at 
             Government Polytechnic Nashik.<br><br><br>
            
                   
                    
                </td>
            </tr>
          
            <tr>
                <td style="line-height: 35px; text-align: right;">
                <div style="margin-left: 60%; text-align: center; white-space: nowrap;">
                    <strong>Your's sincerely</strong><br>    
                    ${empname}<br>
                    ${empdeg}<br>
                    ${empdept}<br>
                    Government Polytechnic Nashik<br>
                    </div>
                </td>
            </tr>           
        </table>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js" ></script>  
    
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.2.0/jspdf.umd.min.js"></script>
    
    
    
    <script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="./node_modules/jspdf/dist/jspdf.umd.min.js"></script>
    <script type="text/javascript"
        src="./node_modules/html2canvas/dist/html2canvas.js"></script>
    <script src="assets/js/convert.js"></script> <!--newly added part -->
        <script type="text/javascript">
        async function generate()
        {
               window.print();  
        }
               document.querySelector('#browserPrint').addEventListener('click', downloadPDFWithBrowserPrint); // dialod box opens
              
    
    </script>
     <% 
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
     <center>
            <div style="display: inline-flex;">
           
            <input type="button" style="margin-left: 50px; margin-top:10px; font-size:22px;" onclick="return generate()" id="downloadButton" value="Download">
            </div>
             </center>
</body>
</html>
</apex:page>