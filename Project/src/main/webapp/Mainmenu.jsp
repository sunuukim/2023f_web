<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="testcss.css" rel="stylesheet">
</head>

<body>

	<header>
		<div class="right-corner">
			<%
				String uid = (String)session.getAttribute("id");
				if(uid==null){
			%>
			<a href="login.html">로그인</a> | <a href="signup.html">회원가입</a>
			<%
				}else{
					out.print(uid);
			%>
			님 환영합니다 | <a href="mypage.jsp">마이페이지</a> | <a href="displayBasket.jsp">장바구니</a> | <a href="logout.jsp">로그아웃</a>
			<%
				}
			%>
		</div>
		<form action="itemsearch.jsp"><a href="mainpage.html">Shoppingmall</a>
		<input id="search" type="text" name="pname" size="50" placeholder="상품명을 입력하세요"><input type="submit" value="검색"></form>
	</header>

	<nav>
		<a href="./category.jsp">전체</a>
		<a href="./category.jsp?c=식품">식품</a>
		<a href="./category.jsp?c=생활용품">생활용품</a>
		<a href="./category.jsp?c=패션의류">패션/의류</a>
		<a href="./category.jsp?c=스포츠레저">스포츠/레저</a>
	</nav>
	
</body>

</html>