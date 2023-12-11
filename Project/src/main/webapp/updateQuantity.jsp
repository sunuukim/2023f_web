<%@ page import="dao.BasketDao" %>
<%@ page import="java.util.ArrayList" %>

<%
    String uid = (String)session.getAttribute("id");
    BasketDao basketDao = new BasketDao();
    ArrayList<BasketDao.BasketItem> updatedBasketItems = basketDao.getBasketItems(uid);
    
    // HttpSession을 통해 새로운 장바구니 아이템 리스트를 저장
    session.setAttribute("basketItems", updatedBasketItems);
    response.sendRedirect("displaybasket.jsp");
%>