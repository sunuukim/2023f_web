<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.ChpassDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password change</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");
//session.setAttribute("id",uid);

String upass=request.getParameter("pw");
String rupass=request.getParameter("rpw");

ChpassDao dao=new ChpassDao();

if(upass.equals(rupass)){
	if(dao.update(upass,sid)){
		out.print("패스워드 변경을 완료 했습니다.");
		out.print("<br><br><form method=post action=main.html>");
		out.print("<input type=submit value=돌아가기>");
		out.print("</form>");
	}
}else out.print("패스워드를 확인해 주세요.");
%>
</body>
</html>