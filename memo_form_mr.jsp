<!DOCTYPE html>
<html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import=" java.time.LocalDateTime"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
   LocalDateTime now = LocalDateTime.now();  
   String a=(dtf.format(now));  
  // session.setAttribute(request.getParameter("r_date"), a);
 // String d= request.getParameter("r_date");
  session.setAttribute("date", a);
  request.setCharacterEncoding("UTF-8");

%>
<head>
    <title>Leave Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            margin-top: 4%;
        }
        .login-form-1 {
            padding: 5%;
            width: 500px;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            background-color: buttonface;
        }
        .login-form-1 h3 {
            text-align: center;
            color: #333;
        }
        .login-container form {
            padding: 5%;
        }
        .btnSubmit {
            width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }
        .login-form-1 .btnSubmit {
            font-weight: 600;
            color: #fff;
            background-color: #0062cc;
        }
        .login-form-1 .ForgetPwd {
            color: #0062cc;
            font-weight: 600;
            text-decoration: none;
        }
        #section1 {
            margin-left: 90px;
        }
        #img1 {
            display: block;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            height: 19vh;
        }
    </style>
</head>

<body>
       
    <section id="section1">
    <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png"></header>
    </section>
    <button onclick="history.back()" style="margin-left: 5%; margin-top: 1%; text-decoration: none; width:15%; height:20%" type="button" class="btn btn-dark"><b>&laquo; Back To DashBoard</b></button>
    <div class="login-container">
        <div class="row">
            <div class="login-form-1">
                <h3>मेमोरँडम तपशील फॉर्म</h3> 

                <form action="memo_temp_mr.jsp" id="myform" method="post"> 
                    
                    <div class="form-group">
                        <label>प्रति :
</label>
                        <input type="text" name="to_whom" placeholder="To_whom" class="form-control" value="व्याख्याता" required>
                        
                    </div>
                      <div class="form-group">
                        <label>नाव  :
</label>
                        <input type="text" name="name" placeholder="" class="form-control" value="" required>
                        
                    </div>
                    
<!--                      <div class="form-group">
                        <label>विषय: </label> 
                        department
                        <datalist id="memo_type">
                             <option value="Medical">Medical</option>
                             <option value="Casual"> Casual</option>
                        </datalist>
                        
                    </div>-->
                    
                    
                    
                    
                   <div class="form-group">
                        <label> विभाग :</label>
                        <input list="memo_dep" class="form-control" placeholder=""  name="memo_dep" />
                        <datalist id="memo_dep">
                             <option value="संगणक तंत्रज्ञान">संगणक तंत्रज्ञान</option> 
<!--                             cm-->
                             <option value="माहिती तंत्रज्ञान"> माहिती तंत्रज्ञान</option>
<!--                             if-->
                             <option value="विद्युत अभियांत्रिकी"> विद्युत अभियांत्रिकी/option><!-- el comment -->
                             <option value="इलेक्ट्रॉनिक्स आणि दूरसंचार अभियांत्रिकी"> इलेक्ट्रॉनिक्स आणि दूरसंचार अभियांत्रिकी</option><!-- entc -->
                             <option value="ऑटोमोबाईल अभियांत्रिकी"> ऑटोमोबाईल अभियांत्रिकी</option><!-- automobile -->
                              <option value="यांत्रिक अभियांत्रिकी">यांत्रिक अभियांत्रिकी</option> <!-- me -->
                              <option value="इंटिरियर डिझायनिंग अभियांत्रिकी"> इंटिरियर डिझायनिंग अभियांत्रिकी</option><!-- idg -->
                              <option value="प्लास्टिक अभियांत्रिकी">प्लास्टिक अभियांत्रिकी</option><!-- plastic -->
                              
                        </datalist>
                        
                    </div>
                     <div class="form-group">
                        <label>विषय: </label> 
                         <input list="memo_sub" class="form-control" placeholder=""  name="memo_sub" />
                        <datalist id="memo_sub">
                             <option value="वैद्यकीय रजा ">वैद्यकीय रजा </option>
<!--                             medical leave-->
                             <option value="प्रासंगिक रजा "> प्रासंगिक रजा </option>
<!--                             casual leave-->

                        </datalist>
                        
                    </div>
<!--                    <div class="form-group">
                        <label>Enter Requesting Date:</label>
                        <input type="text" name="r_date" class="form-control" value="${date}" required/>
                    </div>
                    <div class="form-group">-->
                    
                    
                    <div style=" width: 50%; border-radius: 1rem; padding: 1%;border: none;cursor: pointer;" class="form-group">
                        <input type="submit" name="submitBTN" class="btn btn-success" value="Apply"/>
                        <input type="reset" name="submitBTN" class="btn btn-danger" value="Reset"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>