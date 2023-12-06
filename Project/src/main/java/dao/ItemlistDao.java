package dao;
import java.sql.*;
import javax.naming.NamingException;

import java.util.*;

public class ItemlistDao {
	
	public String listing(String t, int all) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select pid, name, category, price, image from item where ";
		try {
			if(all==1) {
				sql += "category=?";
			}
			else {
				sql += "type=?";
			}
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, t);
			rs = stmt.executeQuery();
			
			String result = "<table align=center cellpadding=10 cellspacing=10>";
			String str="<tr>";
			String img = "<tr>";
			int count = 0;
			while(rs.next()){
				str += "<td><a href='iteminfo.jsp?c="+ rs.getString("category") + "&pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원</td>";
				img += "<td width=200 height=200><a href='iteminfo.jsp?c="+ rs.getString("category") + "&pid=" + rs.getString("pid") +"'><img width=200 src='image/"+ rs.getString("image")+ "'></a></td>";
				count++;
				if(count!=0 && count%5==0) {
					result += img+"</tr>"+str+"</tr>";
					str = "<tr>";
					img = "<tr>";
				}
			}
			if(count%5!=0)result += img+"</tr>"+str+"</tr>";
			result += "</table>";
			if(count==0)result="";
			return result;
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
			String sql ="select name, category, price, explanation, image from item where pid=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, pid);
			rs = stmt.executeQuery();

			String str="<table cellpadding=10 cellspacing=10><tr>";
			if(rs.next()){
				String name = rs.getString("name");
				String price = rs.getString("price");
				String exp = rs.getString("explanation");
				String imgsrc = rs.getString("image");
				String c = rs.getString("category");
				
				str += "<td><img width=100% src='image/"+imgsrc+"'></td></tr></table>"
						+ "<table><tr><td colspan=2 class=pname>"+ name
						+ "</td></tr><tr><td colspan=2 class=explain>"+ exp +"</td></tr><tr><td class=price colspan=2>"+price+"원</td></tr>";
				str += "<tr><td><form action='cart.jsp' method='post'>"
						+ "<input type='hidden' name='pid' value="+ pid
						+"><input type='hidden' name='c' value="+ c +">수량선택<br><br>"
						+ "<input type='number' name='quantity' min='1' value='1' required>  개<br></td><td class=cartb>"
						+ "<input type='submit' value='장바구니에 담기'></form><br></td></tr>";
				str += "</table>";
			}
			else {
				str = null;
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
			String selectq = "select name, price, image from item where pid=?";
			String sql ="insert into cart(uid, pid, quantity, pname, price, image) values(?, ?, ?, ?, ?, ?)";
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
				stmti.setString(6, rs.getString("image"));
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
