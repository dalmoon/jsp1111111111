package com.javalec;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteOk")
public class DeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection conn;
	private Statement stmt;
	
	HttpSession httpSession;
	
	private String pw, id;
	
    public DeleteOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		httpSession = request.getSession();
		
		pw = request.getParameter("pw");
		id = request.getParameter("id");
		
		if(pwConfirm()) {
			String sql = "delete from members where id = '" + id + "'";
			System.out.println(sql);
			
			try {
				String url = "jdbc:mysql://localhost:3306/jspdb";
				String uid = "root";
				String upw = "mysql";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url,uid,upw);
				stmt = conn.createStatement();
				int i = stmt.executeUpdate(sql);
				if(i == 1) {
					System.out.println("delete success");
					response.sendRedirect("login.html");
				}else {
					System.out.println("delete fail");
					response.sendRedirect("delete.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}else {
			System.out.println("password fail");
			response.sendRedirect("delete.jsp");
		}
	}

	private boolean pwConfirm() {
		boolean rs = false;
		String spw = (String)httpSession.getAttribute("pw");
		if(spw.equals(pw)) {
			rs = true;
		}
		return rs;
	}

}