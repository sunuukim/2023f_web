<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.LoginDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid=request.getParameter("id");
String upass=request.getParameter("pw");

LoginDao dao=new LoginDao();

if(dao.exists(uid,upass)){
	session.setAttribute("id",uid);
	response.sendRedirect("mypage.jsp");
}
else out.print("아이디나 패스워드가 틀립니다. 다시 확인해 주세요.");

%>
<form method=post action=login.html>
<br>
<input type=submit value="돌아가기">
</form>
</body>
</html>