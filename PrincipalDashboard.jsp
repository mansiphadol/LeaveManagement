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
        margin: 1%;
    }
    #img1 {
        display: block;
        margin-left: auto;
        margin-right: auto;
        height: 25vh;
    }
    #head2 {
        display: flex;
        width: 80%;
        margin-top: 30px;
        margin-bottom: 30px;
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
        text-align: center;
    }
    
    #head2 img {
        margin-left: 10vw;
        padding: 3vh;
        width: 14vh;
        height: 14vh;
    }
    
    #app {
/*        /font-weight: bold;/*/
        font-size: 26px;
        text-align: center;
        margin-top: 4vh;
        margin-left: auto;
        margin-right: auto;
    }
    
    #box {
        font-weight: bold;
        width: 45%;
        margin: 3vh;
        height: 24vh;
        background: #E9AB17;
        color: white;
        opacity: 0.8;
        border-radius: 30px;
        box-shadow: -10px -10px 15px rgba(255,255,255,0.5),
            10px 10px 15px rgba(70,70,70,0.12);
    }
    #container {
        display: flex;
        width : 90%;
        margin-left: auto;
        margin-right: auto;
    }
    
    #container p {
        font-size: 24px;
        padding: 5vh;
        text-align: center;
    }
    
    #box p a {
        color: black;
    }
    
    #box p a:hover {
        color: white;
       -ms-transform: scale(1.1); /* IE 9 */
        -webkit-transform: scale(1.1); /* Safari 3-8 */
        transform: scale(1.1); 
    }
    i {
        padding-bottom: 10px;
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
<!--    <div class="sidebar">
    <header>Government Polytechnic Nashik</header>
        <ul>
           <li><a href = "PrincipalDashboard.jsp"><i class="fas fa-qrcode"></i>User Dashboard</a></li>
            <li><a href="Principal_App_History.jsp"><i class="fas fa-calendar-week"></i>History</li>
            <li><a href="PrincipalApproval.jsp"><i class="fas fa-calendar-week"></i>Employee Applications</li>
            <li><a href= "EditProfile.jsp"><i class="fas fa-sliders-h"></i>Edit Profile</a></li>
            <li><a href="ChangePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
            <li><a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
           </ul>       
    </div>-->
    
    <section id="section1">
        <header id="head1"><img id="img1" src="https://gpnashik.ac.in/new-site/images/logo.png" alt="gpnashik"></header>
        <div id="head2">
            <img src = "user.jpeg" alt="userimg">
            <center><p>Welcome,<br> ${empname} <br> ${empdeg} </p></center>
        </div>

        
        <div id = "container">
            <div id="box"><p><a href="Principal_App_History.jsp"><i class="fas fa-calendar-week"></i><br>Employee History</a></p></div>
            <div id="box"><p><a href="PrincipalApproval.jsp"><i class="fas fa-calendar-week"></i><br>Employee Applications</a></p></div>
            <div id="box"><p><a href= "EditProfile.jsp"><i class="fas fa-sliders-h"></i><br>Edit<br> Profile</a></p></div>
            <div id="box"><p><a href="ChangePassword.jsp"><i class="fas fa-key"></i><br>Change Password</a></p></div>
            <div id="box"><p><a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i><br>Logout</a></p></div>
        </div>
        
    </section>
</body>
</html>