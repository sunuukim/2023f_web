<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="util.ConnectionPool"%>
<%@ page import="dao.BasketDao"%>
<%@ page import="dao.ServicebasketDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<style>
section {
	background-color:white;
	display:flex;
	flex-direction:column;
	margin: 2em;
	padding: 3em 4em;
}
input[type="button"]{
	display:inline;
	width:45%;
	margin-left:auto;
	margin-right:auto;
}
span{
	margin: 0 1em;
	padding: 1em;
}
#title{
	background-color:black;
	color:white;
	font-weight:bold;
}
#integer{
	text-align: right;
}
table{
	
	width:100%;
}
td{
	border-bottom:dashed 1px gray;
}
th{
	background-color: gray;
	color:white;
}
#vir{
	display:none;
}
#depo{
display:none;
}
div{
padding-top:1em;
}
</style>
</head>
<body>
	<header> 주문/결제하기 </header>
	<%
	String sid = (String) session.getAttribute("id");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql = "select name, daddress, tel from user where id=?";
	conn = ConnectionPool.get();
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, sid);
	rs = stmt.executeQuery();
	String sna = "";
	String sdad = "";
	String stel = "";

	while (rs.next()) {
		sna = rs.getString("name");
		sdad = rs.getString("daddress");
		stel = rs.getString("tel");
	}
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();

	BasketDao basketDao = new BasketDao();
	ArrayList<BasketDao.BasketItem> basketItems = basketDao.getBasketItems(sid);
	int total = 0;
	int deliveryfee = 2500;
	%>

	<form action="finish.jsp" method="post">
		<section>
			<span id="title">배송지</span>
			<span><input type="text" name="daddress" size="50"
				value="<%=sdad%>">
			</span>
		</section>
		<section>
			<span id="title">주문자</span>
			<span>
				<%=sna%>(<%=stel%>)
				<input type="text" name="telnum" size="50"
				value="<%=stel%>">
			</span>
			<br>
		</section>
		<section>
			<span id="title">주문상품</span>
			<span>
			<table align="center">
				<thead>
					<tr>
						<th colspan=2>상품정보</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<%
				for (BasketDao.BasketItem basketItem : basketItems) {
				%>
				<tr>
					<td align="center"><img width=200
						src="image/<%=basketItem.getImage()%>"
						alt="<%=basketItem.getName()%>"></td>
					<td><%=basketItem.getName()%></td>
					<td><%=basketItem.getQuantity()%>개</td>
					<td id="integer"><%=basketItem.getPrice()%>원</td>
				</tr>
				<%
				total += basketItem.getPrice() * basketItem.getQuantity();
				}
				%>
			</table>
			</span>
		</section>
		<section>
			<span id="title">결제수단</span>
			<span>
				<input type="radio" name="paymethod" value="deposit" onclick='banknumber(event)'>무통장입금
				<input type="radio" name="paymethod" value="virtual" onclick='banknumber(event)'>가상계좌
				<div id="depo">
					입금계좌 : NH농협 111-1111-1111-11<br>
					예금주 : 홍길동<br>
					위 계좌로 24시간 내에 입금하셔야 배송이 시작됩니다<br>
				</div>
				<div id="vir">
				</div>
				<script>
				function banknumber(event){
					var virtual = document.getElementById("vir");
					var deposit = document.getElementById("depo");
					if(event.target.value=="deposit"){
						virtual.innerHTML = '';
						deposit.style.display="block";
					}else if(event.target.value=="virtual"){
						virtual.innerHTML='입금 기한 : 24시간<br>은행을 선택하세요<br>'
						+'<select name="bankname">'
						+'<option value="NH농협">NH농협</option>'
						+'<option value="우리은행">우리은행</option>'
						+'<option value="신한은행">신한은행</option>'
						+'<option value="하나은행">하나은행</option>'
						+'<option value="KB국민">KB국민은행</option>'
						+'<option value="기업은행">기업은행</option>'
						+'<option value="우체국">우체국</option>'
						+'<option value="카카오뱅크">카카오뱅크</option>'
						+'<option value="토스뱅크">토스뱅크</option>'
					+'</select>'
					+'<br><br>※ 결제를 완료하시면 가상계좌번호가 발급됩니다.<br>※ 주문금액을 정확히 입금하셔야 합니다.(입금금액이 다를 경우 입금되지 않습니다)';
						deposit.style.display="none";
						virtual.style.display="block";
					}
				}
				</script>
			</span>
		</section>
		<section>
		<span>
			<table align="center">
				<tr>
					<td>상품금액</td>
					<td id="integer"><%=total%>원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td id="integer"><%=deliveryfee%>원</td>
				</tr>
				<%
				total += deliveryfee;
				%>
				<tr>
					<th>주문금액</th>
					<th id="integer"><%=total%>원</th>
				</tr>
			</table>
		</span>
		</section>
			<input type="submit" value="결제하기">
			<input type=button
				value="주문취소" onclick="history.back()">
	</form>
</body>
</html>