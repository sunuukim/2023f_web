<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품>과일></title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="util.ConnectionPool" %>
<%@ include file="Foodmenu.jsp" %>
<form action="cart.jsp">
<%
request.setCharacterEncoding("utf-8");
int pid = Integer.parseInt(request.getParameter("pid"));
String sql ="select name, price from item where pid=?";

Connection conn = util.ConnectionPool.get();
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setInt(1, pid);
ResultSet rs = stmt.executeQuery();//rs에 리스트상태로 저장됨

String str="<table border=0 cellpadding=20 cellspacing=20><tr>";
String info = "<input type=hidden name=iname value=";
if(rs.next()){
	String name = rs.getString("name");
	String price = rs.getString("price");
	str += "<td>"+name+"</td><tr><td>"+price+"원</td></tr>";
	info += name + "><input type=hidden name=price value="+price+">";
	str+="</table>";
	out.print(str);
	out.print(info);
}
rs.close(); stmt.close(); conn.close();
%>
수량선택도 나중에 추가하기<br>
<input type="submit" value="장바구니에 담기">
</form>
</body>
</html>
