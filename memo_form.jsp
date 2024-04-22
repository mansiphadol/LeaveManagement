<!DOCTYPE html>
<html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import=" java.time.LocalDateTime"%>

<%
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
   LocalDateTime now = LocalDateTime.now();  
   String a=(dtf.format(now));  
  // session.setAttribute(request.getParameter("r_date"), a);
 // String d= request.getParameter("r_date");
  session.setAttribute("date", a);

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
                <h3>Memorandum Details Form</h3> 

                <form action="memo_template.jsp" id="myform" method="post"> 
                    
                    <div class="form-group">
                        <label>To:(Name)</label>
                        <input list="To_whom" name="to_whom" placeholder="To_whom" class="form-control" required>
                        
                    </div>
                    
                    
                    
                    <div class="form-group">
                        <label> Subject:</label>
                        <input list="memo_type" class="form-control" placeholder="Subject"  name="memo_type" />
                        <datalist id="memo_type">
                             <option value="Medical">Medical</option>
                             <option value="Casual"> Casual</option>
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