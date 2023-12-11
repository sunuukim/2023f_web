<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>My Information</title>
</head>
<body>
<%
String sid=(String) session.getAttribute("id");

Connection conn=null;
PreparedStatement stmt=null;
ResultSet rs=null;
String sql="select * from user";
conn=ConnectionPool.get();
stmt=conn.prepareStatement(sql);
rs = stmt.executeQuery(sql);
String sna="";
String sdad="";
String stel="";

while(rs.next()) {
	sna=rs.getString("name");
	sdad=rs.getString("daddress");
	stel=rs.getString("tel");
}
%>

<div class="right-corner">
<a href="login.html">로그인</a>
<a href="signup.html">회원가입</a>
<a href="logout.html">로그아웃</a>
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

<h2 class=header>내 정보 확인</h2>

<div class=section>
<table>
	<tr>
		<td class=right-side>
			아이디 : 
		</td>
		<td class=left-side>
			<%out.print("  "+sid);%>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			이름 : 
		</td>
		<td class=left-side>
			<%out.print(sna); %>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			배송지 : 
		</td>
		<td class=left-side>
			<%out.print(sdad); %>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			전화번호 : 
		</td>
		<td class=left-side>
			<%out.print(stel); %>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<form method=post action=mypage.jsp>
			<input type=submit value=돌아가기 class=ckbox-400></form>		
		</td>
	</tr>
</table>
</div>

<div class=footer>
<p>&Korea.uni.ShoppingMall</p>
</div>
<%
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
</body>
</html>