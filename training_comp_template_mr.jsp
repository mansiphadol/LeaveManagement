<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<apex:page applyHtmlTag="true" standardStylesheets="true" showHeader="true" applyBodyTag="true" renderAs="pdf">
<html>
    <head> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <style media="print">
            @page {
             size: auto;
             margin: 0;
                  }
           </style>
        <style>
            body {
                margin: 3%; 
                border: solid 1px;
            }
            table{
                width:80%;
                margin: 50px auto;
                font-size: 20px; 
                font:justify;
            }
            #date{
                text-align-last:right;
            }
            #to{
                text-align-last: left;
            }
            #content{ 
/*                margin-left: 70px;*/

            }
            #last_part {
/*               // text-align: left;*/
                
/*                display: flex;*/
                 text-align:right ;
                 margin-left: 900px;
            }

            div.chapter {
                page-break-after: always;
            }
            div.titlepage {
                page:blank;
            }
            div.name1 {
                text-align:justify;
                padding-right: 1000px;
              }
        </style>
       
        
    </head>
    <body>
        <% 
            request.setCharacterEncoding("UTF-8");
            String str = "";
//            str = URLDecoder.decode(request.getParameter("user_name"), "UTF-8");
            session.setAttribute("uname", request.getParameter("user_name"));
          //  out.print(session.getAttribute("uname"));
            session.setAttribute("leavetype", request.getParameter("leave_type"));
            
//            String b = URLDecoder.decode(request.getParameter("begin_date"), "UTF-8");
            session.setAttribute("bdate",request.getParameter("begin_date"));
            
//            String e = URLDecoder.decode(request.getParameter("end_date"), "UTF-8");
            session.setAttribute("edate",request.getParameter("end_date"));
            
//            String r = URLDecoder.decode(request.getParameter("req_date"), "UTF-8");
            session.setAttribute("rdate",request.getParameter("req_date"));
            
//            String reff = URLDecoder.decode(request.getParameter("ref_leave"), "UTF-8");
//            String res = URLDecoder.decode(request.getParameter("reason"), "UTF-8");
            session.setAttribute("refe",request.getParameter("ref_leave"));
            session.setAttribute("reason",request.getParameter("reason"));
            session.setAttribute("place",request.getParameter("place"));
            
        %>
      
        <form action="" method="post" style="margin-left: 50px; margin-top: 10px;">
<!--            <input type="submit" id="apply" style="font-size:22px;" value="Apply For Leave">-->
        </form>

        
        <form>

           
        
            
            
            
            
    <center> <br>  <img src="https://gpnashik.ac.in/new-site/images/logo.png" height="150px" width="900px" /></center>
    <div id="table1">
        <table id="printThis">
            <tr>
                <td id="date">
                    <strong> दिनांक :</strong>    ${rdate}   
<!--                    date-->
                <br><br>       
                </td>
            </tr>
            <tr>
                <td id="to">
                    <strong>    प्रति ,</strong><br> 
<!--                    to-->
              विभाग प्रमुख,<br>
               ${dep},<br>
                शासकीय तंत्रनिकेतन नाशिक. <br>
               
                    
              </td>
            </tr>
            
           
             
             <tr>
                <td><br>
                    <strong> विषय:</strong>प्रशिक्षण रजा पूर्ण होण्याबाबाद .
                    
                    
                </td>
            </tr>
             <tr>
                <td><br>
                    <strong>संदर्भ:</strong> ${refe}<br>
              
                   
                    
             <br>  </td>
            </tr>
            
            
            
            <tr>
                <td>
                    <strong>
                        माननीय महोदय/महोदया,
<!--                        Respected sir/madam,-->
                    </strong>
                   
                    
                </td>
            </tr>
            
            <tr>
                <td id="content1" style='text-align: justify'><br>
                   
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                        नमस्कार, माझे नाव <strong>
                            ${uname}</strong> आहे , मी <strong name="part">${dep}</strong> या शाखेत <strong>${desig}</strong> आहे . मला<strong>  ${reason}</strong>, दिनांक<strong> ${bdate}</strong> ते <strong> ${edate} </strong>दिलेली <strong> प्रशिक्षण रजा पूर्ण झाली आहे </strong> .माझे <strong>प्रशिक्षण केंद्र  ${place} होते </strong>. माझे मत स्पष्ट करण्यासाठी मी संदर्भ देखील जोडला आहे .
          
            
                   
                    
                </td>
            </tr>
           <tr>
                <td id="content2"><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                        
                        
                        ही रजा देण्याबद्दल मी तुमचे मनापासून आभार मानते.
                         <br><br>
                   
                    
                </td>
            </tr>
            <tr> 
                <td id="last_part"><br>
                    <strong>
<!--                        Your's sincerely-->
                        आपली/आपला विश्वासू ,
                    </strong><br>
                   
                    
                </td>
            </tr>
             <tr>
                <td id="last_part" name="name1"><br> 
<!--                    <strong>Name:</strong>-->
                    ${uname},<br>
                        ${dep},<br>
                 
                        ${desig},<br>
                         शासकीय तंत्रनिकेतन नाशिक .
               
                   
                    
                </td>
            </tr>
             <tr>
                 <td id="last_part" style="align-self:left"><br>
<!--                    <strong>Designation:</strong>-->
                
            
                   
                    
                </td>
            </tr>
             <tr>
                <td id="last_part"><br>
<!--                    Government Polytechnic Nashik-->
<!--                      //   शासकीय तंत्रनिकेतन नाशिक -->
                    <br><br><br>
                   
                    
                </td>
            </tr>
            <tr>
                <td> 
                    <div id="editor"></div>
                    <button id="hide" onclick="down()">Download</button>

                </td> 
<!-- <input type="button" onclick="printArea('printThis');" id="a"   Value="Print">-->
        </tr>
        </table>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.2.0/jspdf.umd.min.js"></script>
    <script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="./node_modules/jspdf/dist/jspdf.umd.min.js"></script>
    <script type="text/javascript" src="./node_modules/html2canvas/dist/html2canvas.js"></script>
    <script src="assets/js/convert.js"></script>
    <script type="text/javascript">
        
    function down()
    {
//        document.getElementById('hide').style.visibility = 'hidden';
//        document.getElementById('apply').style.visibility = 'hidden';
        window.print();   
    }
    </script>
    </form>
    </body>
</html>
</apex:page>