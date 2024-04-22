import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

public class Apply extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
        	PrintWriter pw = response.getWriter();
                HttpSession session = request.getSession();
                
//                pw.println(rem);
		//set Content type
		response.setContentType("text/html");
        
                String INSERT_QUERY ="INSERT INTO EMPLOYEE1(Employee_ID,Employee_Name,Designation,Leave_Type,Request_Date,Begin_Date,End_Date,To_Whom,Reference,Reason,Department) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    
                String Emp_Id = (String) session.getAttribute("user");
                String Emp_Name = (String) session.getAttribute("empname");
                String Designation = (String) session.getAttribute("empdeg");
                
                String Leave = (String) session.getAttribute("leavetype");
                String Request_date = (String) session.getAttribute("rdate");
                // pw.println(No_Days);
                String b_date = (String) session.getAttribute("bdate");
                String e_date = (String) session.getAttribute("edate");
                long daysBetween;
                if(e_date != "")  {
                    
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    String firstDate=(String) session.getAttribute("bdate");
                    String secondDate=(String) session.getAttribute("edate");
                    LocalDate date1 = LocalDate.parse(firstDate,formatter);
                    LocalDate date2 = LocalDate.parse(secondDate,formatter);
                    daysBetween = ChronoUnit.DAYS.between(date1,date2);
                    daysBetween = daysBetween + 1;
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
                    e_date = "---";
                    daysBetween = 1;
                }
                String to_whom = (String) session.getAttribute("to");
                String ref = (String) session.getAttribute("reference");
                String reason = (String) session.getAttribute("reason");
                
                String Department = (String) session.getAttribute("empdept");
                 
                try{
                    
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
                
//                if(Leave.equals("Casual"))
//                {
////                    pw.println("Casual\n");
//                    Statement st = con.createStatement();
//                    ResultSet res = st.executeQuery("select * from Employee where Emp_Id='"+ Emp_Id +"'");
//                    if(res.next()){
//                        long n = res.getInt("CL");
////                        pw.println(n);
//                        n = n - daysBetween;
//                        Statement st1 = con.createStatement();
////                        pw.println(n);
//                        st1.executeUpdate("update Employee set CL = " + n + " where Emp_Id='" + Emp_Id +"'");
//                    }
//                }      
//                if(Leave.equals("Medical"))
//                {
////                    pw.println("Medical\n");
//                    Statement st = con.createStatement();
//                    ResultSet res = st.executeQuery("select * from Employee where Emp_Id='"+ Emp_Id +"'");
//                    if(res.next()){
//                        long n = res.getInt("ML");
////                        pw.println(n);
//                        n = n - daysBetween;
//                        Statement st1 = con.createStatement();
////                        pw.println(n);
//                        st1.executeUpdate("update Employee set ML = " + n + " where Emp_Id='" + Emp_Id +"'");
//                    }
//                }      
		try( 
                        
                        
			PreparedStatement pst = con.prepareStatement(INSERT_QUERY);){
			//set the values
			pst.setString(1, Emp_Id);
			pst.setString(2, Emp_Name);
                        pst.setString(3, Designation);
			pst.setString(4, Leave);
                        pst.setString(5, Request_date);
//                        pst.setString(6, No_Days);
                        pst.setString(6,b_date);
                        pst.setString(7, e_date);
                        pst.setString(8, to_whom);
                        pst.setString(9, ref);
                        pst.setString(10, reason);
			pst.setString(11, Department);
			
			//execute the query
                        int count = pst.executeUpdate();
			
			if(count==0) {
                            
			}
//                        session.setAttribute("message", "Leave Applied");
//                        response.sendRedirect("LeaveTemplate.jsp");
                        pw.println("<script>alert('Leave Applied');</script>");
                        pw.println("<script>goBack(); function goBack() {window.history.back()}  </script>");
		}
                 
                  catch(SQLException se) {
			pw.println(se.getMessage());
//			se.printStackTrace();
		}catch(Exception e) {
			pw.println(e.getMessage());
//			e.printStackTrace();
		}
            }
            catch(Exception ex){
            pw.println(ex);
        }              
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}