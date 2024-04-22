<%@page import = "java.sql.*" contentType="text/html" %>
<%
    String action = request.getParameter("submitBTN");
    if(action.equals("Login")) {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String desig = request.getParameter("Designation");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("select * from Staff where UserName = '"+ username + "' and Password = '"+ pass + "' and Designation = '"+ desig + "'");
            if(res.next()) {
                boolean flag = res.getBoolean("flag");
                String uname = res.getString("Username");
                if(flag == false) {
                    response.sendRedirect("ChangePass.html");
                }
                
                ResultSet res2 = st.executeQuery("select * from Employee where Emp_Id = '"+ username +"'");
                
                if(res2.next()) {
                    // create a session for the username
                    String empname = res2.getString("Emp_Name");
                    
                    session.setAttribute("user",uname);
                    session.setAttribute("empname",empname);
                    session.setAttribute("empdeg",res2.getString("Designation"));
                    session.setAttribute("empdept",res2.getString("Department"));
                    session.setAttribute("empdoj",res2.getString("Date_of_Joining"));
                    session.setAttribute("empdos",res2.getString("Date_of_Service"));
                    
                    
                    if(desig.equals("Lecturer"))
                    {
                        response.sendRedirect("UserDashboard.jsp");
                    }
                    if(desig.equals("HOD"))
                    {
                        response.sendRedirect("HODDashboard.jsp");
                    }
                    if(desig.equals("Principal"))
                    {
                        response.sendRedirect("PrincipalDashboard.jsp");
                    }
                }
                
            
            } else {                
                session.setAttribute("errmessage","Invalid Login Credentials.");
                response.sendRedirect("User.jsp");
            }
        }
        catch(Exception ex){
            out.println(ex);
        }
    }

%>