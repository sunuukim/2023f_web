<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String category = request.getParameter("c");
String t = request.getParameter("t");
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
case "스포츠레저":
	ifile = "Sportsmenu.jsp";
	break;
}
%>
<title><%=category%>><%=t%></title>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<jsp:include page="<%=ifile%>"/>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

ItemlistDao idao = new ItemlistDao();
String str = idao.listing(t, 2);
if(str!=""){
	out.print(str);
}else{
	out.print("판매 중인 상품이 없습니다.");
}
%>
<br><br><br><br><br><br><br>
<footer>
		<p>&Korea.uni.ShoppingMall</p>
</footer>
</body>
</html>
