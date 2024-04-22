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
       request.setCharacterEncoding("UTF-8");
            String str = "";
                   String tow=request.getParameter("To_whom2");
                   session.setAttribute("towhom2",tow);
                   
                  String r=request.getParameter("resig_reason");
                   session.setAttribute("rs",r);
                   
                   String name=request.getParameter("resig_name");
                   session.setAttribute("rname",name);
                   
                   String towhom=request.getParameter("resig_towhom");
                       session.setAttribute("rto",towhom);
                   
                   String desig=request.getParameter("desig_name");
                   session.setAttribute("rdesig", desig);
                   
                   String dept=request.getParameter("r_dep");
                   session.setAttribute("dept", dept);
                   
                   
                   

                  
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
         <script>
                document.getElementById("resig_reason").innerHTML=localStorage.getItem("resignamevalue");
          </script>
        
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
     

        <!--<buttton><a href="javascript:generate()" id="downloadButton"> Download </a></button><br><br>-->
        <table id="printThis">
            <center>  <div id="img1" > <img  src="https://gpnashik.ac.in/new-site/images/logo.png" /></div>
               <h1>  <mark> <strong>राजीनामा पत्र</strong>  </mark></h1>
            </center>
<!--        <table id="printThis">-->
            <tr id="printThis">
                <td id="date">
                    <strong> दिनांक</strong>
                            ${date2}                     
                </td>
            </tr>
            
            <tr id="printThis">
                <td id="to">
                    <strong>    प्रति,</strong><br>
                </td>
            </tr>
            
            <tr>
                <td id="" style="">
                    
<!--                 //   <=resultSet.getString("Emp_Name") %>,<br>-->
                   
                    प्राचार्य,
                 
                    

                </td>
            </tr>
            
           
            <tr id="printThis">
                <td name="nameclg">
<!--                   // Government Polytechnic Nashik -->
                      शासकीय तंत्रनिकेतन नाशिक.
                   
                    
                </td>
            </tr>
             <tr id="printThis">
                <td><br>
                    <strong>विषय:</strong>राजीनामा पत्र
                    
                </td>
            </tr>
            
            <br>
            
            
            <tr>
                <td><br>
                    <strong>आदरणीय सर/मॅडम,</strong>
                   
                    
                </td>
            </tr>
            
            <tr>
                <td id="content1" style="text-align: justify;"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                        
                        
                        नमस्कार, माझे नाव, <strong>${rname} </strong> आहे. मी माझ्या पदाचा राजीनामा देत असल्याची माहिती देण्यासाठी  हे पत्र लिहित आहे. मी <strong>    ${dept} </strong>विभागात <strong>विभाग प्रमुख  </strong>आहे .
                           मी पुढील  कारणामुळे माझ्या पदाचा राजीनामा देत आहे : <strong>${rs}</strong> .शासकीय तंत्रनिकेतन नाशिक मध्ये  काम करण्याची संधी दिल्याबद्दल धन्यवाद 
            .<br><br><br>
            
                   
                    
                </td>
            </tr>
          
            <tr>
                <td style="line-height: 35px; text-align: right;">
                <div style="margin-left: 60%; text-align: center; white-space: nowrap;">
                    <strong> आपली/आपला विश्वासू ,</strong><br>    
                    ${rname}<br>
                   विभाग प्रमुख <br>
                    ${dept}<br>
                      शासकीय तंत्रनिकेतन नाशिक<br>
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
    
        %>
     <center>
            <div style="display: inline-flex;">
           
            <input type="button" style="margin-left: 50px; margin-top:10px; font-size:22px;" onclick="return generate()" id="downloadButton" value="Download">
            </div>
             </center>
</body>
</html>
</apex:page>