<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품 카테고리</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ include file="Foodmenu.jsp" %>
<%
request.setCharacterEncoding("utf-8");

String sql ="select pid, name, price from item where category='식품'";

Connection conn = util.ConnectionPool.get();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);//rs에 리스트상태로 저장됨
String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
int count = 0;
while(rs.next())//더 이상 next가 없을 때까지
{
	if(count!=0 && count%5==0)str += "<tr>";
	str += "<td width=100><a href='iteminfo.jsp" + "?pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
	count++;
	if(count!=0 && count%5==0)str += "</tr>";
}
str+="</table>";
out.print(str);
rs.close(); stmt.close(); conn.close();
%>
</body>
</html>