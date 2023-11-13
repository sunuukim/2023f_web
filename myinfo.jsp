<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Information</title>
</head>
<body>
<h1>내 정보 확인</h1>
<hr><br>
<%
String uid="";
String uname="";
Enumeration mydata=session.getAttributeNames();

while(mydata.hasMoreElements()){
	uid=mydata.nextElement().toString();
	uname=mydata.nextElement().toString();
	
	out.print("아이디 : "+uid+"<br>");
	out.print("이름 : "+uname+"<br>");
}
%>
</body>
</html>