<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.SignDao" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="signup.css">
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>SignUp Error</title>
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

if(dao.exists(uid)){
	out.println("<script>alert('존재하는 계정입니다.'); location.href='signup.html';</script>");
    out.flush();
	return;
}else if(!upass.equals(rupass)){
    out.println("<script>alert('비밀번호가 동일하지 않습니다. 다시 설정해 주세요.'); location.href='signup.html';</script>");
    out.flush();
}else{
	dao.insert(uid,upass,uname,udad,utel);
	out.println("<script>alert('계정이 생성되었습니다.'); location.href='login.html';</script>");
    out.flush();
}

%>
</body>
</html>