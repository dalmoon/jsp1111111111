<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="elex.MemberInfo" scope="page"/>
<jsp:setProperty property="name" name="member" value="홍길동"/>
<jsp:setProperty property="id" name="member" value="abcd"/>
<jsp:setProperty property="pw" name="member" value="1234"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <jsp:getProperty property="name" name="member"/>
아이디 : <jsp:getProperty property="id" name="member"/>
비밀번호 : <jsp:getProperty property="pw" name="member"/>
<hr>
이름 : ${member.name }
아이디 : ${member.id }
비밀번호 : ${member.pw }

</body>
</html>