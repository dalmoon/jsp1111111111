<%@page import="com.javalec.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.MemberDAO"%>
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
MemberDAO memberDAO = new MemberDAO();
ArrayList<MemberDTO> dtos = memberDAO.memberSelect();

for(int i = 0; i < dtos.size();i++){
	MemberDTO dto = dtos.get(i);
	
	String name = dto.getName();
	String id = dto.getId();
	String pw = dto.getPw();
	String phone1 = dto.getPhone1();
	String phone2 = dto.getPhone2();
	String phone3 = dto.getPhone3();
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String gender = dto.getGender();

	out.println("이름:" + name + ",아이디:" + id + ",비밀번호" + pw + ",전화번호:" + phone + ",성별:" + gender + "<br>");
}
%>
</body>
</html>