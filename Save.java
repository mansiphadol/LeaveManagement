import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Save extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            Statement st = con.createStatement();
            HttpSession session = request.getSession();
            String dept = (String) session.getAttribute("empdept");
            ResultSet rs = st.executeQuery("select * from employee1");
            while(rs.next()) {
                    Statement st1 = con.createStatement();
                    st1.executeUpdate("update employee1 set flag = true where Department = '"+ dept +"' AND Action='Approved' OR Action='Rejected'");
                    PrintWriter out = response.getWriter();
                    out.println("<script>goBack(); function goBack() {window.history.back()}  </script>");
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
