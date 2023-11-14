<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid=request.getParameter("id");
String sql="DELETE FROM user where id = ?";

Connection conn=ConnectionPool.get();
PreparedStatement stmt=conn.prepareStatement(sql);

stmt.setString(1,uid);

int count=stmt.executeUpdate();
if(count==1) out.print("회원 탈퇴 완료");
else out.print("오류 발생");

stmt.close();
conn.close();
%>
</body>
</html>