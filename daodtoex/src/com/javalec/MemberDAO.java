package com.javalec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
	
	private String url = "jdbc:mysql://localhost:3306/jspdb";
	private String uid = "root";
	private String upw = "mysql";
	
	public MemberDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> memberSelect(){
		
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from members order by idx desc");
			
			while(rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return dtos;
	}	
}
