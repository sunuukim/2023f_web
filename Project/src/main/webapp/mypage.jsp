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
<div class="page-hdr">마이 페이지</div><br><br><br><br><hr>

<form method=post action=logout.jsp>
<a><input type=submit class="page-lgout" value="로그아웃"></a>
</form>

<div class="page-bt">
<table>
	<tr><th>
		<form method=post action="myinfo.jsp">
			<input type=submit value="내 정보 확인" class="page-menu">
		</form>
	</th></tr>
	<tr><th>
		<form method=post action="?.jsp">
			<input type=submit value="장바구니" class="page-menu">
		</form>
	</th></tr>
	<tr><th>
		<form method=post action="daddress.html">
			<input type=submit value="배송지 변경" class="page-menu">
		</form>
	</th></tr>
	<tr><th>
		<form method=post action="chpasswd.html">
			<input type=submit value="패스워드 변경" class="page-menu">
		</form>
	</th></tr>
	<tr><th>
		<form method=post action="withdraw.jsp">
			<input type=submit value="회원 탈퇴" class="page-menu">
		</form>
	</th></tr>
</table>
</div>

<div class="page-main">
<form method=post action=?>
<table>
	<tr>
		<td>
			<%		
			String isql="select pid,name,category,price,type,explanation,image from item";
			String csql="select quntity,price from cart";
			Connection conn=ConnectionPool.get();
			PreparedStatement istmt=conn.prepareStatement(isql);
			PreparedStatement cstmt=conn.prepareStatement(csql);
			ResultSet irs=istmt.executeQuery();
			ResultSet crs=cstmt.executeQuery();
		
			Date now=new Date(); 
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			String date=df.format(now);
		
			while(crs.next()){
				String str="";
				String simg="";
				//int del=rs.getInt("delivery");
				int del=1;
				if(del==0) out.print("배송 중 ");
				else if(del==1) out.print("배송완료 ");
				else out.print("배송취소 ");
				
				out.print(date+"<br>"+"<img src=./img/apple.jpg height=300 width=300>"+"<br><br>");
				str=str+"\t"+crs.getString("price")+" 원 · "+crs.getString("quntity")+" 개 "
				+"\t\t\t\t"+"<input type=submit value='장바구니 담기' class='page-mainsub'>"
				+"<br><br>";
				out.print(str);
			}
			conn.close();
			istmt.close();
			cstmt.close();
			%>
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>