<%@page import="com.javalec.MemberDTO"%>
<%@page import="com.javalec.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO dao = MemberDAO.getInstance();	
	String pw2 = (String)session.getAttribute("pw");
	String pw = request.getParameter("pw");

	if(pw2.equals(pw)){
		String id = (String)session.getAttribute("id");
		MemberDTO dt = new MemberDTO();
		dt.setId(id);
		dao.deleteMember(dt);
%>
	<script language="javascript">
	alert("회원탈퇴에 성공하였습니다.");
	document.location.href="logout.jsp";
	</script>
<%
	}else{
%>	
<script language="javascript">
	alert("회원탈퇴에 실패하였습니다.");
	history.back();
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>