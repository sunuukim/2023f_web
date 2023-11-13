<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String uid=request.getParameter("id");
String upw=request.getParameter("pw");
String sql="DELETE FROM user where id = ?";

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopingmall","root","1111");
PreparedStatement stmt=conn.prepareStatement(sql);
stmt.setString(1,uid);
stmt.setString(2,upw);

int count=stmt.executeUpdate();
if(count==1) out.print("회원 탈퇴 완료");
else out.print("오류 발생");

stmt.close();
conn.close();
%>
</body>
</html>