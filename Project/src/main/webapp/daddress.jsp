<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="dao.ChdaddressDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Address Change</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");

String uchdad=request.getParameter("chdad");
ChdaddressDao dao=new ChdaddressDao();

if(dao.exists(uchdad)){
	out.print("기존 배송지와 동일합니다. 다른 배송지를 입력해주세요.");
	out.print("<br><br><form method=post action=daddress.html>");
	out.print("<input type=submit value=돌아가기>");
	out.print("</form>");
}else{
	if(dao.update(uchdad, sid)){
		out.print("배송지가 변경되었습니다.");
		out.print("<br><br><form method=post action=main.html>");
		out.print("<input type=submit value=돌아가기>");
		out.print("</form>");
	}
}

%>
</body>
</html>