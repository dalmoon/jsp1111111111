<%@page import="com.javalec.MemberDTO"%>
<%@page import="com.javalec.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getMember(id);
	
	String pw = dto.getPw();
	session.setAttribute("pw", pw);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="deleteOk.jsp" method="post" name="reg_frm">
	<input type="hidden" name="id" value="<%=id%>"><br>
	pw : <input type="password" name="pw" size="20"><br>
	<input type="submit" value="탈퇴하기">	
</form>
</body>
</html>