import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/CheckAdmin"})
public class CheckAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();  
            String action = request.getParameter("submitBTN");
            if(action.equals("Login")) {
                String username = request.getParameter("username");
                String pass = request.getParameter("password");

                try {
                    if(username.equals("Admin") && pass.equals("Admin@123")) {
                        response.sendRedirect("AdminOperations.jsp");
                        session.setAttribute("admin",username);  
                    } 
                    else {
                        session.setAttribute("errmessage","Invalid Login Credentials.");
                        response.sendRedirect("Admin.jsp");
                    }
                }
                catch(Exception ex){
                    out.println(ex);
                }
            }
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
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
