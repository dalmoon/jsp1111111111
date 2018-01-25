<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HTML공부</h1>
<h3>HTML TABLE 공부</h3>
<h6>HTML TABLE TR</h6>

<table border="1">
<tr><td colspan="5">구구단</td></tr>
<%
int i,j;
for(i=2;i<=9;i++){
%>
<tr><td colspan="5"><%=i %>단</td></tr>
<%
for(j=1;j<=9;j++){
%>
<tr><td><%=i %></td><td>*</td><td><%=j %></td><td>=</td><td><%=i*j %></td></tr>
<%
}
}
%>
</table>

<table border="1">
<tr><td colspan="3">3 x 3</td></tr>
<tr><th>첫번째</th><th>두번째</th><th>세번째</th></tr>
<tr><td rowspan="3">11</td><td>12</td><td>13</td></tr>
<tr><td>22</td><td>23</td></tr>
<tr><td>32</td><td>33</td></tr>
</table>

<ul>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
</ul>

</body>
</html>