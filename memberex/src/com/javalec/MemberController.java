package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		if(command.equals("/membersAll.do")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<html><head></head><body>");
			
			Service service = new MembersAllService();
			ArrayList<MemberDTO> dtos = service.execute(request, response);
			
			for(int i=0;i<dtos.size();i++) {
				MemberDTO dto = dtos.get(i);
				String id = dto.getId();
				String pw = dto.getPw();
				String name = dto.getName();
				
				write.println(id + "," + pw + "," + name + "<br>");
			}
			write.println("</body></html>");
		}else if(command.equals("/join.do")) {
			request.setCharacterEncoding("utf-8");
			
			Service service = new MembersAllService();
			MemberDTO dt = new MemberDTO();
			service.insert(dt);
		}
	}
}
