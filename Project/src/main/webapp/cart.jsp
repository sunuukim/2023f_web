<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기</title>
<link href="testcss.css" rel="stylesheet">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import = "dao.ItemlistDao" %>
<%
int pid = Integer.parseInt(request.getParameter("pid"));
int qu = Integer.parseInt(request.getParameter("quantity"));
String uid = (String)session.getAttribute("id");
//String action = "iteminfo.jsp";
String val = "쇼핑 계속하기";

if(uid==null){
	out.print("로그인이 필요한 서비스입니다.");
	val="취소";
	out.print("<form action='login.html'><input type='submit' value='로그인'></form>");
}
else
{
	ItemlistDao idao = new ItemlistDao();
	if(idao.intoCart(pid, qu, uid)){
		out.print("상품을 장바구니에 담았습니다.");
		out.print("<form action='displayBasket.jsp' method='post'><input type='submit' value='장바구니 확인'></form>");
	}else{
		out.print("오류가 발생했습니다. 다시 시도해주세요.");
		val = "뒤로가기";
	}
}
%>
<form action="iteminfo.jsp" method='post'>
<input type="hidden" name="pid" value=<%=pid%>>
<input type="hidden" name="c" value=<%=request.getParameter("c")%>>
<input type="submit" value="<%=val%>">
</form>
</body>
</html>
