<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
</head>
<body>
<hr>
<%session.invalidate();
response.sendRedirect("mainpage.html");
%>
<hr>
<form method=post action="login.html">
<input type=submit value="로그인 창으로">
</form>
</body>
</html>