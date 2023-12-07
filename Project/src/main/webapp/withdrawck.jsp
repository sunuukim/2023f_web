<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.SignDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="withdrawck.css">
<meta charset="UTF-8">
<title>WithDraw Check</title>
</head>
<body>
<a class=page-hdr>
<%
String sid=(String) session.getAttribute("id");
String upw=request.getParameter("pw");

SignDao dao=new SignDao();

if(dao.exists(sid, upw)){
	dao.delete(sid);
	response.sendRedirect("login.html");
}else out.print("패스워드가 동일하지 않습니다.");
%>
</a><br><br><br><br><br><hr><br>
<form method=post action=withdraw.jsp>
<input type=submit value=돌아가기 class=page-tmenu>
</form>
</body>
</html>