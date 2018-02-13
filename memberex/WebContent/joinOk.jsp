<%@page import="com.javalec.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dt" class="com.javalec.MemberDTO" />
<jsp:setProperty property="*" name="dt"/>

<%
	MemberDAO dao = MemberDAO.getInstance();
	if(dao.cofirmId(dt.getId()) == MemberDAO.MEMBER_EXISTENT){
%>
<script language="javascript">
	alert("아이디가 이미 존재 합니다.");
	history.back();
</script>
<%
	}else{
		int ri = dao.insertMember(dt);
		if(ri == MemberDAO.MEMBER_JOIN_SUCCESS){
			session.setAttribute("id", dt.getId());
%>
<script language="javascript">
	alert("회원가입을 축하 드립니다.");
	document.location.href="login.jsp";
</script>
<%
		}else{
%>
<script language="javascript">
	alert("회원가입에 실패 했습니다.");
	history.back();
</script>
<%			
		}
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