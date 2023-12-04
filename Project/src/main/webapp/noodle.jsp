<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품>라면</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file ="Foodmenu.jsp" %>
<%
request.setCharacterEncoding("utf-8");

ItemlistDao idao = new ItemlistDao();
String str = idao.listing("라면", 0);
if(str!=null){
	out.print(str);
}else{
	out.print("등록된 상품이 없습니다.");
}
%>
</body>
</html>
