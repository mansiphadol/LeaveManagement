<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>GP Nashik</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="Sidebar.css">
    <style>

    #section1 {
        margin-left: 250px;
    }
    #img1 {
        display: block;
        margin-left: auto;
        margin-right: auto;
        height: 25vh;
    }
    #head2 {
        display: flex;
        width: 90%;
        margin-top: 30px;
        margin-left: auto;
        margin-right: auto;
        height: 20vh;
        background: #fff;
        border-radius: 20px;
        box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
    }

    #head2 p {
        font-size: 26px;
        line-height: 30px;
        padding: 3vh;
    }
    
    #head2 img {
        margin-left: 10vw;
        padding: 3vh;
        width: 14vh;
        height: 14vh;
    }
    
    #app {
        font-size: 26px;
        text-align: center;
        margin-top: 4vh;
        margin-left: auto;
        margin-right: auto;
    }
    
    #box {
        font-weight: bold;
        width: 50%;
        margin: 3vh;
        height: 20vh;
        background: #E9AB17;
        color: #00008B;
        opacity: 0.8;
        border-radius: 20px;
        box-shadow: -10px -10px 15px rgba(255,255,255,0.5),
            10px 10px 15px rgba(70,70,70,0.12);
    }
    #container {
        display: flex;
        width : 90%;
        margin-left: auto;
        margin-right: auto;
        padding: 4vh;
    }
    
    #container p {
        font-size: 20px;
        
        text-align: center;
    }
    
    #box p a {
        color: #00008B;
        font-size: 22px;
        line-height: 30px;
    }
    
    #box p a:hover {
        color: white;
       -ms-transform: scale(1.1); /* IE 9 */
        -webkit-transform: scale(1.1); /* Safari 3-8 */
        transform: scale(1.1); 
    }
    </style>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires", "0");//Proxies
        if(session.getAttribute("user") == null) {
            response.sendRedirect("User.jsp");
        }
    %>
    <div class="sidebar">
    <header>Government Polytechnic Nashik</header>
        <ul>
            <li><a href="UserDashboard.jsp"><i class="fas fa-qrcode"></i>User Dashboard</a><li>
            <li><a href="History.jsp"><i class="fas fa-calendar-week"></i>History</a><li>
            <li><a href="EditProfile.jsp"><i class="fas fa-sliders-h"></i>Edit Profile</a></li>
            <li><a href="ChangePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
            <li><a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>       
    </div>
    
    <section id="section1">
        <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png" alt="gpnashik"></header>
        <div id="head2">
            <img src = "user.jpeg" alt="userimg">
            <p>Welcome,<br> ${empname} <br> ${empdeg}, ${empdept} </p>
        </div>
        <div id = "app">APPLICATIONS</div>
        
        <div id = "container">
            <div id="box">
                <h2 style="padding: 2vh; text-align: center;">Apply For Leave</h2>
                <p>
                    <a href="LeaveForm.jsp">In English</a><br>
                    <a href="LeaveForm_mr.jsp">In Marathi</a>
                </p>
            </div>
            <div id="box">
                <h2 style="padding: 2vh; text-align: center;">Others</h2>
                <p>
                    <a href="resignation_form.jsp">Resignation letter :In English</a><br>
                    <a href="resignation_form_mr.jsp">Resignation letter :In Marathi</a><br>
                  <a href="ODform.jsp">Outdoor Duty:In English</a> 
                  <a href="ODform_mr.jsp">Outdoor Duty:In Marathi</a> 
                  
                </p>
            </div>
            <div id="box">
                <h2 style="padding: 2vh; text-align: center;">Apply For Leave</h2>
                <p>
                    <a href="training_per_form.jsp">Training permission : english</a><br>
                    <a href="training_per_form_mr.jsp">Training permission : Marathi</a>
                </p>
            </div>
            <div id="box">
                <h2 style="padding: 2vh; text-align: center;">Apply For Leave</h2>
                <p>
                    <a href="training_comp_form.jsp">Training Completed : english</a><br>
                    <a href="training_comp_form_mr.jsp">Training Completed : Marathi</a>
                </p>
            </div>
        </div>
    </section>
</body>
</html>
