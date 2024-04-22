<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>GP Nashik</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script language="javascript" src="ChangePassVal.js"></script>
    <link rel="stylesheet" href="Sidebar.css">
    <link rel="stylesheet" href="userforms.css">
    <style>
        .container{
            margin-left: auto; 
            margin-right: auto; 
            display: block;
        }
    </style>
</head>

<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires", "0"); //Proxies
        if(session.getAttribute("user") == null) {
            response.sendRedirect("User.jsp");
        }
    %>
<!--    <div class="sidebar">
    <header>Government Polytechnic Nashik</header>
        <ul>
            <li><a href = "UserDashboard.jsp"><i class="fas fa-qrcode"></i>User Dashboard</a><li>
            <li><a href="EditProfile.jsp"><i class="fas fa-sliders-h"></i>Edit Profile</a></li>
            <li><a href="ChangePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
            <li><a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>-->
   
    <section class="section1" style="margin-left: auto; margin-right: auto; display: block">
        <button onclick="history.back()" style="margin-left: 5%; margin-top: 2%; text-decoration: none; width:15%; height:20%" type="button" class="btn btn-dark"><b>&laquo; Back To DashBoard</b></button>
        <div class="container" >
            <%@include file="message.jsp" %>
        <div class="title">CHANGE PASSWORD</div>
        <form action = "ChangePass.jsp" method = "post" class="userform" name="userform" >
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" placeholder="Username" name="username" value="${user}"/>
                    <span id="user_err" style="color:red; font-size:15px;"></span>
                </div>
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" placeholder="New Password" name="newpassword" />
                    <span id="new_err" style="color:red; font-size:15px;"></span>
                </div> 
<!--                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <input type="password" placeholder="Confirm your password" name="confpassword">
                    <span id="pass_err" style="color:red; font-size:15px;"></span>
                </div> -->
            </div>

            <div class="button">
                <input type="submit"  name="submitBTN" class="submitBTN" value="Update Password" onclick="return validate()">
            </div>

        </form>
        </div>

    </section>
</body>

</html>