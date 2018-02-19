<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="objelOk.jsp" method="post">
id : <input type="text" name="id"><br>
pw : <input type="password" name="pw"><br>
<input type="submit" value="login">
</form>
<%
	application.setAttribute("app_name", "app_value");
	session.setAttribute("ses_name", "ses_value");
	pageContext.setAttribute("page_name", "page_value");
	request.setAttribute("req_name", "req_value");
%>
<!--<jsp:forward page="reqScope.jsp"></jsp:forward> -->
<hr>
page Scope : ${pageScope.page_name }<br>
request Scope : ${requestScope.req_name }<br>
</body>
</html>