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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
id : <%=id %><br>
pw : <%=pw %><br>
<hr>

id : ${param.id }<br>
pw : ${param.pw }<br>
<hr>
id : ${param["id"] }<br>
pw : ${param["pw"] }<br>
<hr>

app Scope : ${applicationScope.app_name }<br>
ses Scope : ${sessionScope.ses_name }<br>
page Scope : ${pageScope.page_name }<br>
request Scope : ${requestScope.req_name }<br>
<hr>
context 파라미터<br>
${initParam.con_name }<br>
${initParam.con_id }<br>
${initParam.con_pw }<br>
</body>
</html>