<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.SignDao" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="signup.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid=request.getParameter("id");
String upass=request.getParameter("pw");
String rupass=request.getParameter("rpw");
String uname=request.getParameter("na");
String utel=request.getParameter("tel");
String udad=request.getParameter("dad");

SignDao dao=new SignDao();
if(dao.exists(uid,upass)){
	out.print("<a class=page-hdr>");
	out.print("존재하는 아이디 입니다."+"</a>"+"<br><br><br><br><hr>");
	out.print("<form method=post action=signup.html>");
	out.print("<input type=submit class=page-tmenu value=돌아가기>"+"</form>");
	return;
}else if(!upass.equals(rupass)){
	out.print("패스워드가 동일하지 않습니다.");
	out.print("<form method=post action=signup.html>"+"<hr>"+
	"<input type=submit class=page-tmenu value=돌아가기>"+"</form>");
}else{
	dao.insert(uid,upass,uname,utel,udad);
	response.sendRedirect("login.html");
}

%>
</body>
</html>