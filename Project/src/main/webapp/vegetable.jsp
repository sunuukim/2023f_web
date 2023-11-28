<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=0 align=center cellpadding=20 cellspacing=20><tr>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file ="Foodmenu.jsp" %>
<%
ItemlistDao idao = new ItemlistDao();
String str = idao.listing("채소");
if(str!=null){
	out.print(str);
}else{
	out.print("등록된 상품이 없습니다.");
}
%>
</table>
</body>
</html>
