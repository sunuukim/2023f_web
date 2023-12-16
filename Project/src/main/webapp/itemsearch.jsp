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
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String pname = request.getParameter("pname");
String msg = "'" +pname+ "' 에 대한 검색결과 입니다.";
out.print(msg);
%>
<hr>
<%
ItemlistDao idao = new ItemlistDao();
String str = idao.listing(pname, 3);
if(str!=""){
	out.print(str);
}else{
	out.print("상품이 존재하지 않습니다.\n단어의 철자가 정확한지 확인해보세요.");
}
%>
</body>
</html>