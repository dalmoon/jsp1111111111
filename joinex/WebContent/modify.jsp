<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	String name, id, pw, phone1, phone2, phone3, gender;
%>
<%
	id = (String)session.getAttribute("id");
	
	String sql = "select * from members where id ='" + id + "'";
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String uid = "root";
	String upw = "mysql";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,uid,upw);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		name = rs.getString("name");
		pw = rs.getString("pw");
		phone1 = rs.getString("phone1");
		phone2 = rs.getString("phone2");
		phone3 = rs.getString("phone3");
		gender = rs.getString("gender");
	}	
%>
<form action="ModifyOk" method="post">
	<input type="hidden" name="id" value="<%=id%>"><br>
	이름 : <input type="text" name="name" size="10" value="<%=name%>"><br>
	아이디 : <%=id%><br>
	비밀번호 : <input type="password" name="pw" size="10"><br>
	전화번호 : <select name="phone1">
				<option value="010">010</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" name="phone2" size="5" value="<%=phone2%>"> - 
			<input type="text" name="phone3" maxlength="4" size="5" value="<%=phone3%>"><br>
	셩별구분 :
			<% if(gender.equals("man")){ %> 
			<input type="radio" name="gender" value="man" checked="checked"> 남 
			<input type="radio" name="gender" value="woman"> 여 <br>
			<%}else{%>
			<input type="radio" name="gender" value="man"> 남 
			<input type="radio" name="gender" value="woman" checked="checked"> 여 <br>
			<%}%>
			<input type="submit" value="정보수정"> 
			<input type="reset" value="취소"> 
</form>






</body>
</html>