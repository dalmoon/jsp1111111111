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

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement statement;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
		
	String driver="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String uid = "root";
	String upw = "mysql";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request,response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
	
		String sql = "insert into members (name, id, pw, phone1, phone2, phone3, gender)"
				+ "values('" + name + "','" + id + "','" + pw + "','" + phone1 + "','"
				+ phone2 + "','" + phone3 + "','" + gender + "')";
	
		System.out.println(sql);
		
		try{
			Class.forName(driver);
			connection = DriverManager.getConnection(url,uid,upw);
			statement = connection.createStatement();
			int i = statement.executeUpdate(sql);
			
			if(i == 1) {
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			}else {
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}catch(Exception e){}
		}
	}
}
