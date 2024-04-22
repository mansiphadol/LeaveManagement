import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PrincipalDeny")
public class PrincipalDeny extends HttpServlet {

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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Employee1 where Sr_No  =" + sr +"");
            if(rs.next()) {
                    st.executeUpdate("update Employee1 set Action = 'Rejected by principal' where Sr_No =" + sr + "");
                    response.sendRedirect("PrincipalApproval.jsp");
                    con.close();
                } else {
                    response.sendRedirect("PrincipalApproval.jsp");
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