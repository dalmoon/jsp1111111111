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
String id;
%>
<%
id = (String)session.getAttribute("id");
%>
<form action="DeleteOk" method="post">
<input type="hidden" name="id" value="<%=id%>"><br>
비밀번호 입력 : <input type="password" name="pw" size="10"><br>
<input type="submit" value="회원탈퇴">
</form>
</body>
</html>