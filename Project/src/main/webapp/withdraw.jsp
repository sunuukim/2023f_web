<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.SignDao" %>
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Mainmenu.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<link href="testcss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Delete My Info</title>
</head>
<body>
<%
String referer = request.getHeader("Referer");
String sid=(String) session.getAttribute("id");

if(sid==null){
	out.println("<script>alert('로그인 되어있지 않습니다.'); location.href='mypage.jsp';</script>");
    out.flush();
}
%>

<%
Connection conn=null;
PreparedStatement stmt=null;
ResultSet rs=null;
String sql="select * from user";
conn=ConnectionPool.get();
stmt=conn.prepareStatement(sql);
rs = stmt.executeQuery(sql);
String sname="";

while(rs.next()){
	if(sid.equals(rs.getString("id"))){
		sname=rs.getString("name");
	}
}
%>

<nav class="exheader">회원탈퇴 페이지</nav>

<form method="post" action="withdrawck.jsp">
<div class=section>
<table>
	<tr>
		<td class=text>
			ID : <%=sid	%>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" class=chtext name="pw" placeholder="Password" required>
		</td>
	</tr>
		<tr>
		<td>
			<input type="submit" value="회원 탈퇴" class=ckbox-400>
		</td>
	</tr>
</table>
</div>
</form>

<footer>
<p>&Korea.uni.ShoppingMall</p>
</footer>
</body>
</html>