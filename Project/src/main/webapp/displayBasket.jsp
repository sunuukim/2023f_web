<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.BasketDao"%>
<%@ page import="dao.ServicebasketDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="designbasket.css">
<style>
footer {
	background-color: #333;
	color: white;
	padding: 1em;
	text-align: center;
}
</style>
<script>
	function showLoginAlert() {
		alert("로그인이 필요한 서비스입니다.");
		window.location.href = "login.html";
	}
</script>
</head>
<body>
	<%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
	 %>
        <script>
            showLoginAlert();
        </script>
    <%
	} else {%>
	<header>
		<div class="right-corner">
			<%=uid%>님 환영합니다 | <a href="mypage.jsp">마이페이지</a> | <a href="logout.jsp">로그아웃</a>
		</div>
		<br><a href="mainpage.jsp"><h1>ShoppingMall</h1></a>
	</header>
	<nav>장바구니</nav>
	<%
		
	BasketDao basketDao = new BasketDao();
	ArrayList<BasketDao.BasketItem> basketItems = basketDao.getBasketItems(uid);

	if (!basketItems.isEmpty()) {
	%>
	<content>
	<form action="removeItem.jsp" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>이미지</th>
					<th>이름</th>
					<th>수량</th>
					<th>가격</th>
					<th>선택 삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (BasketDao.BasketItem basketItem : basketItems) {
				%>
				<tr>
					<td><img width=200 src="image/<%=basketItem.getImage()%>"
						alt="<%=basketItem.getName()%>"></td>
					<td><%=basketItem.getName()%></td>
					<td><%=basketItem.getQuantity()%></td>
					<td><%=basketItem.getPrice()%></td>
					<td><input type="checkbox" name="selectedItems"
						value="<%=basketItem.getPid()%>"></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<input type="submit" value="선택 삭제">
	</form>

	<form action="removeAllItems.jsp" method="post">
		<input type="submit" value="전체 삭제">
	</form>

	<br>

	<form action="mainpage.jsp" method="get">
		<input type="submit" value="쇼핑 계속하기">
	</form>

	<%
	ServicebasketDao servicebasketDao = new ServicebasketDao();
	int totalPrice = servicebasketDao.calculateTotalPrice(uid);
	%>
	<p style="color: black;">
		총 금액:
		<%=totalPrice%></p>
	<form action="checkout.jsp" method="post">
		<!-- 결제 페이지로 이동 -->
		<input type="submit" value="결제하기">
	</form>
	</content>
	<%
	} else {
	%>
	<div>
		<p style="color: black;">장바구니가 비어 있습니다.</p>
		<form action="mainpage.jsp" method="get">
			<input type="submit" value="쇼핑하기">
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%
	}
	}
	%>
	<br><br><br>
	<footer>
		<p>&Korea.uni.ShoppingMall</p>
	</footer>	
</body>
</html>