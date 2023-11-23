<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.SignDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");

String uid=request.getParameter("id");
SignDao dao=new SignDao();

if(dao.delete(uid)) out.print("회원 탈퇴 완료");
else out.print("회원이 존재하지 않습니다.");
%>
</body>
</html>