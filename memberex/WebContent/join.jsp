<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinOk.jsp" method="post" name="reg_frm">
	id : <input type="text" name="id" size="20"><br>
	pw : <input type="password" name="pw" size="20"><br>
	re pw : <input type="password" name="pw_check" size="20"><br>
	name : <input type="text" name="name" size="20"><br>
	email : <input type="text" name="email" size="40"><br>
	address : <input type="text" name="address" size="40"><br>		
	<input type="submit" value="회원가입">
</form>
</body>
</html>