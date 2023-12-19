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
<link rel="stylesheet" href="mypage.css">
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
<%
String referer = request.getHeader("Referer");
String sid=(String) session.getAttribute("id");

Connection conn=ConnectionPool.get();

if(sid==null){
	out.println("<script>alert('로그인 되어있지 않습니다.'); location.href='login.html';</script>");
    out.flush();
} %>

<%
String sname="";

String usersql="select name,id from user";
String cartsql="select * from cart";
String itemsql="select * from item";

PreparedStatement userstmt=conn.prepareStatement(usersql);
PreparedStatement cartstmt=conn.prepareStatement(cartsql);
ResultSet cartrs=cartstmt.executeQuery();
ResultSet userrs=userstmt.executeQuery();
%>

<nav class="exheader">마이 페이지</nav>

<div class=lsection>
<form method=post action="myinfo.jsp">
	<input type=submit class="leftckbox" value="내 정보 확인">
</form>
<form method=post action="displayBasket.jsp">
	<input type=submit class="leftckbox" value="장바구니">
</form>
<form method=post action="chaddr.jsp">
	<input type=submit class="leftckbox" value="배송지 변경">
</form>
<form method=post action="chpw.jsp">		
	<input type=submit class="leftckbox" value="패스워드 변경">
</form>
<form method=post action="withdraw.jsp">
	<input type=submit class="leftckbox" value="회원 탈퇴">
</form>
</div>

<div class=section>
	<form method=post action=cart.jsp>
	<%	
	while(cartrs.next()){
		if(sid.equals(cartrs.getString("uid"))&&(cartrs.getInt("delivery")==1)){
			String sdate=cartrs.getString("sdate");
			String ddate=cartrs.getString("ddate");
			int delivery=cartrs.getInt("delivery");
			String str=cartrs.getInt("price")+" 원 · "+cartrs.getInt("quantity")+" 개 ";
			String simg=cartrs.getString("image");
			String exp=cartrs.getString("explanation");
			
			out.print("<table class=table>");
			out.print("<tr>");
				out.print("<td>");
					out.print(sdate+" 주문");
				out.print("</td>");
			out.print("</tr>");
			out.print("<tr>");
				out.print("<td class=font>");
					out.print("배송 준비 중 ");
					out.print(ddate+"예정");
				out.print("</td>");
			out.print("</tr>");
			out.print("<tr>");
				out.print("<td>");%>
					<img src="./image/<%=simg %>" height=300 width=300>
				<%out.print("</td>");
				out.print("<td class=expfont>");
					out.print(exp);
				out.print("</td>");
			out.print("</tr>");
			out.print("<tr>");
				out.print("<td>");
					out.print(str);
				out.print("</td>");
				out.print("<td>");
					out.print("<input type=submit value='장바구니 담기' class=cartbt>");
				out.print("</td>");
			out.print("</tr>");
		out.print("</table><br>");	
		}
	}	
	cartrs.close(); userrs.close();
	conn.close();
	cartstmt.close(); userstmt.close();
	%>
	</form>
</div>

<footer>
	<p>&Korea.uni.ShoppingMall</p>
</footer>
</body>
</html>