<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BasketDao" %>
<%@ page import="dao.ServicebasketDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" type="text/css" href="designbasket.css">
    <script>
        function showLoginAlert() {
            alert("로그인이 필요한 서비스입니다.");
            window.location.href = "login.html";
        }
    </script>
</head>
<body>
    <header>ShoppingMall</header>
    <h2>장바구니</h2>

    <%
        String uid = (String) session.getAttribute("id");
        if (uid == null) {
    %>
        <script>
            showLoginAlert();
        </script>
    <% } else {
        BasketDao basketDao = new BasketDao();
        ArrayList<BasketDao.BasketItem> basketItems = basketDao.getBasketItems(uid);

        if (!basketItems.isEmpty()) {
    %>
            <!-- Your existing code for displaying the basket table -->
            <form action="removeItem.jsp" method="post">
                <!-- ... -->
            </form>
            <!-- ... -->
        <% } else { %>
            <p style="color: black;">장바구니가 비어 있습니다.</p>
        <% } %>
    <% } %>
</body>
</html>
