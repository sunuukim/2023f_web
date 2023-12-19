<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.LogoutDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
</head>
<body>
<hr>
<%
String sid=(String) session.getAttribute("id");

LogoutDao dao=new LogoutDao();

session.invalidate();

if(dao.exists(sid)){
	out.println("<script>alert('로그아웃 되셨습니다.'); location.href='mainpage.html';</script>");
	out.flush();
}else{
	out.println("<script>alert('로그인 되어 있는 사용자가 아닙니다.'); location.href='mainpage.html';</script>");
	out.flush();
}

%>
</body>
</html>
