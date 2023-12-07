<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
int all = 1;
String category = request.getParameter("c");
String ifile = "";
if(category==null)category="전체";
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
case "스포츠레저":
	ifile = "Sportsmenu.jsp";
	break;
default:
	ifile = "Mainmenu.jsp";
	all=2;
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
String str = idao.listing(category, all);
if(str!=""){
	out.print(str);
}else{
	out.print("등록된 상품이 없습니다.");
}
%>
</body>
</html>
