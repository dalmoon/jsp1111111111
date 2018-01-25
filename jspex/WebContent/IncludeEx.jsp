<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 여기는 html 주석입니다. -->
<h1>IncludeEx.jsp Page</h1>
<hr>
<%-- 여기는 jsp 주석입니다. --%>
<%@ include file="a/Include01.jsp" %>
<%@ include file="a/table.jsp" %>
<hr>
<h1>다시 이곳은 IncludeEx.jsp Page</h1>
</body>
</html>