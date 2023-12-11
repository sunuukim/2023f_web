<%@ page import="dao.ServicebasketDao" %>
<%@ page import="dao.BasketDao" %>

<%
    String[] selectedItems = request.getParameterValues("selectedItems");
   String uid=(String)session.getAttribute("id");
    if (selectedItems != null && selectedItems.length > 0) {
        ServicebasketDao servicebasketDao = new ServicebasketDao();

        for (String pid : selectedItems) {
            servicebasketDao.deleteItem(String.valueOf(uid), Integer.valueOf(pid));
        }
    }

    response.sendRedirect("displayBasket.jsp");
%>
