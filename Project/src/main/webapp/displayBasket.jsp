<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BasketDao" %>
<%@ page import="dao.ServicebasketDao" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	<!-- 여기에 css 넣을지 생각해보기 --> 
</head>
<body>
	<h2>장바구니</h2>
	
	<table border="1">
        <thead>
            <tr>
                <th>상품 ID</th>
                <th>이미지</th>
                <th>이름</th>
                <th>수량</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <% 
            BasketDao basketDao = new BasketDao();
            ArrayList<BasketDao.BasketItem> basketItems = basketDao.getBasketItems();
            for (BasketDao.BasketItem basketItem : basketItems) { 
            %>
                <tr>
                    <td><%= basketItem.getPid() %></td>
                    <td><img src="<%= basketItem.getImage() %>" alt="<%= basketItem.getName() %>"></td>
                    <td><%= basketItem.getName() %></td>
                    <td><%= basketItem.getQuantity() %></td>
                    <td><%= basketItem.getPrice() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
	 <br>
    <form action="cart.jsp" method="get">
        <input type="submit" value="쇼핑 계속하기">
    </form>
    
    <% 
    String uid = (String)session.getAttribute("id");
    if (uid == null) { 
    %>
        <p>로그인이 필요한 서비스입니다.</p>
        <form action="login.html">
            <input type="submit" value="로그인">
        </form>
    <% } else { %>
        <p>총 금액: <%= basketDao.calculateTotalPrice(Integer.parseInt(uid)) %></p>
    <% } %>
    
</body>
</html>
