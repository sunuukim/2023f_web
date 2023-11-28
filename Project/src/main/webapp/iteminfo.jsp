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
<%@ page import = "dao.ItemlistDao" %>
<%@ include file="Foodmenu.jsp" %>
<form action="cart.jsp" method="post">
<%
request.setCharacterEncoding("utf-8");
int pid = Integer.parseInt(request.getParameter("pid"));

ItemlistDao idao = new ItemlistDao();
String str = idao.info(pid);
if(str!=null)
	out.print(str);
else
	out.print("상품 정보가 없습니다.");
%>
<br>
<input type="hidden" name="pid" value=<%=pid%>>
<input type="number" name="quantity" min="1" value="1" required><br>
<input type="submit" value="장바구니에 담기">
</form>
</body>
</html>
