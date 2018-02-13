package com.javalec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {
		
	}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() {
		Context context = null;
		DataSource ds = null;
		Connection conn = null;
		
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int insertMember(MemberDTO dto) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member (id,pw,name,email,address) values (?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			int rt = pstmt.executeUpdate();
			if(rt == 1) {
				ri = MemberDAO.MEMBER_JOIN_SUCCESS;
			}else {
				ri = MemberDAO.MEMBER_JOIN_FAIL;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int cofirmId(String id) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select id from member where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ri = MemberDAO.MEMBER_EXISTENT;
			}else{
				ri = MemberDAO.MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
}