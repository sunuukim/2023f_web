<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.ConnectionPool" %>
<%@ page import="java.sql.*" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Mainmenu.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="duplication.css">
	<link href="testcss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Change password</title>
</head>
<body>	

<%String sid=(String) session.getAttribute("id");%>

<nav class="exheader">비밀번호 변경</nav>

<div class="section">
<form method="post" action="chpwck.jsp">
	<table>
		<tr>
			<td>
				<input type="password" class="chtext" name="pw" id="pw" placeholder="변경할 비밀번호" required>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" class="chtext" name="rpw" id="rpw" placeholder="비밀번호 확인" required>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="패스워드 변경" class="ckbox-400">
			</td>
		</tr>
	</table>
	</form>
</div>
	
<footer>
	<p>&Korea.uni.ShoppingMall</p> 
</footer>
</body>
</html>