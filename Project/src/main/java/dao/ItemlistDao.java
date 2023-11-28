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
