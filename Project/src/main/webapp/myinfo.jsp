<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.MyInfoDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="myinfo.css">
<meta charset="UTF-8">
<title>My Information</title>
</head>
<body>
<a class=page-hdr>내 정보 확인</a><br><br><br><br><hr>
<%
String sid=(String) session.getAttribute("id");

MyInfoDao dao=new MyInfoDao();

String spw=dao.select();
%>
<table class=page-main>
	<tr>
		<td>
			아이디 : 
		</td>
		<td>
			<%out.print(" "+sid);%>
		</td>
	</tr>
	<tr>
		<td>
			이름 : 
		</td>
		<td>
			<%out.print(" "); %>
		</td>
	</tr>
</table>
<hr>
<form method=post action=mypage.jsp>
<table class=page-name>
<tr>
<td>
<input type=submit value=돌아가기 class=page-tmenu>
</td>
</tr>
</table>

</form>
</body>
</html>