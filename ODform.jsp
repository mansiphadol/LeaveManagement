<!DOCTYPE html>
<html>

<head>
    <title>Leave Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
            margin-bottom: 50px;
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
    <button onclick="history.back()" style="margin-left: 5%; margin-top: 2%; text-decoration: none; width:15%; height:20%" type="button" class="btn btn-dark"><b>&laquo; Back To DashBoard</b></button>
        <%
            if(session.getAttribute("user") == null) {
                response.sendRedirect("index.html");
            }
            String no=request.getParameter("No_Days");
            session.setAttribute( "No_Days", no);
        %>
    <section id="section1">
    <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png"></header>
    </section>
    <div class="login-container">
        <div class="row">
            <div class="login-form-1">
                <h3>Outdoor duty DETAILS FORM</h3> 

                <form action="odTemplate.jsp" id="myform" method="post"> 
<!--                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="user_name" value="${empname}" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>Department:</label>
                        <input type="text" name="department" value = "${empdept}" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Designation:</label>
                        <input type="text" name="designation" value = "${empdeg}" class="form-control" required>
                    </div>-->
                    <div class="form-group">
                        <label>To:</label>
                        <input list="To_whom" name="To_whom" placeholder="To_whom" class="form-control" value="HOD" required>
<!--                        <datalist id="To_whom">
                             <option value="Director">Director</option>
                             <option value="Principal"> Principal</option>
                             <option value="HOD"> HOD</option>
                        </datalist>-->
                    </div>
                   


                      <div class="form-group">
                        <label>Select OD Subject:</label>
                        <input list="Leave_type" class="form-control" placeholder="OD subject" name="Leave_type" />
                        <datalist id="Leave_type">
                             <option value="Testing">Testing</option>
                             <option value="Election duty"> Election duty</option>
                             <option value="Consultancy">Consultancy</option>
                              <option value="Industrial Visit">Industrial Visit</option>
                               <option value="School Duty">School Duty</option>
                        </datalist>
                        
                    </div>

                     <div class="form-group">
                        <label>Enter Requesting Date:</label>
                        <input type="date" name="req_date" class="form-control" required/>
                    </div>
<!--                     <div class="form-group">
                        <label>Enter Number Of Days:</label>
                        <input type="text" name="No_Days" class="form-control" required/>
                    </div>-->
                    <div class="form-group">
                        <label>Enter Begin Date:</label>
                        <input type="date" name="begin_date" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>Enter End Date: (Optional Field for One day Leave)</label>
                        <input type="date" name="end_date" class="form-control">
                    </div>
                   
                    <div class="form-group">
                        <label>Enter Reference for Leave:</label>
                        <input type="text" name="ref_leave" placeholder="Enter Reference here" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>Enter Reason for Leave:</label>
                        <input type="text" name="reason" placeholder="Enter Reason here" class="form-control" required/>
                    </div>
                    <div style=" width: 50%; border-radius: 1rem; padding: 1%;border: none;cursor: pointer;" class="form-group">
                        <input type="submit" name="submitBTN" id="submit" class="btn btn-success" value="Apply"/>
                        <input type="reset" name="submitBTN" class="btn btn-danger" value="Reset"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>