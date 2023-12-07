<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link href="testcss.css" rel="stylesheet">

<div class="header">
<form method=post action=mainpage.html>
<input type=submit value=쇼핑몰><br>
</form>
</div>

<div class="mainbar">
<table width=100%>
<tr>
<td width=20%><a href="./category.jsp">전체</a></td>
<td width=20%><a href="./category.jsp?c=식품">식품</a></td>
<td width=20%><a href="./category.jsp?c=생활용품">생활용품</a></td>
<td width=20%><a href="./category.jsp?c=패션의류">패션/의류</a></td>
<td width=20%><a href="./category.jsp?c=스포츠레저">스포츠/레저</a></td>
</tr>
</table>
</div>

</html>
