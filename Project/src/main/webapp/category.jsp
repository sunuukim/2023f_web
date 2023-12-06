<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String category = request.getParameter("c");
String ifile = "";
switch(category){
case "식품":
	ifile = "Foodmenu.jsp";
	break;
case "생활용품":
	ifile = "Lifemenu.jsp";
	break;
case "패션의류":
	ifile = "Clothesmenu.jsp";
	break;
case "레저스포츠":
	ifile = "Sportsmenu.jsp";
	break;
}
%>
<title><%=category%> 카테고리</title>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<jsp:include page="<%=ifile%>"/>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

ItemlistDao idao = new ItemlistDao();
String str = idao.listing(category, 1);
if(str!=""){
	out.print(str);
}else{
	out.print("등록된 상품이 없습니다.");
}
%>
</body>
</html>
