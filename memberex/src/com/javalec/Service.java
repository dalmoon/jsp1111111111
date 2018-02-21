package com.javalec;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response);
	public int insert(MemberDTO dto);
	public int userCheck(String id, String pw);
	public MemberDTO getMember(String id);
	public int updat(MemberDTO dto);
}
