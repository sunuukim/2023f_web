<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.ChpassDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>Password change</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");
String uid=(String) session.getAttribute("id");

String upw=request.getParameter("pw");
String rupw=request.getParameter("rpw");

ChpassDao dao=new ChpassDao();

if(!dao.passck(upw)&&dao.idck(uid)){
	dao.update(upw,sid);
	out.println("<script>alert('비밀번호가 변경 되었습니다.'); location.href='mypage.jsp';</script>");
    out.flush();
}else{
	out.println("<script>alert('이전 비밀번호와 동일합니다. 다시 설정해 주세요.'); location.href='chpasswd.html';</script>");
    out.flush();
}

%>
</body>
</html>