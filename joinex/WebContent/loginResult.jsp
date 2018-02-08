<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String name, id, pw;
%>
<%
	name = (String)session.getAttribute("name");
	id = (String)session.getAttribute("id");
	pw = (String)session.getAttribute("pw");
%>

<%=name %>님 안녕하세요.<br>
<hr>
<a href="logout.jsp">로그아웃</a><br>
<a href="modify.jsp">회원정보수정</a><br>
<a href="delete.jsp">회원탈퇴</a>
</body>
</html>