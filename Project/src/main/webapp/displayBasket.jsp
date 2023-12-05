<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BasketDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
	BasketDao basketDao=new BasketDao();
	ArrayList<BasketDao.BasketItem> basketItems=basketDao.getBasketItems();
%>

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
        <% for (BasketDao.BasketItem basketItem : basketItems) { %>
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
