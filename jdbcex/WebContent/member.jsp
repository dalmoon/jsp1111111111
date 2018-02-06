<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
	String driver="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String uid = "root";
	String upw = "mysql";
	String sql = "select * from namecard";
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
		connection = DriverManager.getConnection(url);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
			String id = resultSet.getString("idx");
			String name = resultSet.getString("name");
			String pw = resultSet.getString("pw");
			String phone = resultSet.getString("phone");
		
			out.println("idx :" + id + ", name :" + name + ", pw :" + pw + ", phone :" + phone);
		}
	}catch(Exception e){
		out.println("error");
	}finally{
		try{
			if(resultSet != null) resultSet.close();
			if(statement != null) statement.close();
			if(connection != null) connection.close();
		}catch(Exception e){}
	}

%>










</body>
</html>