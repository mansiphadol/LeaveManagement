<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<apex:page applyHtmlTag="false" standardStylesheets="false" showHeader="false" applyBodyTag="false" renderAs="pdf">-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <title>training Template</title>
        <style>  
            body {
                margin: 2%; 
                border: solid 1px;
            }
            table{
                width:80%;
                margin: 50px auto;
                font-size: 22px; 
                font-family:"Times New Roman",Times,serif;
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
        </style>
    </head>
    <body id="body1">
        <% 
            session.setAttribute("leavetype", request.getParameter("Leave_type"));
            session.setAttribute("bdate",request.getParameter("begin_date"));
            session.setAttribute("edate",request.getParameter("end_date"));
            session.setAttribute("rdate",request.getParameter("req_date"));
            session.setAttribute("to",request.getParameter("To_whom"));
            session.setAttribute("reference",request.getParameter("ref_leave"));
            session.setAttribute("reason",request.getParameter("reason"));
            session.setAttribute("nod",request.getParameter("No_Days"));
            String rea = (String) session.getAttribute("reason");
           
            
        %>

        
        <center>
            <div style="display: inline-flex;">
            <form action="" method="post" style="margin-left: 50px; margin-top: 10px;">
                <%@include file="message.jsp" %>
<!--            <input type="submit" id='apply' style="font-size:22px;" value="Apply For Leave">-->
            </form>
            <input type="button" id='hide' style="margin-left: 50px; margin-top:10px; font-size:22px;" onclick="return generate()" id="downloadButton" value="Download">
            </div>
        </center>
            <jsp:declaration>
        String username="";
        String to="";
        String place="";
        String request_date="";
        String reference="";
        String desig="";
        String dept="";
        String from_d="";
        String to_d="";
      //  String lreason="";
        
    </jsp:declaration>
    <jsp:scriptlet> 
        username = request.getParameter("user_name");
        to = request.getParameter("To_whom");
        place = request.getParameter("place"); 
        
        
        request_date = request.getParameter("req_date");
        reference = request.getParameter("ref_leave");
        desig = request.getParameter("designation");
        dept = request.getParameter("department");
        from_d = request.getParameter("begin_date");
        to_d = request.getParameter("end_date");
      //  lreason = request.getParameter("reason");
        
        
        
        
        </jsp:scriptlet>
             <!--<buttton><a href="javascript:generate()" id="downloadButton"> Download </a></button><br><br>-->
            <table id="printThis">
                <center>  <div id="img1"> <img  src="https://gpnashik.ac.in/new-site/images/logo.png" /></div></center>
<!--        <table id="printThis">-->
            <tr id="printThis">
                <td id="date">
                    <strong>  Date:</strong>
                 <jsp:expression> request_date </jsp:expression> <br>                        
                </td>
            </tr>
            <tr id="printThis">
                <td id="to">
                    <strong>    To,</strong><br>
              HOD,<br>
              ${empdept}, <br>
               
              </td>
            </tr>
            
            
           
            <tr id="printThis">
                <td >
                    Government Polytechnic Nashik 
                </td>
            </tr>
             <tr id="printThis">
                <td><br>
                    <strong>Subject:</strong> A letter regarding completion of training.
                </td>
            </tr>
             <tr>
                <td><br>
                    <strong>Reference:</strong>
                <jsp:expression> reference </jsp:expression>
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
                        
                        
              Myself &nbsp;<strong>${empname} </strong>a <strong>${empdeg} </strong>from 
             <strong> ${empdept} department&nbsp;</strong>of <strong>&nbsp;Government Polytechnic Nashik </strong> is writing you  letter, to inform you that I have completed  <strong>training  </strong> at <jsp:expression> place </jsp:expression>
             <b>
             <%
                 if(to_d != "" && from_d != "") {
                     out.println(" from " + from_d + " to " + to_d);
                 }
                 else {
                    if(to_d == "") {
                        out.println(" on " + from_d);
                    }
                 }
             %>
             </b> 
           
   . To make my reason more clear ,  I have attached the reference document.
           
            
                   
                    
                </td>
            </tr>
           <tr>
                <td id="content2" style="text-align: justify;"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp;
                        
                        
                         I would like to convey my sincere gratitude for giving me the permission for the training.
                         <br><br><br>
                   
                    
                </td>
            </tr>
            <tr>
                <td id="last_part"><br>
                    <strong>Your's sincerely</strong><br>
                   
                    
                </td>
            </tr>
             <tr>
                <td id="last_part"><br>
                    ${empname}
                </td>
            </tr>
             <tr>
                 <td id="last_part" style="text-align:justify"><br>
                     ${empdeg},
                     ${empdept}
                    
                </td>
            </tr>
             <tr>
                <td id="last_part"><br>
                    Government Polytechnic Nashik<br><br><br>
                   
                    
                </td>
            </tr>
            <tr>
                <td> 

        </tr>
             
            
        </table>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js" ></script>        
    <script type="text/javascript">
    function generate()
    {

        window.print();


    
    }
    </script>
</body>
</html>