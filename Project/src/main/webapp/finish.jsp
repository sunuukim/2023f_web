<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="util.ConnectionPool"%>
<%@ page import="dao.ServicebasketDao"%>
<%@ page import="dao.ChdaddressDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="testcss.css" rel="stylesheet">
<title>결제완료</title>
<style>
h3 {
	text-align: center;
}

table {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

thead th {
	background-color: black;
	color: white;
	text-align: left;
	padding: 1em;
	font-size: larger;
	border-radius: 4px;
}

#time {
	text-align: center;
}

div {
	text-align: center;
}
</style>
</head>
<body>
	<%
	SimpleDateFormat payf = new SimpleDateFormat("yyyy/MM/dd HH:mm 결제완료");
	SimpleDateFormat delf = new SimpleDateFormat("yyyy/MM/dd 도착예정");
	Date now = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(now);
	cal.add(Calendar.DATE, 2);
	Date deldate = new Date(cal.getTimeInMillis());
	String paytime = payf.format(now);//결제완료날짜시간
	String deltime = delf.format(deldate);//도착예정일
	String newtel = request.getParameter("newtel");
	String msg = "무통장입금";
	String bn = "NH농협";
	String accountnum = "111-1111-1111-11<br>";
	if (request.getParameter("bankname") != null) {
		Random random = new Random();
		bn = request.getParameter("bankname");
		//임의의 숫자 2개+전화번호 합쳐서 가상계좌번호발급
		accountnum = String.valueOf(random.nextInt(90) + 10) + newtel + "<br>";
		msg = "가상계좌";
	}
	//msg += "24시간 내에 입금하지 않으면 주문이 취소됩니다<br>";

	String uid = (String) session.getAttribute("id");
	ServicebasketDao updatedao = new ServicebasketDao();
	String newaddr = request.getParameter("newaddr");
	String daddr = request.getParameter("daddr");
	String updateA = request.getParameter("updateA");
	String total = request.getParameter("total");

	if (updatedao.updateDelivery(uid, 1)) {//배송상태 1로 변경
	%>
	<h3>결제가 완료되었습니다</h3>
	<hr>
	<table>
		<thead>
			<tr>
				<th colspan="2">결제정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="time" colspan="2"><%=paytime%></td>
			</tr>
			<tr>
				<td>주문금액</td>
				<td><%=total%>원</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td><%=msg%></td>
			</tr>
			<tr>
				<td><%=bn%></td>
				<td><%=accountnum%></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">24시간 내에 입금하지 않으면 주문이 취소됩니다
				<td>
			</tr>
		</tfoot>
	</table>
	<table>
		<thead>
			<tr>
				<th colspan="2">배송정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="time" colspan="2"><%=deltime%></td>
			</tr>
			<tr>
				<td>주문자 연락처</td>
				<td><%=newtel%></td>
			</tr>
			<tr>
				<td>배송지</td>
				<td><%=newaddr%></td>
			</tr>
		</tbody>

		<%
		msg = "";
		if (updateA != null && updateA.equals("True")) {
			//out.print("배송지변경테스트");
			if (newaddr.equals(daddr) == false) {
				ChdaddressDao addrdao = new ChdaddressDao();
				if (addrdao.update(newaddr, uid)) {
			msg = "* 기본 배송지로 저장되었습니다";
				} else {
			msg = "* 기본 배송지 변경에 문제가 발생하여 업데이트 실패";
				}
			}
		}
		%>
		<tfoot>
			<tr>
				<td colspan="2"><%=msg%>
				<td>
			</tr>
		</tfoot>
	</table>
	<br>


	<div>
		<input type='button' value="확인"
			onclick="location.href='displayBasket.jsp'"> <input
			type='button' value="주문상세" onclick="location.href='mypage.jsp'">
	</div>

	<%
	} else {
	out.print("결제 도중 오류가 발생했습니다.<br>다시 시도해주세요.");
	%>
	<br>
	<div>
		<input type="button" value="다시 결제하기" onclick="history.back()">
	</div>
	<%
	}
	%>
</body>
</html>