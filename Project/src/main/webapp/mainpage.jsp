<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shoppingmall</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: white;
	padding: 1em;
	text-align: center;
}

header a {
	background-color: #333;
	color: white;
	text-decoration: none;
	font-weight: bold;
}

nav {
	display: flex;
	justify-content: space-around;
	background-color: #444;
	padding: 1em 0;
	margin-top: 1em;
}

nav a {
	color: white;
	text-decoration: none;
	font-weight: bold;
}

section {
	padding: 2em;
	text-align: center;
}

footer {
	background-color: #333;
	color: white;
	padding: 1em;
	text-align: center;
}

.left-corner {
	float: right;
	color: white;
}

.gallery {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.gallery-item {
	width: 150px;
	margin: 10px;
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
	cursor: pointer;
}

.gallery-item img {
	max-width: 100%;
	max-height: 100%;
	border: 1px solid #ddd;
	border-radius: 5px;
}
</style>
</head>
<body>
	<header>
		<div class="left-corner">
			<%
			String uid = (String) session.getAttribute("id");
			if (uid == null) {
			%>
			<a href="login.html">로그인</a> | <a href="signup.html">회원가입</a>
			<%
			} else {
			out.print(uid);
			%>
			님 환영합니다 | <a href="mypage.jsp">마이페이지</a> | <a
				href="displayBasket.jsp">장바구니</a> | <a href="logout.jsp">로그아웃</a>
			<%
			}
			%>
		</div>
		<br>
		<h1><a href="mainpage.jsp">ShoppingMall</a></h1>
	</header>

	<nav>
		<a href="category.jsp?c=식품">식품</a> <a href="category.jsp?c=생활용품">생활용품</a>
		<a href="category.jsp?c=패션의류">패션의류</a> <a href="category.jsp?c=스포츠레저">스포츠레저</a>
		<a href="mypage.jsp">마이페이지</a> <a href="displayBasket.jsp">장바구니</a>
	</nav>

	<section id="food">
		<h2>식품</h2>
		<div class="gallery">
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=6'">
				<img src="image/apple.jpg" alt="사과">
				<p>사과</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=2'">
				<img src="image/banana.jpg" alt="바나나">
				<p>바나나</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=28'">
				<img src="image/butter.png" alt="버터">
				<p>버터</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=1'">
				<img src="image/carrot.jpg" alt="당근">
				<p>당근</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/cu.jpg" alt="오이">
				<p>오이</p>
			</div>
		</div>
	</section>

	<section id="household">
		<h2>생활용품</h2>
		<div class="gallery">
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/flstm.png" alt="린스">
				<p>린스</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/fhtus.png" alt="로션">
				<p>로션</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/papercup.jpg" alt="종이컵">
				<p>종이컵</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/rhan.png" alt="고무장갑">
				<p>고무장갑</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/frypan.jpg" alt="프라이팬">
				<p>프라이팬</p>
			</div>
		</div>
	</section>

	<section id="fashion">
		<h2>패션의류</h2>
		<div class="gallery">
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/long.png" alt="롱패딩">
				<p>롱패딩</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/lskirt.png" alt="롱치마">
				<p>롱스커트</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/mtm.png" alt="맨투맨">
				<p>맨투맨</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/hood.png" alt="후드티">
				<p>후드티</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/short.png" alt="반바지">
				<p>반바지</p>
			</div>
		</div>
	</section>

	<section id="sport">
		<h2>스포츠레저</h2>
		<div class="gallery">
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/yoga.png" alt="요가매트">
				<p>요가매트</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/badmin.jpg" alt="배드민턴채">
				<p>배드민턴채</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/bike.jpg" alt="자전거">
				<p>자전거</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/golfb.jpg" alt="골프공">
				<p>골프공</p>
			</div>
			<div class="gallery-item"
				onclick="location.href='iteminfo.jsp?c=식품&pid=8'">
				<img src="image/tent.jpg" alt="텐트">
				<p>텐트</p>
			</div>
		</div>
	</section>
	<footer>
		<p>&Korea.uni.ShoppingMall</p>
	</footer>
</body>
</html>
