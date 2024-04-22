<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>GP Nashik</title>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
            <li><a href='UserDashboard.jsp'><i class='fas fa-qrcode'></i>Dashboard</a><li>
            <li><a href="EditProfile.jsp"><i class="fas fa-sliders-h"></i>Edit Profile</a></li>
            <li><a href="ChangePassword.jsp"><i class="fas fa-key"></i>Change Password</a></li>
            <li><a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>-->
    

    <section class="section1" style="margin-left: auto; margin-right: auto; display: block">
        <button onclick="history.back()" style="margin-left: 5%; margin-top: 2%; text-decoration: none; width:15%; height:20%" type="button" class="btn btn-dark"><b>&laquo; Back To DashBoard</b></button>
        <div class="container" style='margin-top: -0.5%'>
        <%@include file="message.jsp" %>
        <div class="title">EDIT PROFILE</div>
        <form action="Edit.jsp">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" name="user1" placeholder="Enter Username" value = "${user}" required>
                </div>
                <div class="input-box">
                    <span class="details">Name</span>
                    <input type="text" name="name1" placeholder="Enter your name" value = "${empname}" required>
                </div>
                <div class="input-box">
                    <span class="details">Designation</span>
                    <input type="text" name="desig1" placeholder="Designation" value = "${empdeg}" required>
                </div>
                <div class="input-box">
                    <span class="details">Department</span>
                    <input type="text" name="dept1" placeholder="Department" value = "${empdept}" required>
                </div>
                <div class="input-box">
                    <span class="details">Date of Joining College</span>
                    <input type="date" name="datejoin" placeholder="Enter Date of Joining College" value = "${empdoj}" required/>
                </div>
                <div class="input-box">
                    <span class="details">Date of Joining Service</span>
                    <input type="date" name="dateservice" placeholder="Enter Date of Joining Service" value = "${empdos}" required/>
                </div>
            </div>

            <div class="button">
                <input type="submit" value="Update Details" id="submit1">
            </div>
        </form>
    </div>

    </section>
</body>
</html>