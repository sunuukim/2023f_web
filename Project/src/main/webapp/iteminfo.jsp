<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품정보</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Foodmenu.jsp" %>

<%
request.setCharacterEncoding("utf-8");
int pid = Integer.parseInt(request.getParameter("pid"));

ItemlistDao idao = new ItemlistDao();
String str = idao.info(pid);
if(str!=null)
	out.print(str);
else
	out.print("상품 정보가 없습니다.");
%>

</body>
</html>
