import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Apply_mr extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        
        	PrintWriter pw = response.getWriter();
		//set Content type
//		response.setContentType("text/hmtl");
                response.setContentType("text/html;charset=UTF-8");
        
                String INSERT_QUERY ="INSERT INTO EMPLOYEE1(Employee_ID,Employee_Name,Designation,Leave_Type,Request_Date,Begin_Date,End_Date,To_Whom,Reference,Reason,Department) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    
                HttpSession session = request.getSession();
                pw.print(session.getAttribute("reason"));
                String Emp_Id = (String) session.getAttribute("user");
                String Emp_Name = (String) session.getAttribute("uname");
                String Leave = (String) session.getAttribute("type");
                String b_date = (String) session.getAttribute("bdate");
                String e_date = (String) session.getAttribute("edate");
                String Request_date = (String) session.getAttribute("rdate");
                String Department = (String) session.getAttribute("dep");
                String Designation = (String) session.getAttribute("desig");
                String to_whom = (String) session.getAttribute("toW");
                String ref = (String) session.getAttribute("refe");
                String reason = (String) session.getAttribute("reason");
                 
                
                
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		}
                
           
		try( Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
           
			PreparedStatement pst = con.prepareStatement(INSERT_QUERY);){
			//set the values
			pst.setString(1, Emp_Id);
			pst.setString(2,(String) Emp_Name);
                        pst.setString(3, Designation);
			pst.setString(4, Leave);
                        pst.setString(5, Request_date);
                        pst.setString(6, b_date);
                        pst.setString(7, e_date);
                        pst.setString(8, to_whom);
                        pst.setString(9, ref);
                        pst.setString(10, reason);
			pst.setString(11, Department);
			
			//execute the query
                        int count = pst.executeUpdate();
			
			if(count==0) {
//                            session.setAttribute("message", "Leave Applied");
//                            response.sendRedirect("LeaveForm.jsp");
			}	
                        pw.println("<script>alert('Leave Applied');</script>");
                        pw.println("<script>goBack(); function goBack() {window.history.back()}  </script>");
		}
                 
                  catch(SQLException se) {
			pw.println(se.getMessage());
		}catch(Exception e) {
			pw.println(e.getMessage());
		}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}