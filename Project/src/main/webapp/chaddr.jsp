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
<title>Delivery Address Change</title>
</head>
<body>

<nav class="exheader">배송지 변경</nav>

<div class="section">
<form method="post" action="chaddrck.jsp">
	<table>
		<tr>
			<td>
				<input type="text" placeholder="변경 할 배송지" class="box-396" name=chdad>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" class="ckbox-400" value="배송지 변경">
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