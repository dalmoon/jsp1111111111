<%@page import="com.javalec.MemberDTO"%>
<%@page import="com.javalec.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	int checkNum = dao.userCheck(id, pw);
	if(checkNum == -1){
%>
<script language="javascript">
	alert("아이디가 존재 하지 않습니다.");
	history.back();
</script>
<% 		
	}else if(checkNum == 0) {
%>		
<script language="javascript">
	alert("비밀번호가 틀렸습니다.");
	history.back();
</script>
<% 		
	}else if(checkNum == 1){
	
	MemberDTO dto = dao.getMember(id);
	
	if(dto == null){
%>	
<script language="javascript">
	alert("존재하지 않는 회원입니다.");
	history.back();
</script>
<%
}else{
	id = dto.getId();
	String name = dto.getName();
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("VailiMen", "yes");
	response.sendRedirect("main.jsp");
}
}
%>