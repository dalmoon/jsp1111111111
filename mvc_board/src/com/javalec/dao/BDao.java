package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BDao {
	
	DataSource dataSource;
	
	public BDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void write(String bName, String bTitle, String bContent) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "select auto_increment as AI from information_schema.TABLES where TABLE_SCHEMA = 'jspdb' And TABLE_NAME = 'mvc_board'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			int bGroup = 0;
			if(rs.next()) {
				bGroup = rs.getInt("AI");
				System.out.println(bGroup);
			}
			
			sql = "insert into mvc_board(bName, bTitle, bContent, bGroup, bStep, bIndent) values(?,?,?,?,0,0)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bName);
			psmt.setString(2, bTitle);
			psmt.setString(3, bContent);
			psmt.setInt(4, bGroup);
			int rn = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt != null) psmt.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}