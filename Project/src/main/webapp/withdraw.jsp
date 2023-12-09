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
<link rel="stylesheet" href="core.css">
<meta charset="UTF-8">
<title>Delete My Info</title>
</head>
<body>
<div class="right-corner">
<a href="login.html">로그인</a>
<a href="signup.html">회원가입</a>
</div><br>

<form method="post" action="mainpage.html">
	<input type="submit" value="ShoppingMall" class="headerbt"></form>

<div class=nav>
<a href="category.jsp?c=식품">식품</a>
<a href="category.jsp?c=생활용품">생활용품</a>
<a href="category.jsp?c=패션의류">패션의류</a>
<a href="category.jsp?c=스포츠레저">스포츠레저</a>
<a href="mypage.jsp">마이페이지</a>
<a href="cart.jsp">장바구니</a>
</div>
<%String sid=(String) session.getAttribute("id");%>

<h2 class="subheader">회원탈퇴 페이지</h2>

<form method="post" action="withdrawck.jsp">
<div class=section>
<table class=box>
	<tr>
		<td class=text>
			ID : <%=sid	%>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" class=passbox name="pw" placeholder="Password" required>
		</td>
	</tr>
		<tr>
		<td>
			<input type="submit" value="회원 탈퇴" class=ckbox>
		</td>
	</tr>
</table>
</div>
</form>

<div class=footer>
<p>&Korea.uni.ShoppingMall</p>
</div>
</body>
</html>