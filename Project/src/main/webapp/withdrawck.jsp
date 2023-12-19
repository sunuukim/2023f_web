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
<title>WithDraw Check</title>
</head>
<body>

<%
String sid=(String) session.getAttribute("id");
String upw=request.getParameter("pw");

LoginDao dao=new LoginDao();

if(dao.exists(sid,upw)){
	dao.delete(sid);
	out.println("<script>alert('회원탈퇴 완료'); location.href='mainpage.html';</script>");
	out.flush();
}else {
	out.println("<script>alert('비밀번호가 동일하지 않습니다.'); location.href='withdraw.jsp';</script>");
	out.flush();
}
%>			

</body>
</html>