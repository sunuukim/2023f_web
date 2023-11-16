<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ include file ="Foodmenu.jsp" %>
<%
request.setCharacterEncoding("utf-8");

String sql ="select name, price, link from item where type='과일'";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?serverTimezone=UTC","root","1111");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);//rs에 리스트상태로 저장됨
String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
int count = 0;
while(rs.next())//더 이상 next가 없을 때까지
{
	if(count!=0 && count%5==0)str += "<tr>";
	str += "<td width=100><a href='"+ rs.getString("link")+ "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
	count++;
	if(count!=0 && count%5==0)str += "</tr>";
}
out.print(str);
rs.close(); stmt.close(); conn.close();
%>
</body>
</html>
