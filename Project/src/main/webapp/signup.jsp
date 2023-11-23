<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.SignDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid=request.getParameter("id");
String upass=request.getParameter("pw");
String rupass=request.getParameter("rpw");
String uname=request.getParameter("na");
String utel=request.getParameter("tel");
String udad=request.getParameter("dad");

SignDao dao=new SignDao();
if(dao.exists(uid)){
	out.print("이미 가입한 회원입니다.");
	return;
}

if(!upass.isEmpty()&&!rupass.isEmpty()){
	if(upass.equals(rupass)){
		if(dao.insert(uid,upass,uname,udad)){
			out.print("회원 가입이 완료되었습니다.");
			out.print("<form method=post action=login.html>"+"<hr>"+
					"<input type=submit value=로그인창으로>"+"</form>");
		}
	}else{
		out.print("패스워드가 동일하지 않습니다.");
		out.print("<form method=post action=signup.html>"+"<hr>"+
		"<input type=submit value=돌아가기>"+"</form>");
		}
}else {
	out.print("패스워드를 입력해주세요");
	out.print("<form method=post action=signup.html>"+"<hr>"+
			"<input type=submit value=돌아가기>"+"</form>");
}


%>
</body>
</html>
