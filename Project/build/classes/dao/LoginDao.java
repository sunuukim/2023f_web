package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class LoginDao {
	public boolean exists(String uid, String upass) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select id,pw from user where id=? and pw=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1,uid);
			stmt.setString(2,upass);
			
			rs=stmt.executeQuery();
			return rs.next();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean deluser(String uid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			String sql="delete from user where id = ?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			
			int count=stmt.executeUpdate();
			return (count>0)? true:false;
		}finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean delcart(String uid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			String sql="delete from cart where uid = ?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			
			int count=stmt.executeUpdate();
			return (count>0)? true:false;
		}finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
