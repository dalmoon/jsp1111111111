<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("id") != null){
%>
<jsp:forward page="main.jsp"></jsp:forward>   
<% 	
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.do" method="post">
id : <input type="text" name="id"><br>
pw : <input type="password" name="pw"><br>
<input type="submit" value="로그인">
<input type="button" onclick="window.location='join.jsp';" value="회원가입">
</form>
</body>
</html>