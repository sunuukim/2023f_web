<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="util.ConnectionPool"%>
<%@ page import="dao.ServicebasketDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
</head>
<body>
<%
String msg = "결제가 완료되었습니다<br>";
String bn = "NH농협";
String accountnum = "111-1111-1111-11<br>";
if(request.getParameter("bankname")!=null){
	Random random = new Random();
	bn = request.getParameter("bankname");
	//임의의 숫자 2개+전화번호 합쳐서 가상계좌번호발급
	accountnum = String.valueOf(random.nextInt(90)+10)+request.getParameter("telnum")+"<br>";
	msg += "가상계좌번호는 아래와 같습니다<br>";
}
msg += "반드시 24시간 내에 입금하세요<br>";
String uid = (String)session.getAttribute("id");
ServicebasketDao updatedao = new ServicebasketDao();
String dadd = request.getParameter("daddress");
if(updatedao.updateDelivery(uid, 1)){
	out.print(msg);
	out.print(bn+" "+accountnum);
	out.print("배송지: "+dadd);%>
<br><form action="displayBasket.jsp"><input type="submit" value="확인"></form>
<%
}else{
	out.print("결제 도중 오류가 발생했습니다.<br>다시 시도해주세요.");%>
	<br><input type="button" value="다시 결제하기" onclick="history.back()">
<%
}
%>

</body>
</html>