<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="dao.ChdaddressDao" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>Delivery Address Change</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");

String uchdad=request.getParameter("chdad");
ChdaddressDao dao=new ChdaddressDao();

if(dao.exists(uchdad,sid)){
	out.println("<script>alert('기존 배송지와 동일합니다. 새로운 배송지를 입력해주세요.'); location.href='daddress.html';</script>");
    out.flush();
}else{
	if(dao.update(uchdad, sid)){
		out.println("<script>alert('배송지가 변경되었습니다.'); location.href='mypage.jsp';</script>");
	    out.flush();
	}
}

%>
</body>
</html>