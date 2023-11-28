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
			String sql = "select pid, name, price from item where category=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, category);
			rs = stmt.executeQuery();

			//String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
			String str= "";
			int count = 0;
			while(rs.next())
			{
				if(count!=0 && count%5==0)str += "<tr>";
				str += "<td width=100><a href='iteminfo.jsp" + "?pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
				count++;
				if(count!=0 && count%5==0)str += "</tr>";
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
	
	public String listing(String t) throws NamingException, SQLException
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "select pid, name, price from item where type=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, t);
			rs = stmt.executeQuery();

			//String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
			String str="";
			int count = 0;
			while(rs.next())
			{
				if(count!=0 && count%5==0)str += "<tr>";
				str += "<td width=100><a href='iteminfo.jsp" + "?pid=" + rs.getString("pid") + "'>" + rs.getString("name") + "</a><br>" + rs.getString("price") + "원<br></td>";
				count++;
				if(count!=0 && count%5==0)str += "</tr>";
			}
			//str+="</table>";
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
			String sql ="select name, price, explanation from item where pid=?";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, pid);
			rs = stmt.executeQuery();

			String str="<table border=0 align=center cellpadding=20 cellspacing=20><tr>";
			if(rs.next()){
				String name = rs.getString("name");
				String price = rs.getString("price");
				String exp = rs.getString("explanation");
				str += "<td>"+name+"</td><tr><td>"+price+"원</td></tr><tr><td>"+ exp +"</td></tr>";
				str+="</table>";
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
		PreparedStatement stmt = null;

		try {
			String sql ="insert into cart(uid, pid, quantity) values(?, ?, ?)";
			conn = util.ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			stmt.setInt(2, pid);
			stmt.setInt(3, qu);
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if (stmt != null)stmt.close();
			if (conn != null)conn.close();
		}
	}
}

