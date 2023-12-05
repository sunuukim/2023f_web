<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ServicebasketDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
	//uid를 먼저 확인한 후, 정바구니에 저장해야하는지 고려해보기
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	String image=request.getParameter("image");
	String name=request.getParameter("name");
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	double price=Double.parseDouble(request.getParameter("price"));
	
	ServicebasketDao servicebasketDao=new ServicebasketDao();
	boolean addedToBasket=servicebasketDao.addToBasket(uid, pid, image, name, quantity, price);
	
	response.sendRedirect("basket.html");
%>
