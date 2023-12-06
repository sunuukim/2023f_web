<%@ page import="dao.ServicebasketDao" %>

<%
    ServicebasketDao servicebasketDao = new ServicebasketDao();
	String uid=(String)session.getAttribute("id");	

    // 전체 상품 삭제
    servicebasketDao.deleteALLitems(Integer.parseInt(uid));

    response.sendRedirect("displaybasket.jsp");
%>
