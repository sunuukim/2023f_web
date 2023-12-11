<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="util.ConnectionPool" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mypage.css">
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
<%String sid=(String) session.getAttribute("id"); %>

<div class="right-corner">
<a href="login.html">로그인</a>
<a href="signup.html">회원가입</a>
<a href="logout.jsp">로그아웃</a>
</div><br>
<h1 class="header">마이 페이지</h1>

<div class=nav>
<a href="category.jsp?c=식품">식품</a>
<a href="category.jsp?c=생활용품">생활용품</a>
<a href="category.jsp?c=패션의류">패션의류</a>
<a href="category.jsp?c=스포츠레저">스포츠레저</a>
<a href="mypage.jsp">마이페이지</a>
<a href="cart.jsp">장바구니</a>
</div><br>

<div class=lsection>
<form method=post action="myinfo.jsp">
	<input type=submit class="leftckbox" value="내 정보 확인">
</form><br>
<form method=post action="cart.jsp">
	<input type=submit class="leftckbox" value="장바구니">
</form><br>
<form method=post action="daddress.html">
	<input type=submit class="leftckbox" value="배송지 변경">
</form><br>
<form method=post action="chpasswd.html">		
	<input type=submit class="leftckbox" value="패스워드 변경">
</form><br>
<form method=post action="withdraw.jsp">
	<input type=submit class="leftckbox" value="회원 탈퇴">
</form>
</div>

<div class="section">
	<form method=post action=cart.jsp>
	<%		
	String sql="select quantity,price,uid from cart";
	Connection conn=ConnectionPool.get();
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
		
	Date now=new Date(); 
	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	String date=df.format(now);
	
	
	while(rs.next()){
		String str="";
		String simg="";
		
		if(sid!=null){
			//int del=rs.getInt("delivery");
			int del=1;
			if(del==0) out.print("배송 중 ");
			else if(del==1) out.print("배송완료 ");
			else out.print("배송취소 ");
			
			out.print(date+"<br>");
			out.print("<img src=./image/apple.jpg height=300 width=300>");
			out.print("<br><br>");
			
			str=str+"\t"+rs.getString("price")+" 원 · "+rs.getString("quantity")+" 개 "
			+"</div><div class=rsection>"
			+"<input type=submit value='장바구니 담기' class='cartbt'>"
			+"<br><br>";
			out.print(str);
		}
	}
	conn.close();
	stmt.close();
	%>
</form>
</div>

<div class=footer>
	<p>&Korea.uni.ShoppingMall</p>
</div>
</body>
</html>