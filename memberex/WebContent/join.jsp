<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function join_check() {
	var reg_frm = document.reg_frm;
	
	if(reg_frm.id.value.length == 0){
		alert("아이디는 필수 입니다.");
		reg_frm.id.focus();
		return;
	}
	
	if(reg_frm.id.value.length < 4){
		alert("아이디는 4글자 이상 입니다.");
		reg_frm.id.focus();
		return;
	}
	
	if(reg_frm.pw.value.length == 0){
		alert("패스워드는 필수 입니다.");
		reg_frm.pw.focus();
		return;
	}
	
	if(reg_frm.pw.value != reg_frm.pw_check.value){
		alert("비밀번호가 일치 하지 않아요.");
		reg_frm.pw_check.focus();
		return;
	}
	
	if(reg_frm.name.value.length == 0){
		alert("이름은 필수 입니다.");
		reg_frm.name.focus();
		return;
	}
	
	reg_frm.submit();
}


</script>

</head>
<body>
<form action="join.do" method="post" name="reg_frm">
	id : <input type="text" name="id" size="20"><br>
	pw : <input type="password" name="pw" size="20"><br>
	re pw : <input type="password" name="pw_check" size="20"><br>
	name : <input type="text" name="name" size="20"><br>
	email : <input type="text" name="email" size="40"><br>
	address : <input type="text" name="address" size="40"><br>		
	<input type="button" onclick="join_check();" value="회원가입">	
</form>
</body>
</html>