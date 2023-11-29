package dao;
import java.sql.*;
import javax.naming.NamingException;

import java.util.*;

public class ItemlistDao {
	public String listingall(String category) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "select pid, name, price, image from item where category=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, category);
			rs = stmt.executeQuery();

			String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
			int count = 0;
			while(rs.next())
			{
				if(count!=0 && count%5==0)str += "<tr>";
				str += "<td width=200><img width=200 src='image/"+ rs.getString("image") + "'><a href='iteminfo.jsp" + "?pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
				count++;
				if(count!=0 && count%5==0)str += "</tr>";
			}
			str+="</table>";
			return str;
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			if(rs!=null)rs.close();
		}
	}
	
	public String listing(String t) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "select pid, name, price, image from item where type=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, t);
			rs = stmt.executeQuery();

			String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
			int count = 0;
			while(rs.next())
			{
				if(count!=0 && count%5==0)str += "<tr>";
				str += "<td width=200><img width=200 src='image/"+ rs.getString("image")+ "'><a href='iteminfo.jsp" + "?pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
				count++;
				if(count!=0 && count%5==0)str += "</tr>";
			}
			str+="</table>";
			return str;
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			if(rs!=null)rs.close();
		}
	}
	
	public String info(int pid) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql ="select name, price, explanation, image from item where pid=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, pid);
			rs = stmt.executeQuery();

			String str="<table width=100% align=center cellpadding=20 cellspacing=10><tr>";
			if(rs.next()){
				String name = rs.getString("name");
				String price = rs.getString("price");
				String exp = rs.getString("explanation");
				String imgsrc = rs.getString("image");
				str += "<td width=50% rowspan=3><img width=100% src='image/"+imgsrc+"'></td><td height=80 colspan=2>"+ name
						+ "</td></tr><tr><td colspan=2>"+ price +"원</td></tr>";
				str += "<tr><td><form action='cart.jsp' method='post'>"
						+ "<input type='hidden' name='pid' value="+ pid
						+">수량선택 "
						+ "<input type='number' name='quantity' min='1' value='1' style='width:50px;' required></td>"
						+ "<td height=50 align=right><input type='submit' value='장바구니에 담기'></form></td></tr>";
				str += "<tr><td>"+exp+"</td></tr></table>";
			}
			return str;
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			if(rs!=null)rs.close();
		}
	}
	
	public boolean intoCart(int pid, int qu, String uid) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmts = null;
		PreparedStatement stmti = null;
		ResultSet rs = null;

		try {
			String selectq = "select name, price from item where pid=?";
			String sql ="insert into cart(uid, pid, quantity, pname, price) values(?, ?, ?, ?, ?)";
			conn = util.ConnectionPool.get();
			stmts = conn.prepareStatement(selectq);
			
			stmts.setInt(1, pid);
			rs = stmts.executeQuery();
			
			if(rs.next()) {
				stmti = conn.prepareStatement(sql);
				stmti.setString(1, uid);
				stmti.setInt(2, pid);
				stmti.setInt(3, qu);
				stmti.setString(4, rs.getString("name"));
				stmti.setInt(5, rs.getInt("price"));
			}
			else {
				return false;
			}
			int count = stmti.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(rs!=null)rs.close();
			if (stmti != null)stmti.close();
			if(stmts!=null)stmts.close();
			if (conn != null)conn.close();
		}
	}
}

