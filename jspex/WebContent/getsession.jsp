<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Object obj1 = session.getAttribute("mySessionName");
		String mySessionName = (String) obj1;

		Object obj2 = session.getAttribute("myNum");
		Integer myNum = (Integer) obj2;
	%>

	mySessionName :
	<%=mySessionName%>
	myNum :
	<%=myNum%>
	<hr>
	<%
		String sName, sValue;
		Enumeration<String> enums = session.getAttributeNames();
		while (enums.hasMoreElements()) {
			sName = enums.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName:" + sName + "<br>");
			out.println("sValue:" + sValue + "<br>");
		}
	%>
	<hr>
	<%
		String sessionId = session.getId();
		out.println("sessionId:" + sessionId + "<br>");
		int sessionInter = session.getMaxInactiveInterval();
		out.println("sessionInter:" + sessionInter + "<br>");

		session.removeAttribute("mySessionName");

		Enumeration<String> renums = session.getAttributeNames();
		while (renums.hasMoreElements()) {
			sName = renums.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName:" + sName + "<br>");
			out.println("sValue:" + sValue + "<br>");
		}

		session.invalidate();

		if (request.isRequestedSessionIdValid()) {
			out.println("session valid");
		} else {
			out.println("session invalid");
		}
	%>
</body>
</html>