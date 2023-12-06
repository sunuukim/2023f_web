<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.ChpassDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="chpasswd.css">
<meta charset="UTF-8">
<title>Password change</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");

String upass=request.getParameter("pw");
String rupass=request.getParameter("rpw");

ChpassDao dao=new ChpassDao();

if(upass.equals(rupass)){
	if(dao.update(upass,sid)){
		out.print("<a class=page-hdr>");
		out.print("패스워드 변경을 완료 했습니다."+"</a>");
		out.print("<br><br><br><br><br><hr>");
		out.print("<form method=post action=mypage.jsp>");
		out.print("<input type=submit class=page-main value=돌아가기>");
		out.print("</form>");
	}
}else out.print("패스워드를 확인해 주세요.");
%>
</body>
</html>