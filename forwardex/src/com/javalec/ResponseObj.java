package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResponseObj")
public class ResponseObj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResponseObj() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		String id = (String)request.getAttribute("id");
		String pw = (String)request.getAttribute("pw");
		
		PrintWriter writer = response.getWriter();
		writer.print("id = " + id + ",pw = " + pw);
	}
}
