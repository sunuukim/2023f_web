<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid = request.getParameter("id");
if(uid!=null){
	session.setAttribute("id", uid);
	out.print("login");
	response.sendRedirect("tmpmain.html");
}else{
	out.print("에러");
}
%>
</body>
</html>
