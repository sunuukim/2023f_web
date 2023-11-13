<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password change</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String upw=request.getParameter("pw");
String sql="UPDATE user set pw= ?";

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopingmall","root","1111");
PreparedStatement stmt=conn.prepareStatement(sql);
stmt.setString(1,upw);

int count=stmt.executeUpdate();
if(count==1) out.print("패스워드 변경 완료");
else out.print("오류 발생");

stmt.close();
conn.close();
%>
</body>
</html>