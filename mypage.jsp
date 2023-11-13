<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
<div class=container><font size=7><center>마이 페이지</center></font></div><hr>
<style>
	div.left{
		float:left;
		background:#ff0;
	}
	div.content{
		float:left;
		background:#f0f;
	}
</style>

<div class=left>
<table border=1 width=300 height=500>
	<tr>
		<th>
			<a href="myinfo.jsp"><font size=6>내 정보 확인</font></a>
		</th>
	</tr>
	<tr>
		<th>
			<a href="?.?"><font size=6>장바구니</font></a>
		</th>
	</tr>
	<tr>
		<th>
			<a href="daddress.jsp"><font size=6>배송지 변경</font></a>
		</th>
	</tr>
	<tr>
		<th>
			<a href="chpasswd.html"><font size=6>패스워드 변경</font></a>
		</th>
	</tr>
	<tr>
		<th>
			<a href="withdraw.html"><font size=6>회원 탈퇴</font></a>
		</th>
	</tr>
</table>
</div>

<div class=content>
<table>
<tr>
	<td>
		<pre>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopingmall","root","1111");
		Statement stmt=conn.createStatement();
		
		String sql="select price,count,explanation,sdate,ddate,delivery from item";
		ResultSet rs=stmt.executeQuery(sql);
		
		Date now=new Date(); 
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String date=df.format(now);
		
while(rs.next()){
String str="";
int del=rs.getInt("delivery");
if(del==0) out.print("배송 중 ");
else if(del==1) out.print("배송완료 ");
else out.print("배송취소 ");
out.print(date+"<br><img src=C:/Users/Towa/Desktop/웹프로그래밍/사과.jpg height=300 width=300><br><br>");
str=str+"\t"+rs.getString("price")+" 원·"+rs.getString("count")+" 개 "+"\t\t\t\t\t\t\t장바구니 담기     "+"<br><br>";
out.print(str);
}
conn.close();
stmt.close();
		%>
		</pre>
	</td>
</tr>
</table>
</div>


</body>
</html>