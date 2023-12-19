<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Mainmenu.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<link href="testcss.css" rel="stylesheet">
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
String sname="";

while(rs.next()) {
	if(sid.equals(rs.getString("id"))){
		sname=rs.getString("name");
		sna=rs.getString("name");
		sdad=rs.getString("daddress");
		stel=rs.getString("tel");
	}
}
%>

<nav class=exheader>내 정보 확인</nav>

<div class=section>
<table>
	<tr>
		<td class=right-side>
			아이디  
		</td>
		<td class=left-side>
			<%out.print("  "+sid);%>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			이름  
		</td>
		<td class=left-side>
			<%out.print(sna); %>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			배송지  
		</td>
		<td class=left-side>
			<%out.print(sdad); %>
		</td>
	</tr>
	<tr>
		<td class=right-side>
			전화번호  
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

<footer>
<p>&Korea.uni.ShoppingMall</p>
</footer>
<%
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
</body>
</html>