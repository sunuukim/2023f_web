package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class ChpassDao {
	public boolean update(String upass, String sid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			String sql="update user set pw=? where id = ?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, upass);
			stmt.setString(2, sid);
			
			int count=stmt.executeUpdate();
			return (count>0)? true:false;
		}finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean passck(String upw) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from user where pw=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1,upw);
			rs=stmt.executeQuery();
			return rs.next();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	public boolean idck(String uid) 
			throws NamingException, SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from user where id=?";
			conn=ConnectionPool.get();
			stmt=conn.prepareStatement(sql);
			
			stmt.setString(1,uid);
			rs=stmt.executeQuery();
			return rs.next();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
