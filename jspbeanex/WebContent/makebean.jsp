<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.javalec.Student" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:setProperty property="name" name="student" value="홍길동"/>
<jsp:setProperty property="age" name="student" value="13"/>
<jsp:setProperty property="grade" name="student" value="6"/>
<jsp:setProperty property="studentNum" name="student" value="7"/>
<a href="useobject.jsp">go useobject</a><br>
<a href="useobject2.jsp">go useobject2</a>
<!-- jsp:forward page="useobject.jsp" / -->
</body>
</html>