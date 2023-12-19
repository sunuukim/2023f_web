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
            color: #ffcc00;
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
            <a href="mainpage.jsp">로그아웃</a> | <a href="signup.html">회원가입</a>
        </div>
        <h1>ShoppingMall</h1>
    </header>

    <nav>
        <a href="category.jsp?c=식품">식품</a>
        <a href="category.jsp?c=생활용품">생활용품</a>
        <a href="category.jsp?c=패션의류">패션의류</a>
        <a href="category.jsp?c=스포츠레저">스포츠레저</a>
        <a href="mypage.jsp">마이페이지</a>
        <a href="displayBasket.jsp">장바구니</a>
    </nav>

    <section id="food">
        <h2>식품</h2>
        <div class="gallery">
            <div class="gallery-item" onclick="<%= response.sendRedirect('Foodmenu.jsp') %>">
                <img src="apple.jpg" alt="사과">
                <p>사과</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Foodmenu.jsp') %>">
                <img src="banana.jpg" alt="바나나">
                <p>바나나</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Foodmenu.jsp') %>">
                <img src="butter.jpg" alt="버터">
                <p>버터</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Foodmenu.jsp') %>">
                <img src="carrot.jpg" alt="당근">
                <p>당근</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Foodmenu.jsp') %>">
                <img src="cu.jpg" alt="오이">
                <p>오이</p>
            </div>
        </div>
    </section>

    <section id="household">
        <h2>생활용품</h2>
        <div class="gallery">
            <div class="gallery-item" onclick="<%= response.sendRedirect('Lifemenu.jsp') %>">
                <img src="flstm.png" alt="린스">
                <p>린스</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Lifemenu.jsp') %>">
                <img src="fhtus.png" alt="로션">
                <p>로션</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Lifemenu.jsp') %>">
                <img src="papercup.jpg" alt="종이컵">
                <p>종이컵</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Lifemenu.jsp') %>">
                <img src="rhan.png" alt="고무장갑">
                <p>고무장갑</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Lifemenu.jsp') %>">
                <img src="frypan.jpg" alt="프라이팬">
                <p>프라이팬</p>
            </div>
        </div>
    </section>

    <section id="fashion">
        <h2>패션의류</h2>
        <div class="gallery">
            <div class="gallery-item" onclick="<%= response.sendRedirect('Clothesmenu.jsp') %>">
                <img src="long.png" alt="롱패딩">
                <p>롱패딩</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Clothesmenu.jsp') %>">
                <img src="Iskirt.png" alt="롱치마">
                <p>롱치마</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Clothesmenu.jsp') %>">
                <img src="mtm" alt="맨투맨">
                <p>맨투맨</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Clothesmenu.jsp') %>">
                <img src="hood.png" alt="후드티">
                <p>후드티</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Clothesmenu.jsp') %>">
                <img src="short.png" alt="반바지">
                <p>반바지</p>
            </div>
        </div>
    </section>

    <section id="sport">
        <h2>스포츠레저</h2>
        <div class="gallery">
            <div class="gallery-item" onclick="<%= response.sendRedirect('Sportsmenu.jsp') %>">
                <img src="yoga.png" alt="요가매트">
                <p>요가매트</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Sportsmenu.jsp') %>">
                <img src="badmin.jpg" alt="배드민턴채">
                <p>배드민턴채</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Sportsmenu.jsp') %>">
                <img src="bike.jpg" alt="자전거">
                <p>자전거</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Sportsmenu.jsp') %>">
                <img src="golfb.jpg" alt="골프공">
                <p>골프공</p>
            </div>
            <div class="gallery-item" onclick="<%= response.sendRedirect('Sportsmenu.jsp') %>">
                <img src="tent.jpg" alt="텐트">
                <p>텐트</p>
            </div>
        </div>
    </section>
    <footer>
        <p>&Korea.uni.ShoppingMall</p>
    </footer>
</body>
</html>
