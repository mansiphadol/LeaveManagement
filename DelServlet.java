/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")
public class DelServlet extends HttpServlet {
    	
	//create the query
	private static final String DELETE_QUERY ="DELETE FROM EMPLOYEE WHERE Emp_Id=?";
	String DELETE_QUERY1 ="DELETE FROM STAFF WHERE UserName=?";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
		PrintWriter pw = res.getWriter();
		//set Content type
		res.setContentType("text/html");
		
                 String Emp_Id=req.getParameter("Emp_Id");
                 String UserName=req.getParameter("Emp_Id");
                 
		//load the jdbc driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//create the connection
                
           
		try( Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            
		  PreparedStatement ps = con.prepareStatement(DELETE_QUERY);){
			//set the values
			ps.setString(1, Emp_Id);
			
			//execute the query
			int count = ps.executeUpdate();
			 HttpSession session = req.getSession();
			if(count==0) {
                            
                            session.setAttribute("message", "Record not DELETED FROM database");
                            res.sendRedirect("Deleteemp.jsp");
//				pw.println("Record not DELETED FROM database");
			}else {
                            session.setAttribute("message", "Record DELETED FROM Database");
                            res.sendRedirect("Deleteemp.jsp");
//				pw.println("Record DELETED FROM Database");
			}
		}catch(SQLException se) {
			pw.println(se.getMessage());
			se.printStackTrace();
		}catch(Exception e) {
			pw.println(e.getMessage());
			e.printStackTrace();
		}
		try( Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpn","root","");
            
		  PreparedStatement p = cn.prepareStatement(DELETE_QUERY1);){
			//set the values
			p.setString(1, UserName);
			
			//execute the query
			int coun = p.executeUpdate();
			 HttpSession session = req.getSession();
			if(coun==0) {
                            
                            session.setAttribute("message", "Record not DELETED FROM database");
                            res.sendRedirect("Deleteemp.jsp");
//				pw.println("Record not DELETED FROM database");
			}else {
                            session.setAttribute("message", "Record DELETED FROM Database");
                            res.sendRedirect("Deleteemp.jsp");
//				pw.println("Record DELETED FROM Database");
			}
		}catch(SQLException se) {
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

