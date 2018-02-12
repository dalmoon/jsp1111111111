<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinOk.jsp" method="post">
	이름 : <input type="text" name="name" size="10"><br>
	아이디 : <input type="text" name="id" size="10"><br>
	비밀번호 : <input type="password" name="pw" size="10"><br>
	비밀번호확인 : <input type="password" name="repw" size="10"><br>
	이메일 : <input type="text" name="email" size="20"><br>
	주소 : <input type="text" name="address" size="50"><br>		
	<input type="submit" value="회원가입"> 
	<input type="reset" value="취소"> 
</form>
</body>
</html>