<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<%session.invalidate();%>
로그아웃 되셨습니다.
<hr>
<form method=post action="login.html">
<input type=submit value="로그인 창으로">
</form>
</body>
</html>