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
	String sql = "select * from members";
	pstmt = con.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString("id");
		String name = rs.getString("name");
		String gender = rs.getString("gender");
		
		out.println("id = " + id + ", name = " + name + ", gender = " + gender + "<br>"); 
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}catch(Exception e2){
		e2.printStackTrace();
	}
}
%>
</body>
</html>