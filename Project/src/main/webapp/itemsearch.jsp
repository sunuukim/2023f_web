<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 > 검색결과</title>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Mainmenu.jsp" %>
<style>
h4, h5{
	text-align:center;
	font-weight:normal;
}
span{
	font-weight:bold;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String pname = request.getParameter("pname");
String msg = "<h4><span>'" +pname+ "'</span> 에 대한 검색결과 입니다.</h4>";
out.print(msg);
%>
<hr>
<%
ItemlistDao idao = new ItemlistDao();
String str = idao.listing(pname, 3);
if(str!=""){
	out.print(str);
}else{
	out.print("<h5>상품이 존재하지 않습니다.</h5>");
}
%>
</body>
</html>