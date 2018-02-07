package com.javalec;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection conn;
	private Statement stmt;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
	
	HttpSession httpSession;
	
    public ModifyOk() {
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
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		if(pwConfirm()) {
			
			String sql = "update members set name='" + name 
					+ "', phone1='" + phone1 
					+ "', phone2='" + phone2 
					+ "', phone3='" + phone3 
					+ "', gender='" + gender + "'"
					+ " where id = '" + id + "'";
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
					System.out.println("update success");
					httpSession.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				}else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
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
		}	
	}

	private boolean pwConfirm() {
		boolean rs = false;
		
		String sessionPw = (String)httpSession.getAttribute("pw");
		
		if(sessionPw.equals(pw)) {
			rs = true;
		}
		
		return rs;
	}

}
