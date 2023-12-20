<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.LoginDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String ref=(String)request.getHeader("Referer");
String uid=request.getParameter("id");
String upass=request.getParameter("pw");

LoginDao dao=new LoginDao();

if(dao.exists(uid,upass)){
	session.setAttribute("id",uid);
	out.println("<script>alert('로그인 되었습니다. 즐거운 하루 보내십시오.'); location.href='mainpage.jsp';</script>");
	out.flush();
	
}else {
	out.println("<script>alert('아이디 혹은 비밀번호가 틀립니다. 다시 입력해주세요.'); location.href='login.html';</script>");
    out.flush();
}

%>
</body>
</html>