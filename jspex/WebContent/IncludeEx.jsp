<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>includeEx.jsp 입니다.</h1>
	<%!
		String id, pw;
	%>
	<%
		id = "testid";
		pw = "testpwd";
	%>
	<jsp:include page="Include01.jsp">
		<jsp:param value="abcde" name="id" />
		<jsp:param value="12345" name="pw" />
	</jsp:include>

	<%@ include file="Include02.jsp"%>

	<h1>다시 include01.jsp 페이지 입니다.</h1>
</body>
</html>