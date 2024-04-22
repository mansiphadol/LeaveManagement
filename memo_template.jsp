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
        String tow=request.getParameter("to_whom");
        session.setAttribute("towhom1",tow);
        String mtype=request.getParameter("memo_type");
        session.setAttribute("metype",mtype);
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
       session.setAttribute("date", a);

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Template</title>
        <style>  
            table{
                width:80%;
                margin: 50px auto;
                font-size: 22px; 
                font-family:"Times New Roman",Times,serif;
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
        String dept1 = (String) session.getAttribute("towhom1");
        String dept = (String) session.getAttribute("empdept");
        String sql ="SELECT * FROM employee where Emp_Name = '"+ dept1 +"'";

        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>

      
             <!--<buttton><a href="javascript:generate()" id="downloadButton"> Download </a></button><br><br>-->
            <table id="printThis">
                <center>  <div id="img1"> <img  src="https://gpnashik.ac.in/new-site/images/logo.png" /></div>
                    <h1>  <mark> <strong> MEMORANDUM </strong>  </mark></h1>
                
                </center>
<!--        <table id="printThis">-->
            <tr id="printThis">
                <td id="date">
                    <strong>  Date:</strong>
              ${date}               
            <br>
                </td>
            </tr>
            <tr id="printThis">
                <td id="to">
                    <strong>    To,</strong><br>
                    <strong> ${towhom1}, </strong>
               
                    
                    
                  
                   
                    
              </td>
            </tr>
             <tr>
                 <td id="" style="">
                    
                         <%=resultSet.getString("Designation") %>,<%=resultSet.getString("Department") %>
                    
                </td>
            </tr>
            
           
            <tr id="printThis">
                <td name="nameclg">
<!--                   // Government Polytechnic Nashik -->
                       Government Polytechnic Nashik.
                   
                    
                </td>
            </tr>
             <tr id="printThis">
                <td><br><br>
                    <strong>Subject:</strong> A letter regarding taking  excessive  <strong> ${metype} leaves.</strong>
                    
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
                        
                        
              It has been reported that you are in habit of <strong>taking excessive leaves ${metype} </strong>without giving prior information.Your this action affects our official work,also 
              you are  responsible for not completing target work on stimulated time.
           
            
                   
                    
                </td>
            </tr>
           <tr>
                <td id="content2" style="text-align: justify;"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp;
                        
                        
                        If you will not improve your behaviour <strong> stern action </strong> would be taken against you.This is <strong>last opportunity </strong> for you to improve.
                         <br><br><br><br>
                   
                    
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
            document.getElementById('downloadButton').style.visibility = 'hidden';
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
           
            <input type="button" style="margin-left: 50px; font-size:22px;" onclick="return generate()" id="downloadButton" value="Download">
            </div>
             </center>
</body>
</html>
</apex:page>