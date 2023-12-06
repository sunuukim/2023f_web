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
<title>제품정보</title>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<jsp:include page="<%=ifile%>"/>
</head>
<body>
<div class='info'>
<%
request.setCharacterEncoding("utf-8");
String p = request.getParameter("pid");
if(p!=null){
	int pid = Integer.parseInt(p);
	ItemlistDao idao = new ItemlistDao();
	String str = idao.info(pid);
	if(str!=null)
		out.print(str);
	else
		out.print("상품 정보가 없습니다.");
}
else{
	out.print("<br>정상적인 접근이 아닙니다.");
}
%>
</div>
</body>
</html>
