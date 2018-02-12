<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection con;
PreparedStatement pstmt;
ResultSet rs;

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jspdb";
String uid = "root";
String upw = "mysql";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName(driver);
	con = DriverManager.getConnection(url, uid, upw);
	String sql = "insert into members (id, pw, name, phone1, phone2, phone3, gender) values (?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, "abc");
	pstmt.setString(2, "1234");
	pstmt.setString(3, "홍길동");
	pstmt.setString(4, "010");
	pstmt.setString(5, "2222");
	pstmt.setString(6, "8888");
	pstmt.setString(7, "man");
	
	int n = pstmt.executeUpdate();
	
	pstmt.setString(1, "def");
	pstmt.setString(2, "1234");
	pstmt.setString(3, "홍길순");
	pstmt.setString(4, "010");
	pstmt.setString(5, "5555");
	pstmt.setString(6, "6666");
	pstmt.setString(7, "woman");
	
	n = pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}finally{
	
}
%>
</body>
</html>