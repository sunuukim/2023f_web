<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.SignDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="withdraw.css">
<meta charset="UTF-8">
<title>Delete My Info</title>
</head>
<body>
<a class="page-hdr">회원탈퇴 페이지</a><br><br><br><br><br><hr>
<%
String sid=(String) session.getAttribute("id");
%>
<table class="page-main">
	<tr class="page-name">
		<td>
			ID : 
		</td>
		<td width=377px height=40px>
			<%=sid	%>
		</td>
	</tr>
	<tr class="page-name">
		<td>	
			PW :
		</td>
		<td>
			<input type="password" name="pw" class="page-bton" required>
		</td>
	</tr>
</table> 
	
<hr>
<table class="page-main">
	<tr>
		<td>
		<form method="post" action="withdrawck.jsp">
			<input type="submit" value="회원 탈퇴" class="page-tmenu"> 
		</form>
		</td>
		<td>
			<form method=post action="mypage.jsp">
			<input type=submit value=돌아가기 class=page-tmenu>
			</form>
		</td>
	</tr>
</table>


</body>
</html>