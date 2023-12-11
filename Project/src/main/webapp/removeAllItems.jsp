<%@ page import="dao.ServicebasketDao" %>

<%
    ServicebasketDao servicebasketDao = new ServicebasketDao();
    String uid = (String)session.getAttribute("id");    

    servicebasketDao.deleteALLitems(String.valueOf(uid));

    response.sendRedirect("displayBasket.jsp");
%>
