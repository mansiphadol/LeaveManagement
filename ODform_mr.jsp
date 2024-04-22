<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <title>रजेसाठी अर्ज करा</title>
        <!--<meta charset="UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <section id="section1">
    <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png"></header>
    </section>
    <div class="login-container">
        <div class="row">
            <div class="login-form-1">
<!--                <h3>Outdoor duty form </h3> -->
                <h3>आउटडोअर ड्यूटी फॉर्म </h3>

                <form action="odTemplate_mr.jsp" name="lform" method="post" accept-charset="utf-8"> 
                    <div class="form-group">
                        <label>नाव प्रविष्ट करा</label>
                        <input type="text" name="user_name" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>विभाग निवडा</label>
                        <%
                            String dept = "";
                            dept = (String) session.getAttribute("empdept");
                            String deg = "";
                            deg = (String) session.getAttribute("empdeg");
                            if(dept!=null && dept.equals("Computer Technology"))
                            {
                              session.setAttribute("dep", "संगणक तंत्रज्ञान" );
                            }
                            if(dept!=null && dept.equals("Information Technology"))
                            {
                              session.setAttribute("dep", "माहिती तंत्रज्ञान" );
                            }
                            else if(dept!=null && dept.equals("Electrical Engineering"))
                            {
                              session.setAttribute("dep", "विद्युत अभियांत्रिकी" );
                            }
                            else if(dept!=null && dept.equals("Electronics & Telecommunication Engineering"))
                            {
                              session.setAttribute("dep", "इलेक्ट्रॉनिक्स आणि दूरसंचार अभियांत्रिकी" );
                            }
                            else if(dept!=null && dept.equals("Automobile Engineering"))
                            {
                              session.setAttribute("dep", "ऑटोमोबाईल अभियांत्रिकी" );
                            }
                             else if(dept!=null && dept.equals("Mechanical Engineering"))
                            {
                              session.setAttribute("dep", "यांत्रिक अभियांत्रिकी" );
                            }
                             else if(dept!=null && dept.equals("Interior Designing Engineering"))
                            {
                              session.setAttribute("dep", "इंटिरियर डिझायनिंग अभियांत्रिकी" );
                            }
                             else if(dept!=null && dept.equals("Plastic Engineering"))
                            {
                              session.setAttribute("dep", "प्लास्टिक अभियांत्रिकी" );
                            }
                                     //       designation 
                            if( deg!=null && deg.equals("Lecturer") )
                            {
                              session.setAttribute("desig", "व्याख्याता" );
                            }

                            else if(deg!=null && deg.equals("Principal"))
                            {
                             session.setAttribute("desig", "प्राचार्य" );
                            }
                            else if( deg!=null && deg.equals("HOD"))
                            {
                             session.setAttribute("desig", "विभाग प्रमुख" );
                            }
                            else if(deg!=null && deg.equals("Lab Assistant"))
                            {
                             session.setAttribute("desig", "प्रयोगशाळा सहाय्यक" );
                            }
                            else if( deg!=null && deg.equals("Worker"))
                            {
                             session.setAttribute("desig", "कामगार" );
                            }
                        %>

                   
                   
                        <select name="odleave_type" style="width: 100%; padding: 7px 1vw; border:none">
                             <option value="चाचणी">चाचणी   </option>
                            <option value="इलेक्शन ड्युटी"> इलेक्शन ड्युटी </option>
                             <option value="कन्सल्टन्सी"> कन्सल्टन्सी </option>
                              <option value="औद्योगिक भेट">औद्योगिक भेट</option>
                               <option value="शाळा कनेक्ट"> शाळा कनेक्ट </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>प्रारंभ तारीख प्रविष्ट करा </label>
                        <input type="date" name="begin_date" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>समाप्ती तारीख प्रविष्ट करा</label>
                        <input type="date" name="end_date" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>विनंती तारीख प्रविष्ट करा</label>
                        <input type="date" name="req_date" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label>रजेसाठी संदर्भ प्रविष्ट करा</label>
                        <input type="text" name="ref_leave" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>रजेचे कारण प्रविष्ट करा</label>
                        <input type="text" name="reason" class="form-control" />
                    </div>
                    <div style=" width: 50%; border-radius: 1rem; padding: 1%;border: none;cursor: pointer;" class="form-group">
                        <input type="submit" name="submitBTN"  class="btn btn-success" value="प्रस्तुत करणे"/>
                        <input type="reset" name="submitBTN" class="btn btn-danger" value="रीसेट"/>
                    </div>
                </form>
               
            </div>
        </div>
    </div>
</body>
</html>
