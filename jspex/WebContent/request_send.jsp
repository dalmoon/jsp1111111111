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
		String age;
		int IAge;
	%>
	<%
		age = request.getParameter("age");
		IAge = Integer.parseInt(age);

		if (IAge >= 20) {
			response.sendRedirect("pass.jsp?age=" + age);
		} else {
			response.sendRedirect("nopass.jsp?age=" + age);
		}
	%>
</body>
</html>