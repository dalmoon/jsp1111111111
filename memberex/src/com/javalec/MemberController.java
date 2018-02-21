package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession httpSession;   
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
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setAddress(address);
			Service service = new MembersAllService();
			service.insert(dto);
			response.sendRedirect("login.jsp");
		}else if(command.equals("/login.do")) {
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			Service service = new MembersAllService();
			service.userCheck(id, pw);
			MemberDTO dt = new MemberDTO();
			dt = service.getMember(id);
			String name = dt.getName();
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("name", name);
			httpsession.setAttribute("id", id);
			httpsession.setAttribute("VailiMen", "yes");
			response.sendRedirect("login.jsp");
		}else if(command.equals("/modify.do")) {
			request.setCharacterEncoding("UTF-8");
			httpSession = request.getSession();
			String pw2 = (String)httpSession.getAttribute("pw");
			String pw = request.getParameter("pw");
			if(pw2.equals(pw)) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				String id = (String)httpSession.getAttribute("id");
				MemberDTO dt = new MemberDTO();
				dt.setName(name);
				dt.setEmail(email);
				dt.setAddress(address);
				dt.setId(id);
				Service service = new MembersAllService();
				service.updat(dt);
				response.sendRedirect("login.jsp");
			}	
		}
	}
}
