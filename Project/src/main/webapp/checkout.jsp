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
	background-color: white;
	display: flex;
	flex-direction: column;
	margin: 2em;
	padding: 3em 4em;
}

section[id="btn"] {
	display: flex;
	flex-direction: row;
	margin: 2em;
	padding: 3em 4em;
}

input[type="button"], input[type="submit"] {
	display: inline;
	width: 50%;
}

span {
	margin: 0 1em;
	padding: 1em;
}

#title {
	background-color: #333;
	color: white;
	font-weight: bold;
	font-size: 15pt;
}

#integer {
	text-align: right;
}
.big{
	font-size:x-large;
	font-wieght:bold;
}
table {
	width: 100%;
}
table[id="integer"]{
	border-collapse: collapse;
}
td {
	border-bottom: dashed 1px gray;
	padding: 5px;
}

th {
	background-color: #333;
	color: white;
	font-size: 13pt;
}

div {
	padding-top: 1em;
}
</style>
<link href="./testcss.css" rel="stylesheet">
</head>
<body>
	<header>
		<a href="mainpage.jsp">Shoppingmall</a> | 주문 / 결제하기
	</header>
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
			<span id="title">배송지 입력</span> <span><input type="text"
				name="newaddr" size="50" value="<%=sdad%>"> <input
				type="hidden" name="daddr" value="<%=sdad%>"> <br>
			<input type="checkbox" name="updateA" value="True">기본 배송지로 저장</span>
		</section>
		<section>
			<span id="title">주문자 정보</span>
			<span>
				<table>
				<tr><td>주문자</td><td><input type="text" name="newname" size="10" value="<%=sna%>"></td></tr>
				<tr><td>연락처</td><td><input type="text" name="newtel" size="20" value="<%=stel%>"></td></tr>
				</table>
				<input type="hidden" name="tel" value="<%=stel%>">
			</span> <br>
		</section>
		<section>
			<span id="title">주문상품</span> <span>
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
					<tr><td class="big" id="integer" colspan="4">총 <%=total%>원</td></tr>
				</table>
			</span>
		</section>
		<section>
			<span id="title">결제수단 선택</span> <span> <input type="radio"
				name="paymethod" value="deposit" onclick='banknumber(event)' checked>무통장입금
				<input type="radio" name="paymethod" value="virtual"
				onclick='banknumber(event)'>가상계좌
				<div id="vir">
					입금계좌 : NH농협 111-1111-1111-11<br>예금주 : 홍길동<br>
					<br>※ 위 계좌로 24시간 내에 입금하셔야 배송이 시작됩니다.<br>
				</div> <script>
					function banknumber(event) {
						var virtual = document.getElementById("vir");
						//var deposit = document.getElementById("depo");
						if (event.target.value == "deposit") {
							virtual.innerHTML = '입금계좌 : NH농협 111-1111-1111-11<br>예금주 : 홍길동<br><br>※ 위 계좌로 24시간 내에 입금하셔야 배송이 시작됩니다.<br>';
						} else if (event.target.value == "virtual") {
							virtual.innerHTML = '입금 기한 : 24시간<br>은행을 선택하세요<br>'
									+ '<select name="bankname">'
									+ '<option value="NH농협">NH농협</option>'
									+ '<option value="우리은행">우리은행</option>'
									+ '<option value="신한은행">신한은행</option>'
									+ '<option value="하나은행" selected>하나은행</option>'
									+ '<option value="KB국민">KB국민은행</option>'
									+ '<option value="기업은행">기업은행</option>'
									+ '<option value="우체국">우체국</option>'
									+ '<option value="카카오뱅크">카카오뱅크</option>'
									+ '<option value="토스뱅크">토스뱅크</option>'
									+ '</select>'
									+ '<br><br>※ 결제를 완료하시면 가상계좌번호가 발급됩니다.<br>※ 주문금액을 정확히 입금하셔야 합니다.(입금금액이 다를 경우 입금되지 않습니다)';
						}
					}
				</script>
			</span>
		</section>
		<section>
			<span>
				<table id="integer" align="center">
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
						<th class="big">주문금액</th>
						<th class="big" id="integer"><%=total%>원</th>
					</tr>
				</table>
			</span>
		</section>
		<section id="btn">
			<input type="hidden" name="total" value=<%=total%>> <input
				type="submit" value="결제하기"> <input type=button value="주문취소"
				onclick="history.back()">
		</section>
	</form>
	<footer>
		<p>&Korea.uni.ShoppingMall</p>
	</footer>
</body>
</html>