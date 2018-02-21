package com.javalec;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MembersAllService implements Service{
	@Override
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = MemberDAO.getInstance();
		
		return dao.getMemberAll();		
	}
	
	@Override
	public int insert(MemberDTO dto) {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.insertMember(dto);
	}
	
	@Override
	public int userCheck(String id, String pw) {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.userCheck(id, pw);
	}
	
	@Override
	public MemberDTO getMember(String id) {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.getMember(id);
	}
	
	@Override
	public int updat(MemberDTO dto) {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.updateMember(dto);
	}
}
