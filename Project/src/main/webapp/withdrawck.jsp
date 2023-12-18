<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%@ page import="dao.LoginDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="duplication.css">
<meta charset="UTF-8">
<title>WithDraw Check</title>
</head>
<body>
<div class="right-corner">
<a href="login.html">로그인</a>
<a href="signup.html">회원가입</a>
</div><br>

<form method="post" action="mainpage.html">
	<input type="submit" value="ShoppingMall" class="headerbt"></form>

<div class=nav>
<a href="category.jsp?c=식품">식품</a>
<a href="category.jsp?c=생활용품">생활용품</a>
<a href="category.jsp?c=패션의류">패션의류</a>
<a href="category.jsp?c=스포츠레저">스포츠레저</a>
<a href="mypage.jsp">마이페이지</a>
<a href="cart.jsp">장바구니</a>
</div>
<%String sid=(String) session.getAttribute("id");%>

<div class=section>
<table>
	<tr>
		<tb>
			<h2>
			<%
			String upw=request.getParameter("pw");

			LoginDao dao=new LoginDao();

			if(dao.exists(sid,upw)){
				dao.delete(sid);
				out.println("<script>alert('회원탈퇴 완료'); location.href='mainpage.html';</script>");
			    out.flush();
			}else {
				out.println("<script>alert('비밀번호가 동일하지 않습니다.'); location.href='withdraw.jsp';</script>");
			    out.flush();
			}
			%>
			</h2>
		</tb>
	</tr>
	<tr>
		<td>
			<form method=post action=withdraw.jsp>
			<input type=submit value=돌아가기 class=ckbox>
			</form>
		</td>
	</tr>
</table>
</div>

<div class=footer>
<p>&Korea.uni.ShoppingMall</p>
</div>
</body>
</html>