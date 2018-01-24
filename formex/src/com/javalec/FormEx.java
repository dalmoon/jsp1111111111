package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormEx
 */
@WebServlet("/FormEx")
public class FormEx extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FormEx() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");

		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String[] hobbys = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String protocal = request.getParameter("protocal");
		String hidden = request.getParameter("hidden");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter wirter = response.getWriter();
		wirter.println("<html><head></head><body>");
		wirter.println("이름: " + name + "<br>");
		wirter.println("아이디: " + id + "<br>");
		wirter.println("비밀번호: " + pw + "<br>");
		wirter.println("취미: [");
		for (int i = 0; i < hobbys.length; i++) {
			wirter.println(hobbys[i]);
		}
		wirter.println("]");
		wirter.println("<br>");
		wirter.println("전공: " + major + "<br>");
		wirter.println("프로토콜: " + protocal + "<br>");
		wirter.println("히든값: " + hidden + "<br>");
		wirter.println("</body></html>");

		wirter.close();
	}

}
