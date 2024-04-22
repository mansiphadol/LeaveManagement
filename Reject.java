import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Reject extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sr = Integer.parseInt(request.getParameter("id"));
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Employee1 where Sr_No  =" + sr +"");
            if(rs.next()) {
                 String Emp_Id =  rs.getString("Employee_Id");
                 String b_date = rs.getString("Begin_Date");
                 String e_date = rs.getString("End_Date");
                 String Leave = rs.getString("Leave_Type");
                 long daysBetween;
                if(e_date != "")  {
                    
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//                    String firstDate=(String) session.getAttribute("bdate");
//                    String secondDate=(String) session.getAttribute("edate");
                    LocalDate date1 = LocalDate.parse(b_date,formatter);
                    LocalDate date2 = LocalDate.parse(e_date,formatter);
                    daysBetween = ChronoUnit.DAYS.between(date1,date2);
                    daysBetween = daysBetween + 1+daysBetween;
                    if(daysBetween == 0) {
                        daysBetween = 1;
                    }
                    if(daysBetween> 0)
                    {
                    pw.println(daysBetween);
                    }
                    else
                    {
                    pw.println(daysBetween*-1);
                    }
                }
                else {
//                    e_date = "---";
                    daysBetween = 1;
                }
                 if(Leave.equals("Casual"))
                {
//                    pw.println("Casual\n");
                    Statement st1 = con.createStatement();
                    ResultSet res = st1.executeQuery("select * from Employee where Emp_Id='"+ Emp_Id +"'");
                    if(res.next()){
                        long n = res.getInt("CL");
//                        pw.println(n);
                        n = n - daysBetween;
                        Statement st2 = con.createStatement();
//                        pw.println(n);
                        st2.executeUpdate("update Employee set CL = " + n + " where Emp_Id='" + Emp_Id +"'");
                    }
                }      
                if(Leave.equals("Medical"))
                {
//                    pw.println("Medical\n");
                    Statement st1 = con.createStatement();
                    ResultSet res = st1.executeQuery("select * from Employee where Emp_Id='"+ Emp_Id +"'");
                    if(res.next()){
                        long n = res.getInt("ML");
//                        pw.println(n);
                        n = n - daysBetween+daysBetween;
                        Statement st2 = con.createStatement();
//                        pw.println(n);
                        st2.executeUpdate("update Employee set ML = " + n + " where Emp_Id='" + Emp_Id +"'");
                    }
                }   
                boolean flag = rs.getBoolean("flag");
                if(flag == false) {
                    st.executeUpdate("update Employee1 set Action = 'Rejected' where Sr_No =" + sr + "");
                    st.executeUpdate("update Employee1 set flag = true where Sr_No =" + sr + "");
                    response.sendRedirect("LeaveApproval.jsp");
                    con.close();
                } else {
                    response.sendRedirect("LeaveApproval.jsp");
                }
            }
        }
        catch(ClassNotFoundException | SQLException e){

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
