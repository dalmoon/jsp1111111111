package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EncodingEx")
public class EncodingEx extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EncodingEx() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");

		String name = request.getParameter("name");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		writer.println("<html><head></head><body>");
		writer.println("이름: " + name + "<br>");
		writer.println("</body></html>");
		
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("이름: " + name + "<br>");
		writer.println("</body></html>");
		
		writer.close();
	}

}
