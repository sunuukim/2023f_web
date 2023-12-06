<%@ page import="dao.ServicebasketDao" %>
<%@ page improt="dao.BasketDao" %>

<%
    String[] selectedItems = request.getParameterValues("selectedItems");
	String uid=(String)session.getAttribute("id");
    if (selectedItems != null && selectedItems.length > 0) {
        ServicebasketDao servicebasketDao = new ServicebasketDao();

        for (String pid : selectedItems) {
            // 선택된 상품 삭제
            servicebasketDao.deleteItem(Integer.parseInt(uid), Integer.parseInt(pid));
        }
    }

    response.sendRedirect("displaybasket.jsp");
%>
