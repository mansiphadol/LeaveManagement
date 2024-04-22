
package com.servlet.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	//create the query
	private static final String INSERT_QUERY ="INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Designation,Department,Date_of_Joining,Date_of_Service) VALUES(?,?,?,?,?,?)";
	String INSERT_QUERY1 ="INSERT INTO STAFF(UserName,Password,Designation) VALUES(?,?,?)";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
		PrintWriter pw = res.getWriter();
		//set Content type
		res.setContentType("text/hmtl");
		
                 String Emp_Id=req.getParameter("Emp_Id");
                 String Emp_Name=req.getParameter("Emp_Name");
                 String Designation = req.getParameter("Designation");
                 String Department =req.getParameter("Department");
                 String doj =req.getParameter("doj");
                 String dos =req.getParameter("dos");
                 String UserName=req.getParameter("Emp_Id");
                 String Password=req.getParameter("Emp_Id");
                  String Desig = req.getParameter("Designation");
		//load the jdbc driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//create the connection
                
           
		try( Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
           
			PreparedStatement pst = con.prepareStatement(INSERT_QUERY);){
			//set the values
			pst.setString(1, Emp_Id);
			pst.setString(2, Emp_Name);
			pst.setString(3, Designation);
			pst.setString(4, Department);
			pst.setString(5, doj);
			pst.setString(6, dos);
			
			//execute the query
			int count = pst.executeUpdate();
			
			if(count==0) {
                            HttpSession session = req.getSession();
                            session.setAttribute("message", "Record not stored into database");
                            res.sendRedirect("addemp.jsp");
//				pw.println("Record not stored into database");
			}else {
                            HttpSession session = req.getSession();
                            session.setAttribute("message", "Record Stored into Database");
                            res.sendRedirect("addemp.jsp");
//				pw.println("Record Stored into Database");
			}
                      
		}
                 
                  catch(SQLException se) {
			pw.println(se.getMessage());
			se.printStackTrace();
		}catch(Exception e) {
			pw.println(e.getMessage());
			e.printStackTrace();
		}
                
		try( Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
             PreparedStatement p = cn.prepareStatement(INSERT_QUERY1);){
			//set the values
			p.setString(1, UserName);
			p.setString(2, Password);
			p.setString(3, Desig);
               
                   
			//execute the query
			int coun = p.executeUpdate();
			
			if(coun==0) {
                            HttpSession session = req.getSession();
                            session.setAttribute("message", "Record not stored into database");
//                            res.sendRedirect("addemp.jsp");
//				pw.println("Record not stored into database");
			}else {
                            HttpSession session = req.getSession();
                            session.setAttribute("message", "Record Stored into Database");
//                            res.sendRedirect("addemp.jsp");
//				pw.println("Record Stored into Database");
			}
                      
		}
                 
                  catch(SQLException se) {
			pw.println(se.getMessage());
			se.printStackTrace();
		}catch(Exception e) {
			pw.println(e.getMessage());
			e.printStackTrace();
		}
		
		//close the stream
		pw.close();
	}  
        
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}

